const SERVICE_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e";
const WRITE_UUID = "6e400002-b5a3-f393-e0a9-e50e24dcca9e";
const NOTIFY_UUID = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";

const $ = (id) => document.getElementById(id);
const els = {
  secureBadge: $("secure-badge"),
  heroTitle: $("hero-title"),
  heroSubtitle: $("hero-subtitle"),
  unlockButton: $("unlock-button"),
  unlockLabel: $("unlock-label"),
  stateText: $("state-text"),
  selectButton: $("select-button"),
  reconnectButton: $("reconnect-button"),
  deviceName: $("device-name"),
  deviceId: $("device-id"),
  connectionDot: $("connection-dot"),
  password: $("password"),
  attribute: $("attribute"),
  openTime: $("open-time"),
  waitTime: $("wait-time"),
  closeTime: $("close-time"),
  diagnostic: $("diagnostic-output"),
  toast: $("toast"),
};

let device = null;
let server = null;
let writeCharacteristic = null;
let notifyCharacteristic = null;
let state = "idle";
let toastTimer = null;

function setState(next, message = "") {
  state = next;
  document.body.dataset.state = next;
  const connected = next === "ready" || next === "unlocking" || next === "success";
  els.connectionDot.classList.toggle("connected", connected);
  els.unlockButton.disabled = next !== "ready" || !els.password.value.trim();
  els.reconnectButton.disabled = !device || next === "connecting" || next === "unlocking";
  els.unlockLabel.textContent = next === "unlocking" ? "处理中" : "开门";
  els.stateText.textContent = message || ({
    idle: "尚未连接",
    connecting: "正在连接…",
    ready: "蓝牙已就绪",
    unlocking: "正在发送安全指令…",
    success: "开门成功",
    error: "操作失败",
  }[next] || next);
}

function notify(message, isError = false) {
  els.toast.textContent = message;
  els.toast.classList.toggle("error", isError);
  els.toast.classList.add("show");
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => els.toast.classList.remove("show"), 3200);
}

function updateEnvironment() {
  const supported = "bluetooth" in navigator;
  const secure = window.isSecureContext;
  const isAndroid = /Android/i.test(navigator.userAgent);
  const isDesktopLinux = /Linux/i.test(navigator.userAgent) && !isAndroid;
  let guidance = "";

  if (supported && secure) {
    els.secureBadge.textContent = "环境可用";
    els.secureBadge.dataset.status = "ok";
    els.secureBadge.style.color = "";
    guidance = "Web Bluetooth 已暴露，可以点击选择设备。";
  } else if (!secure) {
    els.secureBadge.textContent = "需要 HTTPS";
    els.secureBadge.dataset.status = "error";
    els.secureBadge.style.color = "";
    guidance = "请通过 HTTPS 打开；开发时使用 localhost。";
  } else {
    els.secureBadge.textContent = "未启用 Web Bluetooth";
    els.secureBadge.dataset.status = "error";
    els.secureBadge.style.color = "";
    guidance = isDesktopLinux
      ? "Linux Chrome 需要打开 chrome://flags/#experimental-web-platform-features 并重启浏览器。"
      : "请改用支持 Web Bluetooth 的 Chromium/Android Chrome。";
  }

  // Keep this button clickable so an unsupported environment explains itself
  // instead of looking like a dead control.
  els.selectButton.disabled = false;
  els.diagnostic.textContent = [
    `页面: ${window.location.href}`,
    `安全上下文: ${secure ? "是" : "否"}`,
    `navigator.bluetooth: ${supported ? "可用" : "不可用"}`,
    `平台: ${navigator.userAgent}`,
    guidance,
  ].join("\n");

  if (!supported || !secure) {
    els.heroTitle.textContent = !secure ? "请使用 HTTPS 打开" : "先启用浏览器蓝牙能力";
    els.heroSubtitle.textContent = guidance;
  }
}

function profileFromForm() {
  return {
    password: els.password.value,
    attribute: Number(els.attribute.value),
    openTime: clampNumber(els.openTime.value, 650),
    waitTime: clampNumber(els.waitTime.value, 2000),
    closeTime: clampNumber(els.closeTime.value, 600),
  };
}

function clampNumber(value, fallback) {
  const number = Number.parseInt(value, 10);
  return Number.isFinite(number) ? Math.max(0, Math.min(60000, number)) : fallback;
}

function isHex(value, length) {
  return new RegExp(`^[0-9a-fA-F]{${length}}$`).test(value);
}

