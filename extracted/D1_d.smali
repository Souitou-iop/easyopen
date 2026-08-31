.class public final LD1/d;
.super Landroid/bluetooth/BluetoothGattCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:LD1/f;


# direct methods
.method public constructor <init>(LD1/f;)V
    .registers 2

    iput-object p1, p0, LD1/d;->a:LD1/f;

    invoke-direct {p0}, Landroid/bluetooth/BluetoothGattCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .registers 5

    .line 15
    invoke-super {p0, p1, p2}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    if-eqz p2, :cond_29

    .line 16
    iget-object p1, p0, LD1/d;->a:LD1/f;

    iget-object v0, p1, LD1/f;->g:Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 18
    iget-object p1, p1, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_15
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LD1/e;

    .line 20
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v1

    invoke-interface {v0, v1}, LD1/e;->g([B)V

    goto :goto_15

    :cond_29
    return-void
.end method

.method public final onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;[B)V
    .registers 6

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;[B)V

    if-eqz p1, :cond_e

    .line 2
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_10

    :cond_e
    const-string p1, "unknown"

    :goto_10
    if-eqz p2, :cond_32

    .line 3
    iget-object v0, p0, LD1/d;->a:LD1/f;

    iget-object v1, v0, LD1/f;->g:Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 4
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_32

    .line 5
    iget-object p1, v0, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 6
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_22
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_39

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    .line 7
    invoke-interface {p2, p3}, LD1/e;->g([B)V

    goto :goto_22

    .line 8
    :cond_32
    const-string p2, "\u3010\u8bbe\u5907\u54cd\u5e94\u3011\u6536\u5230\u901a\u77e5\u4f46\u7279\u5f81\u4e0d\u5339\u914d: device="

    const-string p3, "BluetoothManager"

    .line 9
    invoke-static {p2, p1, p3}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_39
    return-void
.end method

.method public final onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V
    .registers 10

    const-string v0, "\u3010MTU\u534f\u5546\u3011MTU\u8bf7\u6c42\u5931\u8d25\uff0c300ms\u540efallback\u5230\u670d\u52a1\u53d1\u73b0: device="

    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V

    const-string p2, "BluetoothManager"

    if-nez p1, :cond_f

    const-string p1, "Gatt\u5bf9\u8c61\u4e3a\u7a7a"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_f
    :try_start_f
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_16} :catch_16

    :catch_16
    const/4 v1, 0x2

    iget-object v2, p0, LD1/d;->a:LD1/f;

    if-ne p3, v1, :cond_8a

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p3

    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p3

    iput-object p1, v2, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    iput-object v1, v2, LD1/f;->e:Landroid/bluetooth/BluetoothDevice;

    :try_start_2b
    iget-object v1, v2, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/bluetooth/BluetoothGatt;->requestConnectionPriority(I)Z
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_31} :catch_32

    goto :goto_38

    :catch_32
    move-exception v1

    const-string v3, "\u3010\u84dd\u7259\u8fde\u63a5\u3011\u8bf7\u6c42\u8fde\u63a5\u4f18\u5148\u7ea7\u5f02\u5e38: device="

    invoke-static {v1, v3, p3, p2}, LA/e;->q(Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_38
    const-wide/16 v3, 0x12c

    :try_start_3a
    iget-object v1, v2, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    const/16 v5, 0x64

    invoke-virtual {v1, v5}, Landroid/bluetooth/BluetoothGatt;->requestMtu(I)Z

    move-result v1

    if-nez v1, :cond_70

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v2, LD1/f;->l:Landroid/os/Handler;

    new-instance v1, LD1/c;

    const/4 v5, 0x0

    invoke-direct {v1, p0, p3, v5}, LD1/c;-><init>(LD1/d;Ljava/lang/String;I)V

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_5e} :catch_5f

    goto :goto_70

    :catch_5f
    move-exception v0

    const-string v1, "\u3010MTU\u534f\u5546\u3011\u8bf7\u6c42MTU\u5f02\u5e38: device="

    invoke-static {v0, v1, p3, p2}, LA/e;->q(Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, v2, LD1/f;->l:Landroid/os/Handler;

    new-instance v0, LD1/c;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p3, v1}, LD1/c;-><init>(LD1/d;Ljava/lang/String;I)V

    invoke-virtual {p2, v0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_70
    :goto_70
    iget-object p2, v2, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_76
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_c9

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, LD1/e;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-interface {p3, v0}, LD1/e;->h(Landroid/bluetooth/BluetoothDevice;)V

    goto :goto_76

    :cond_8a
    if-nez p3, :cond_c9

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p3

    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    iget-object p3, v2, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p3}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_99
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_ad

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LD1/e;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-interface {v0, v1}, LD1/e;->d(Landroid/bluetooth/BluetoothDevice;)V

    goto :goto_99

    :cond_ad
    iget-object p1, v2, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    const/4 p3, 0x0

    if-eqz p1, :cond_be

    :try_start_b2
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->close()V
    :try_end_b5
    .catch Ljava/lang/Exception; {:try_start_b2 .. :try_end_b5} :catch_b6

    goto :goto_bc

    :catch_b6
    move-exception p1

    const-string v0, "\u5173\u95edGatt\u5931\u8d25"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_bc
    iput-object p3, v2, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    :cond_be
    iput-object p3, v2, LD1/f;->f:Landroid/bluetooth/BluetoothGattCharacteristic;

    iput-object p3, v2, LD1/f;->g:Landroid/bluetooth/BluetoothGattCharacteristic;

    iput-object p3, v2, LD1/f;->e:Landroid/bluetooth/BluetoothDevice;

    const/4 p1, 0x0

    iput-boolean p1, v2, LD1/f;->h:Z

    iput p1, v2, LD1/f;->i:I

    :cond_c9
    return-void
