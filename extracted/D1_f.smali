.class public final LD1/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Landroid/bluetooth/BluetoothAdapter;

.field public c:Landroid/bluetooth/le/BluetoothLeScanner;

.field public d:Landroid/bluetooth/BluetoothGatt;

.field public e:Landroid/bluetooth/BluetoothDevice;

.field public f:Landroid/bluetooth/BluetoothGattCharacteristic;

.field public g:Landroid/bluetooth/BluetoothGattCharacteristic;

.field public h:Z

.field public i:I

.field public j:Z

.field public k:Z

.field public final l:Landroid/os/Handler;

.field public final m:LD1/b;

.field public final n:LD1/d;

.field public final o:Ljava/util/concurrent/CopyOnWriteArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, LD1/f;->h:Z

    iput v0, p0, LD1/f;->i:I

    const/4 v1, 0x1

    iput-boolean v1, p0, LD1/f;->j:Z

    iput-boolean v0, p0, LD1/f;->k:Z

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, LD1/f;->l:Landroid/os/Handler;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, LD1/f;->a:Landroid/content/Context;

    invoke-virtual {p0}, LD1/f;->d()V

    new-instance p1, LD1/b;

    const/4 v0, 0x0

    invoke-direct {p1, v0, p0}, LD1/b;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, LD1/f;->m:LD1/b;

    new-instance p1, LD1/d;

    invoke-direct {p1, p0}, LD1/d;-><init>(LD1/f;)V

    iput-object p1, p0, LD1/f;->n:LD1/d;

    return-void
.end method


# virtual methods
.method public final a(LD1/e;)V
    .registers 4

    if-eqz p1, :cond_d

    iget-object v0, p0, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public final b(Lcom/macronum/bledemo/model/BluetoothDevice;)V
    .registers 6

    iget-object v0, p0, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    if-eqz p1, :cond_b5

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_b5

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_16

    goto/16 :goto_b5

    :cond_16
    iget-object v1, p0, LD1/f;->b:Landroid/bluetooth/BluetoothAdapter;

    if-nez v1, :cond_31

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LD1/e;

    const-string v1, "\u84dd\u7259\u9002\u914d\u5668\u4e0d\u53ef\u7528"

    invoke-interface {v0, v1}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_1e

    :cond_30
    return-void

    :cond_31
    :try_start_31
    iget-object v1, p0, LD1/f;->e:Landroid/bluetooth/BluetoothDevice;

    if-eqz v1, :cond_4b

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, LD1/f;->e:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    return-void

    :catch_49
    move-exception p1

    goto :goto_87

    :cond_4b
    iget-boolean v1, p0, LD1/f;->j:Z

    if-eqz v1, :cond_52

    invoke-virtual {p0}, LD1/f;->h()V

    :cond_52
    iget-object v1, p0, LD1/f;->b:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    if-nez p1, :cond_75

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_62
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_74

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LD1/e;

    const-string v2, "\u65e0\u6cd5\u83b7\u53d6\u7cfb\u7edf\u8bbe\u5907\u5bf9\u8c61"

    invoke-interface {v1, v2}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_62

    :cond_74
    return-void

    :cond_75
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    iget-object v1, p0, LD1/f;->a:Landroid/content/Context;

    iget-object v2, p0, LD1/f;->n:LD1/d;

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3, v2}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_86} :catch_49

    goto :goto_b4

    :goto_87
    const-string v1, "BluetoothManager"

    const-string v2, "\u8fde\u63a5\u8bbe\u5907\u5931\u8d25"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_92
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LD1/e;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u8fde\u63a5\u8bbe\u5907\u5931\u8d25: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_92

    :cond_b4
    :goto_b4
    return-void

    :cond_b5
    :goto_b5
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_b9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_cb

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LD1/e;

    const-string v1, "\u8bbe\u5907\u4e3a\u7a7a\u6216\u5730\u5740\u65e0\u6548"

    invoke-interface {v0, v1}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_b9

    :cond_cb
    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_10

    :try_start_4
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_7} :catch_8

    goto :goto_10

    :catch_8
    move-exception v0

    const-string v1, "BluetoothManager"

    const-string v2, "\u65ad\u5f00\u8fde\u63a5\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_10
    :goto_10
    return-void
