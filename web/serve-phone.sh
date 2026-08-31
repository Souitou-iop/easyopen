#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-8765}"
ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v adb >/dev/null 2>&1; then
  echo "找不到 adb，请先安装 Android platform-tools。" >&2
  exit 1
fi

if ! adb get-state >/dev/null 2>&1; then
  echo "没有可用的 adb 设备。请通过 USB 或无线 ADB 连接手机，并确认 adb devices 能看到 device。" >&2
  exit 1
fi

adb reverse "tcp:${PORT}" "tcp:${PORT}"
echo "已建立本地 ADB 隧道：手机 localhost:${PORT} -> 电脑 localhost:${PORT}"
echo "请在手机 Chrome 打开：http://localhost:${PORT}/easyopen.html"
echo "按 Ctrl+C 停止本地页面服务。"

cd "$ROOT_DIR"
exec python3 -m http.server "$PORT" --bind 127.0.0.1