.end method

.method public final onDescriptorWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    .registers 9

    const-string v0, "\u3010CCCD\u5199\u5165\u3011\u63cf\u8ff0\u7b26\u5199\u5165\u5931\u8d25\uff0c\u72b6\u6001\u7801: "

    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onDescriptorWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V

    const-string v1, "BluetoothManager"

    const/4 v2, 0x1

    iget-object v3, p0, LD1/d;->a:LD1/f;

    if-eqz p1, :cond_17

    :try_start_c
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_19

    :catch_15
    move-exception p1

    goto :goto_6f

    :cond_17
    const-string p1, "unknown"

    :goto_19
    if-eqz p2, :cond_24

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattDescriptor;->getUuid()Ljava/util/UUID;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_26

    :cond_24
    const-string p2, "null"

    :goto_26
    iget v4, v3, LD1/f;->i:I

    if-lez v4, :cond_2d

    sub-int/2addr v4, v2

    iput v4, v3, LD1/f;->i:I

    :cond_2d
    if-nez p3, :cond_30

    goto :goto_4f

    :cond_30
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", uuid="

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ", device="

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4f
    iget p1, v3, LD1/f;->i:I

    if-nez p1, :cond_90

    iget-boolean p1, v3, LD1/f;->h:Z

    if-nez p1, :cond_90

    iput-boolean v2, v3, LD1/f;->h:Z

    iget-object p1, v3, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_90

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    invoke-interface {p2}, LD1/e;->e()V
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_6e} :catch_15

    goto :goto_5f

    :goto_6f
    const-string p2, "\u3010CCCD\u5199\u5165\u3011Descriptor write callback error"

    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-boolean p1, v3, LD1/f;->h:Z

    if-nez p1, :cond_90

    iput-boolean v2, v3, LD1/f;->h:Z

    iget-object p1, v3, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_80
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_90

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    invoke-interface {p2}, LD1/e;->e()V

    goto :goto_80

    :cond_90
    return-void
.end method

.method public final onMtuChanged(Landroid/bluetooth/BluetoothGatt;II)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onMtuChanged(Landroid/bluetooth/BluetoothGatt;II)V

    if-eqz p1, :cond_e

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    goto :goto_10

    :cond_e
    const-string p1, "unknown"

    :goto_10
    iget-object p2, p0, LD1/d;->a:LD1/f;

    iget-object p2, p2, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    if-eqz p2, :cond_2f

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    move-result p2

    if-nez p2, :cond_2f

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "\u3010\u670d\u52a1\u53d1\u73b0\u3011\u53d1\u73b0\u670d\u52a1\u8bf7\u6c42\u5931\u8d25: device="

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "BluetoothManager"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2f
    return-void
.end method