.end method

.method public final d()V
    .registers 4

    :try_start_0
    iget-object v0, p0, LD1/f;->a:Landroid/content/Context;

    const-string v1, "bluetooth"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothManager;

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, LD1/f;->b:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothLeScanner()Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object v0

    iput-object v0, p0, LD1/f;->c:Landroid/bluetooth/le/BluetoothLeScanner;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1a} :catch_1b

    goto :goto_23

    :catch_1b
    move-exception v0

    const-string v1, "BluetoothManager"

    const-string v2, "Failed to initialize Bluetooth"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_23
    :goto_23
    return-void
.end method

.method public final e()Z
    .registers 3

    iget-object v0, p0, LD1/f;->b:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    if-nez v0, :cond_21

    iget-object v1, p0, LD1/f;->b:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_1e

    :cond_1c
    const-string v1, "N/A"

    :goto_1e
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_21
    return v0
.end method

.method public final f(LD1/e;)V
    .registers 3

    if-eqz p1, :cond_7

    iget-object v0, p0, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    :cond_7
    return-void
.end method

.method public final g()V
    .registers 10

    iget-object v0, p0, LD1/f;->l:Landroid/os/Handler;

    invoke-virtual {p0}, LD1/f;->e()Z

    move-result v1

    iget-object v2, p0, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    const-string v3, "BluetoothManager"

    if-nez v1, :cond_28

    const-string v0, "\u84dd\u7259\u672a\u5f00\u542f"

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LD1/e;

    const-string v2, "\u84dd\u7259\u672a\u5f00\u542f\uff0c\u8bf7\u6253\u5f00\u84dd\u7259\u540e\u91cd\u8bd5"

    invoke-interface {v1, v2}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_15

    :cond_27
    return-void

    :cond_28
    iget-boolean v1, p0, LD1/f;->k:Z

    const/4 v4, 0x0

    if-eqz v1, :cond_41

    :try_start_2d
    iget-object v1, p0, LD1/f;->c:Landroid/bluetooth/le/BluetoothLeScanner;

    if-eqz v1, :cond_3f

    iget-object v5, p0, LD1/f;->m:LD1/b;

    if-eqz v5, :cond_3f

    invoke-virtual {v1, v5}, Landroid/bluetooth/le/BluetoothLeScanner;->stopScan(Landroid/bluetooth/le/ScanCallback;)V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_38} :catch_39

    goto :goto_3f

    :catch_39
    move-exception v1

    const-string v5, "Stop old scan failed"

    invoke-static {v3, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3f
    :goto_3f
    iput-boolean v4, p0, LD1/f;->k:Z

    :cond_41
    const/4 v1, 0x0

    :try_start_42
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_45} :catch_46

    goto :goto_4c

    :catch_46
    move-exception v5

    const-string v6, "\u6e05\u7406handler\u56de\u8c03\u5931\u8d25"

    invoke-static {v3, v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4c
    :try_start_4c
    iget-object v5, p0, LD1/f;->b:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v5, :cond_73

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothLeScanner()Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object v5

    if-eqz v5, :cond_5b

    iput-object v5, p0, LD1/f;->c:Landroid/bluetooth/le/BluetoothLeScanner;

    goto :goto_73

    :catch_59
    move-exception v5

    goto :goto_6e

    :cond_5b
    const-string v5, "\u84dd\u7259\u626b\u63cf\u5668\u4e3anull\uff0c\u5c1d\u8bd5\u91cd\u65b0\u521d\u59cb\u5316"

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, LD1/f;->d()V

    iget-object v5, p0, LD1/f;->b:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v5, :cond_73

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothLeScanner()Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object v5

    iput-object v5, p0, LD1/f;->c:Landroid/bluetooth/le/BluetoothLeScanner;
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_6d} :catch_59

    goto :goto_73

    :goto_6e
    const-string v6, "Get Bluetooth scanner error"

    invoke-static {v3, v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_73
    :goto_73
    iget-object v5, p0, LD1/f;->c:Landroid/bluetooth/le/BluetoothLeScanner;

    if-nez v5, :cond_93

    const-string v0, "Bluetooth scanner is null, cannot start scan"

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_80
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_92

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LD1/e;

    const-string v2, "\u84dd\u7259\u626b\u63cf\u5668\u4e0d\u53ef\u7528"

    invoke-interface {v1, v2}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_80

    :cond_92
    return-void

    :cond_93
    iget-object v5, p0, LD1/f;->m:LD1/b;

    if-nez v5, :cond_b3

    const-string v0, "Scan callback is null, cannot start scan"

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LD1/e;

    const-string v2, "\u626b\u63cf\u56de\u8c03\u4e0d\u53ef\u7528"

    invoke-interface {v1, v2}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_a0

    :cond_b2
    return-void

    :cond_b3
    const/4 v5, 0x1

    iput-boolean v5, p0, LD1/f;->k:Z

    :try_start_b6
    new-instance v6, Landroid/bluetooth/le/ScanSettings$Builder;

    invoke-direct {v6}, Landroid/bluetooth/le/ScanSettings$Builder;-><init>()V

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Landroid/bluetooth/le/ScanSettings$Builder;->setScanMode(I)Landroid/bluetooth/le/ScanSettings$Builder;

    move-result-object v6
    :try_end_c0
    .catch Ljava/lang/Exception; {:try_start_b6 .. :try_end_c0} :catch_ec

    :try_start_c0
    invoke-virtual {v6, v5}, Landroid/bluetooth/le/ScanSettings$Builder;->setCallbackType(I)Landroid/bluetooth/le/ScanSettings$Builder;

    invoke-virtual {v6, v5}, Landroid/bluetooth/le/ScanSettings$Builder;->setMatchMode(I)Landroid/bluetooth/le/ScanSettings$Builder;

    invoke-virtual {v6, v5}, Landroid/bluetooth/le/ScanSettings$Builder;->setNumOfMatches(I)Landroid/bluetooth/le/ScanSettings$Builder;
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_c9} :catch_ca

    goto :goto_d0

    :catch_ca
    move-exception v5

    :try_start_cb
    const-string v7, "Configure aggressive match mode error"

    invoke-static {v3, v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_d0
    .catch Ljava/lang/Exception; {:try_start_cb .. :try_end_d0} :catch_ec

    :goto_d0
    const-wide/16 v7, 0x0

    :try_start_d2
    invoke-virtual {v6, v7, v8}, Landroid/bluetooth/le/ScanSettings$Builder;->setReportDelay(J)Landroid/bluetooth/le/ScanSettings$Builder;
    :try_end_d5
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_d5} :catch_d5

    :catch_d5
    :try_start_d5
    invoke-virtual {v6}, Landroid/bluetooth/le/ScanSettings$Builder;->build()Landroid/bluetooth/le/ScanSettings;

    move-result-object v5

    iget-object v6, p0, LD1/f;->c:Landroid/bluetooth/le/BluetoothLeScanner;

    iget-object v7, p0, LD1/f;->m:LD1/b;

    invoke-virtual {v6, v1, v5, v7}, Landroid/bluetooth/le/BluetoothLeScanner;->startScan(Ljava/util/List;Landroid/bluetooth/le/ScanSettings;Landroid/bluetooth/le/ScanCallback;)V

    new-instance v1, LA1/m;

    const/4 v5, 0x7

    invoke-direct {v1, v5, p0}, LA1/m;-><init>(ILjava/lang/Object;)V

    const-wide/16 v5, 0x1770

    invoke-virtual {v0, v1, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_eb
    .catch Ljava/lang/Exception; {:try_start_d5 .. :try_end_eb} :catch_ec

    goto :goto_11a

    :catch_ec
    move-exception v0

    const-string v1, "\u542f\u52a8\u626b\u63cf\u5931\u8d25"

    invoke-static {v3, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iput-boolean v4, p0, LD1/f;->k:Z

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LD1/e;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u542f\u52a8\u626b\u63cf\u5931\u8d25: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_f8

    :cond_11a
    :goto_11a
    return-void
.end method

.method public final h()V
    .registers 7

    const-string v0, "BluetoothManager"

    iget-object v1, p0, LD1/f;->l:Landroid/os/Handler;

    iget-boolean v2, p0, LD1/f;->k:Z

    if-nez v2, :cond_9

    return-void

    :cond_9
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_b
    iget-object v4, p0, LD1/f;->c:Landroid/bluetooth/le/BluetoothLeScanner;

    if-eqz v4, :cond_1b

    iget-object v5, p0, LD1/f;->m:LD1/b;

    if-eqz v5, :cond_1b

    invoke-virtual {v4, v5}, Landroid/bluetooth/le/BluetoothLeScanner;->stopScan(Landroid/bluetooth/le/ScanCallback;)V

    goto :goto_20

    :catchall_17
    move-exception v0

    goto :goto_2d

    :catch_19
    move-exception v4

    goto :goto_26

    :cond_1b
    const-string v4, "Scanner or callback is null; cannot stop scan"

    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_20} :catch_19
    .catchall {:try_start_b .. :try_end_20} :catchall_17

    :goto_20
    iput-boolean v3, p0, LD1/f;->k:Z

    :try_start_22
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_2c

    goto :goto_2c

    :goto_26
    :try_start_26
    const-string v5, "\u505c\u6b62\u626b\u63cf\u5931\u8d25"

    invoke-static {v0, v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2b
    .catchall {:try_start_26 .. :try_end_2b} :catchall_17

    goto :goto_20

    :catch_2c
    :goto_2c
    return-void

    :goto_2d
    iput-boolean v3, p0, LD1/f;->k:Z

    :try_start_2f
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_32} :catch_32

    :catch_32
    throw v0
.end method

.method public final i([B)Z
    .registers 10

    iget-object v0, p0, LD1/f;->e:Landroid/bluetooth/BluetoothDevice;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    :cond_9
    const-string v0, "unknown"

    :goto_b
    iget-object v1, p0, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    const-string v2, "BluetoothManager"

    const/4 v3, 0x0

    if-eqz v1, :cond_61

    iget-object v4, p0, LD1/f;->f:Landroid/bluetooth/BluetoothGattCharacteristic;

    if-nez v4, :cond_17

    goto :goto_61

    :cond_17
    iget-boolean v5, p0, LD1/f;->h:Z

    if-nez v5, :cond_21

    const-string p1, "\u3010\u547d\u4ee4\u53d1\u9001\u3011\u5199\u7279\u5f81\u524d\u672a\u5c31\u7eea\uff08\u7b49\u5f85\u63cf\u8ff0\u7b26\u5199\u5165\u5b8c\u6210\uff09: device="

    invoke-static {p1, v0, v2}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_21
    if-eqz p1, :cond_4f

    array-length v5, p1

    if-nez v5, :cond_27

    goto :goto_4f

    :cond_27
    :try_start_27
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x21

    const/4 v7, 0x1

    if-lt v5, v6, :cond_38

    invoke-static {v1, v4, p1}, LD1/a;->a(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;[B)I

    move-result p1

    if-nez p1, :cond_35

    move v3, v7

    :cond_35
    return v3

    :catch_36
    move-exception p1

    goto :goto_49

    :cond_38
    invoke-virtual {v4, v7}, Landroid/bluetooth/BluetoothGattCharacteristic;->setWriteType(I)V

    iget-object v1, p0, LD1/f;->f:Landroid/bluetooth/BluetoothGattCharacteristic;

    invoke-virtual {v1, p1}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    iget-object p1, p0, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    iget-object v1, p0, LD1/f;->f:Landroid/bluetooth/BluetoothGattCharacteristic;

    invoke-virtual {p1, v1}, Landroid/bluetooth/BluetoothGatt;->writeCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    move-result p1
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_48} :catch_36

    return p1

    :goto_49
    const-string v1, "\u3010\u547d\u4ee4\u53d1\u9001\u3011\u5199\u5165\u7279\u5f81\u5f02\u5e38: device="

    invoke-static {p1, v1, v0, v2}, LA/e;->q(Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :cond_4f
    :goto_4f
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "\u3010\u547d\u4ee4\u53d1\u9001\u3011\u5199\u5165\u6570\u636e\u4e3a\u7a7a: device="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_61
    :goto_61
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "\u3010\u547d\u4ee4\u53d1\u9001\u3011\u84dd\u7259GATT\u6216\u5199\u7279\u5f81\u4e3a\u7a7a: device="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3
.end method