async function md5Hex(value) {
  // The browser's built-in digest API supports SHA-*, not MD5. This compact
  // implementation is used only to reproduce the legacy opener protocol.
  const bytes = new TextEncoder().encode(value);
  const bitLength = bytes.length * 8;
  const paddedLength = (((bytes.length + 8) >> 6) + 1) * 64;
  const data = new Uint8Array(paddedLength);
  data.set(bytes);
  data[bytes.length] = 0x80;
  const view = new DataView(data.buffer);
  view.setUint32(paddedLength - 8, bitLength >>> 0, true);
  view.setUint32(paddedLength - 4, Math.floor(bitLength / 0x100000000), true);

  let a0 = 0x67452301;
  let b0 = 0xefcdab89;
  let c0 = 0x98badcfe;
  let d0 = 0x10325476;
  const shifts = [7, 12, 17, 22, 5, 9, 14, 20, 4, 11, 16, 23, 6, 10, 15, 21];
  const constants = Array.from({ length: 64 }, (_, i) => Math.floor(Math.abs(Math.sin(i + 1)) * 0x100000000) >>> 0);
  const leftRotate = (x, amount) => ((x << amount) | (x >>> (32 - amount))) >>> 0;

  for (let offset = 0; offset < data.length; offset += 64) {
    const words = Array.from({ length: 16 }, (_, i) => view.getUint32(offset + i * 4, true));
    let a = a0, b = b0, c = c0, d = d0;
    for (let i = 0; i < 64; i++) {
      let f, g;
      if (i < 16) { f = (b & c) | ((~b) & d); g = i; }
      else if (i < 32) { f = (d & b) | ((~d) & c); g = (5 * i + 1) % 16; }
      else if (i < 48) { f = b ^ c ^ d; g = (3 * i + 5) % 16; }
      else { f = c ^ (b | (~d)); g = (7 * i) % 16; }
      const next = (a + f + constants[i] + words[g]) >>> 0;
      const rotated = (leftRotate(next, shifts[(i % 4) + 4 * Math.floor(i / 16)]) + b) >>> 0;
      a = d; d = c; c = b; b = rotated;
    }
    a0 = (a0 + a) >>> 0;
    b0 = (b0 + b) >>> 0;
    c0 = (c0 + c) >>> 0;
    d0 = (d0 + d) >>> 0;
  }
  const output = new DataView(new ArrayBuffer(16));
  output.setUint32(0, a0, true); output.setUint32(4, b0, true);
  output.setUint32(8, c0, true); output.setUint32(12, d0, true);
  return Array.from(new Uint8Array(output.buffer), (byte) => byte.toString(16).padStart(2, "0")).join("");
}

async function passwordToken(password) {
  if (isHex(password, 16)) return password;
  if (isHex(password, 32)) return password.slice(8, 24);
  const digest = await md5Hex(password);
  return digest.slice(8, 24);
}

async function aesEcbZeroPadded(plaintext) {
  const key = await crypto.subtle.importKey("raw", new TextEncoder().encode("Fx4k6AWivOsLE4NI"), { name: "AES-CBC" }, false, ["encrypt"]);
  const zeroIv = new Uint8Array(16);
  const output = new Uint8Array(plaintext.length);
  for (let offset = 0; offset < plaintext.length; offset += 16) {
    const block = plaintext.slice(offset, offset + 16);
    // AES-CBC with a zero IV on one isolated block has the same first block
    // as AES-ECB. WebCrypto has AES-CBC but intentionally does not expose ECB.
    const encrypted = new Uint8Array(await crypto.subtle.encrypt({ name: "AES-CBC", iv: zeroIv }, key, block));
    output.set(encrypted.slice(0, 16), offset);
  }
  return output;
}

async function buildOpenPacket(profile) {
  if (!profile.password.trim()) throw new Error("请先输入开门器密码");
  const token = await passwordToken(profile.password);
  const sign = profile.attribute === 1 ? "-" : "+";
  const command = `A:OPEN;P:${sign} ${profile.openTime},${profile.waitTime},${profile.closeTime};`;
  const body = new TextEncoder().encode(`${Math.floor(Date.now() / 1000)}${token}${command}`);
  const padded = new Uint8Array(Math.ceil(body.length / 16) * 16);
  padded.set(body);
  return aesEcbZeroPadded(padded);
}

function printableText(bytes) {
  return new TextDecoder("utf-8", { fatal: false }).decode(bytes)
    .split("").filter((char) => char === "\t" || char === "\n" || char === "\r" || (char >= " " && char <= "~"))
    .join("").trim();
}

function hex(bytes) {
  return Array.from(bytes, (byte) => byte.toString(16).padStart(2, "0")).join("").toUpperCase();
}

function parseResponse(dataView) {
  const bytes = new Uint8Array(dataView.buffer, dataView.byteOffset, dataView.byteLength);
  const text = printableText(bytes);
  const hexValue = hex(bytes);
  const upper = text.toUpperCase();
  return {
    bytes,
    text,
    hex: hexValue,
    success: upper.includes("OK") || hexValue.includes("4F4B"),
    summary: text || `HEX ${hexValue}`,
  };
}