.method public final onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
    .registers 12

    const-string v0, "\u3010CCCD\u5199\u5165\u3011CCCD descriptor\u672a\u627e\u5230\uff0c\u76f4\u63a5\u89c6\u4e3a\u5c31\u7eea: device="

    const-string v1, "\u3010CCCD\u5199\u5165\u3011\u5199\u5165CCCD\u5931\u8d25\uff0cfallback\u4e3a\u5c31\u7eea: device="

    invoke-super {p0, p1, p2}, Landroid/bluetooth/BluetoothGattCallback;->onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V

    const-string v2, "BluetoothManager"

    if-nez p1, :cond_11

    const-string p1, "Gatt\u5bf9\u8c61\u4e3a\u7a7a"

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_11
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, LD1/d;->a:LD1/f;

    if-nez p2, :cond_140

    const-string p2, "6e400001-b5a3-f393-e0a9-e50e24dcca9e"

    invoke-static {p2}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/bluetooth/BluetoothGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object p2

    if-eqz p2, :cond_117

    const-string v5, "6e400002-b5a3-f393-e0a9-e50e24dcca9e"

    invoke-static {v5}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {p2, v5}, Landroid/bluetooth/BluetoothGattService;->getCharacteristic(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v5

    iput-object v5, v4, LD1/f;->f:Landroid/bluetooth/BluetoothGattCharacteristic;

    const-string v5, "6e400003-b5a3-f393-e0a9-e50e24dcca9e"

    invoke-static {v5}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {p2, v5}, Landroid/bluetooth/BluetoothGattService;->getCharacteristic(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object p2

    iput-object p2, v4, LD1/f;->g:Landroid/bluetooth/BluetoothGattCharacteristic;

    const/4 v5, 0x0

    iput-boolean v5, v4, LD1/f;->h:Z

    iput v5, v4, LD1/f;->i:I

    iget-object v6, v4, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v7, 0x1

    if-eqz p2, :cond_f8

    invoke-virtual {p1, p2, v7}, Landroid/bluetooth/BluetoothGatt;->setCharacteristicNotification(Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z

    move-result p2

    if-nez p2, :cond_62

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v8, "\u3010CCCD\u5199\u5165\u3011\u542f\u7528\u901a\u77e5\u5931\u8d25: device="

    invoke-direct {p2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v2, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_62
    :try_start_62
    iget-object p2, v4, LD1/f;->g:Landroid/bluetooth/BluetoothGattCharacteristic;

    const-string v8, "00002902-0000-1000-8000-00805f9b34fb"

    invoke-static {v8}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {p2, v8}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptor(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;

    move-result-object p2

    if-eqz p2, :cond_b8

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x21

    if-lt v0, v8, :cond_82

    sget-object v0, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_NOTIFICATION_VALUE:[B

    invoke-static {p1, p2, v0}, LD1/a;->b(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;[B)I

    move-result p1

    if-nez p1, :cond_8b

    move v5, v7

    goto :goto_8b

    :catch_80
    move-exception p1

    goto :goto_dd

    :cond_82
    sget-object v0, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_NOTIFICATION_VALUE:[B

    invoke-virtual {p2, v0}, Landroid/bluetooth/BluetoothGattDescriptor;->setValue([B)Z

    invoke-virtual {p1, p2}, Landroid/bluetooth/BluetoothGatt;->writeDescriptor(Landroid/bluetooth/BluetoothGattDescriptor;)Z

    move-result v5

    :cond_8b
    :goto_8b
    if-nez v5, :cond_b2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v7, v4, LD1/f;->h:Z

    invoke-virtual {v6}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_a2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_f8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    invoke-interface {p2}, LD1/e;->e()V

    goto :goto_a2

    :cond_b2
    iget p1, v4, LD1/f;->i:I

    add-int/2addr p1, v7

    iput p1, v4, LD1/f;->i:I

    goto :goto_f8

    :cond_b8
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v7, v4, LD1/f;->h:Z

    invoke-virtual {v6}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_cd
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_f8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    invoke-interface {p2}, LD1/e;->e()V
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_dc} :catch_80

    goto :goto_cd

    :goto_dd
    const-string p2, "\u3010CCCD\u5199\u5165\u3011\u542f\u7528\u901a\u77e5\u5199\u5165CCCD\u5f02\u5e38: device="

    invoke-static {p1, p2, v3, v2}, LA/e;->q(Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v7, v4, LD1/f;->h:Z

    invoke-virtual {v6}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_e8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_f8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    invoke-interface {p2}, LD1/e;->e()V

    goto :goto_e8

    :cond_f8
    :goto_f8
    iget-object p1, v4, LD1/f;->g:Landroid/bluetooth/BluetoothGattCharacteristic;

    if-nez p1, :cond_17d

    const-string p1, "\u3010\u670d\u52a1\u53d1\u73b0\u3011\u901a\u77e5\u7279\u5f81\u4e3a\u7a7a\uff0c\u76f4\u63a5\u89c6\u4e3a\u5c31\u7eea: device="

    invoke-static {p1, v3, v2}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v7, v4, LD1/f;->h:Z

    invoke-virtual {v6}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_107
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_17d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    invoke-interface {p2}, LD1/e;->e()V

    goto :goto_107

    :cond_117
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "\u3010\u670d\u52a1\u53d1\u73b0\u3011\u672a\u627e\u5230\u6307\u5b9a\u670d\u52a1UUID: 6e400001-b5a3-f393-e0a9-e50e24dcca9e, device="

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, v4, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_12e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_17d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, LD1/e;

    const-string v0, "\u672a\u627e\u5230\u6307\u5b9a\u670d\u52a1"

    invoke-interface {p2, v0}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_12e

    :cond_140
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\u3010\u670d\u52a1\u53d1\u73b0\u3011\u670d\u52a1\u53d1\u73b0\u5931\u8d25\uff0c\u72b6\u6001\u7801: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", device="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, v4, LD1/f;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_15f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_17d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LD1/e;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u670d\u52a1\u53d1\u73b0\u5931\u8d25\uff0c\u72b6\u6001\u7801: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, LD1/e;->c(Ljava/lang/String;)V

    goto :goto_15f

    :cond_17d
    return-void
.end method