function onNotification(event) {
  const response = parseResponse(event.target.value);
  els.diagnostic.textContent = `响应文本: ${response.text || "<空>"}\n响应 HEX: ${response.hex}`;
  if (state !== "unlocking") return;
  if (response.success) {
    setState("success", `开门成功 · ${response.summary}`);
    notify(`开门成功 · ${response.summary}`);
  } else {
    setState("error", `设备返回：${response.summary}`);
    notify(`设备返回：${response.summary}`, true);
  }
}

async function connectSelectedDevice() {
  if (!device) throw new Error("还没有选择设备");
  setState("connecting");
  server = device.gatt.connected ? device.gatt : await device.gatt.connect();
  const service = await server.getPrimaryService(SERVICE_UUID);
  writeCharacteristic = await service.getCharacteristic(WRITE_UUID);
  notifyCharacteristic = await service.getCharacteristic(NOTIFY_UUID);
  notifyCharacteristic.removeEventListener("characteristicvaluechanged", onNotification);
  notifyCharacteristic.addEventListener("characteristicvaluechanged", onNotification);
  await notifyCharacteristic.startNotifications();
  device.addEventListener("gattserverdisconnected", onDisconnected);
  setState("ready", "蓝牙已就绪");
  els.diagnostic.textContent = `设备: ${device.name || "未命名设备"}\n设备 ID: ${device.id}\n服务: ${SERVICE_UUID}\n写入: ${WRITE_UUID}\n通知: ${NOTIFY_UUID}`;
}

function onDisconnected() {
  server = null;
  writeCharacteristic = null;
  notifyCharacteristic = null;
  if (state !== "success") setState("error", "蓝牙连接已断开");
}

async function selectDevice() {
  if (!window.isSecureContext) {
    const message = "当前页面不是安全上下文，请使用 HTTPS 或 localhost 打开。";
    setState("error", message);
    notify(message, true);
    return;
  }
  if (!("bluetooth" in navigator)) {
    const isDesktopLinux = /Linux/i.test(navigator.userAgent) && !/Android/i.test(navigator.userAgent);
    const message = isDesktopLinux
      ? "当前 Linux Chrome 未启用 Web Bluetooth，请打开 chrome://flags/#experimental-web-platform-features，启用后重启浏览器。"
      : "当前浏览器没有 Web Bluetooth 支持，请使用 Android Chrome 或支持该 API 的 Chromium 浏览器。";
    setState("error", message);
    notify(message, true);
    return;
  }
  try {
    // The original service is a Nordic UART-compatible custom GATT service.
    // The chooser is intentionally user-triggered; Web Bluetooth does not
    // expose a webpage-controlled MAC-address scan.
    device = await navigator.bluetooth.requestDevice({
      // The original app recognized some units from scan-response bytes rather
      // than a service UUID. Let Chrome show the chooser and validate the
      // Nordic UART service after the user selects a device.
      acceptAllDevices: true,
      optionalServices: [SERVICE_UUID],
    });
    els.deviceName.textContent = device.name || "未命名设备";
    els.deviceId.textContent = `浏览器设备 ID：${device.id}`;
    await connectSelectedDevice();
  } catch (error) {
    if (error?.name === "NotFoundError") return;
    setState("error", error?.message || "选择设备失败");
    notify(error?.message || "选择设备失败", true);
  }
}

async function reconnect() {
  try {
    await connectSelectedDevice();
  } catch (error) {
    setState("error", error?.message || "重新连接失败");
    notify(error?.message || "重新连接失败", true);
  }
}

async function unlock() {
  try {
    if (!writeCharacteristic || state !== "ready") throw new Error("请先连接设备");
    const packet = await buildOpenPacket(profileFromForm());
    setState("unlocking");
    els.diagnostic.textContent = `发送字节数: ${packet.length}\n写入方式: ${writeCharacteristic.properties.writeWithoutResponse ? "without response" : "with response"}`;
    if (writeCharacteristic.properties.writeWithoutResponse && "writeValueWithoutResponse" in writeCharacteristic) {
      await writeCharacteristic.writeValueWithoutResponse(packet);
    } else {
      await writeCharacteristic.writeValue(packet);
    }
    setTimeout(() => {
      if (state === "unlocking") {
        setState("error", "设备无响应，请稍后重试");
        notify("设备无响应，请稍后重试", true);
      }
    }, 8000);
  } catch (error) {
    setState("error", error?.message || "开门失败");
    notify(error?.message || "开门失败", true);
  }
}

els.selectButton.addEventListener("click", selectDevice);
els.reconnectButton.addEventListener("click", reconnect);
els.unlockButton.addEventListener("click", unlock);
els.password.addEventListener("input", () => {
  if (state === "ready") els.unlockButton.disabled = !els.password.value.trim();
});
window.addEventListener("beforeunload", () => {
  try { if (server) server.disconnect(); } catch (_) { /* no-op */ }
});

updateEnvironment();
setState("idle");

if ("serviceWorker" in navigator && window.isSecureContext) {
  navigator.serviceWorker.register("./sw.js").catch((error) => {
    console.warn("EasyOpen PWA cache unavailable:", error);
  });
}
