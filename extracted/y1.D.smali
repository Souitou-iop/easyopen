.class public final Ly1/D;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:LD1/f;

.field public final b:Landroid/os/Handler;

.field public c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

.field public d:Ljava/lang/Runnable;

.field public e:[B

.field public f:Lcom/macronum/bledemo/model/BluetoothDevice;

.field public g:J


# direct methods
.method public constructor <init>(LD1/f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Ly1/D;->b:Landroid/os/Handler;

    iput-object p1, p0, Ly1/D;->a:LD1/f;

    new-instance v0, Ly1/C;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Ly1/C;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, v0}, LD1/f;->a(LD1/e;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Ly1/D;->d:Ljava/lang/Runnable;

    iget-object v1, p0, Ly1/D;->b:Landroid/os/Handler;

    if-eqz v0, :cond_c

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Ly1/D;->d:Ljava/lang/Runnable;

    :cond_c
    return-void
.end method

.method public final b(Lcom/macronum/bledemo/model/BluetoothDevice;)V
    .registers 4

    const-string v0, "DeviceOperator"

    if-eqz p1, :cond_1d

    :try_start_4
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1d

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_15

    goto :goto_1d

    :cond_15
    iget-object v1, p0, Ly1/D;->a:LD1/f;

    invoke-virtual {v1, p1}, LD1/f;->b(Lcom/macronum/bledemo/model/BluetoothDevice;)V

    goto :goto_28

    :catch_1b
    move-exception p1

    goto :goto_23

    :cond_1d
    :goto_1d
    const-string p1, "\u8bbe\u5907\u53c2\u6570\u65e0\u6548"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_22} :catch_1b

    return-void

    :goto_23
    const-string v1, "\u8fde\u63a5\u8bbe\u5907\u5f02\u5e38"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_28
    return-void
.end method

.method public final c()V
    .registers 4

    :try_start_0
    iget-object v0, p0, Ly1/D;->a:LD1/f;

    invoke-virtual {v0}, LD1/f;->c()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_e

    :catch_6
    move-exception v0

    const-string v1, "DeviceOperator"

    const-string v2, "\u65ad\u5f00\u8bbe\u5907\u8fde\u63a5\u5f02\u5e38"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_e
    return-void
.end method

.method public final d([B)V
    .registers 9

    iget-object v0, p0, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    :cond_9
    const-string v0, "unknown"

    :goto_b
    iget-object v1, p0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    const-string v2, "DeviceOperator"

    if-nez v1, :cond_17

    const-string p1, "\u3010\u547d\u4ee4\u53d1\u9001\u3011\u64cd\u4f5c\u5df2\u53d6\u6d88\uff0c\u505c\u6b62\u5199\u5165: lockMac="

    invoke-static {p1, v0, v2}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-object v1, p0, Ly1/D;->a:LD1/f;

    invoke-virtual {v1, p1}, LD1/f;->i([B)Z

    move-result p1

    if-eqz p1, :cond_26

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    return-void

    :cond_26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Ly1/D;->g:J

    sub-long/2addr v3, v5

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "\u3010\u547d\u4ee4\u53d1\u9001\u3011\u547d\u4ee4\u53d1\u9001\u5931\u8d25: \u603b\u8017\u65f6="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "ms, lockMac="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Ly1/D;->a()V

    iget-object p1, p0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz p1, :cond_55

    const/4 v0, 0x0

    iput-object v0, p0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    const-string v0, "\u8bbe\u5907\u672a\u5c31\u7eea\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-interface {p1, v0}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    :cond_55
    iget-object p1, p0, Ly1/D;->b:Landroid/os/Handler;

    new-instance v0, Ly1/B;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Ly1/B;-><init>(Ly1/D;I)V

    const-wide/16 v1, 0x1f4

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final e(Lcom/macronum/bledemo/model/BluetoothDevice;Lcom/macronum/bledemo/DeviceOperator$OperationCallback;)V
    .registers 12

    const-string v0, ", isSharedUser=false"

    const-string v1, "\u3010\u5f00\u9501\u6d41\u7a0b\u3011\u62e5\u6709\u8005\u5bc6\u7801\u4e3a\u7a7a\uff0c\u663e\u793a\u901a\u7528\u9519\u8bef\uff08\u4e0d\u663e\u793a\u5bc6\u7801\u76f8\u5173\uff09: lockMac="

    const-string v2, "\u3010\u5f00\u9501\u6d41\u7a0b\u3011\u8bbe\u5907\u5bc6\u7801\u672a\u914d\u7f6e: lockMac="

    const-string v3, "\u3010\u5f00\u9501\u6d41\u7a0b\u3011\u751f\u6210\u5f00\u9501\u547d\u4ee4\u5931\u8d25: lockMac="

    invoke-virtual {p0}, Ly1/D;->a()V

    const/4 v4, 0x0

    iput-object v4, p0, Ly1/D;->e:[B

    iput-object v4, p0, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Ly1/D;->g:J

    iput-object p2, p0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    const-string v5, "\u5f00\u9501\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    const-string v6, "DeviceOperator"

    if-nez p1, :cond_27

    :try_start_1e
    const-string p1, "\u8bbe\u5907\u53c2\u6570\u4e3a\u7a7a"

    invoke-interface {p2, p1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    return-void

    :catch_24
    move-exception p1

    goto/16 :goto_cf

    :cond_27
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_c9

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_39

    goto/16 :goto_c9

    :cond_39
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_83

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_4e

    goto :goto_83

    :cond_4e
    invoke-static {p1}, LC0/f;->K(Lcom/macronum/bledemo/model/BluetoothDevice;)[B

    move-result-object v0

    if-eqz v0, :cond_6d

    array-length v1, v0

    if-nez v1, :cond_58

    goto :goto_6d

    :cond_58
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAttribute()I

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOpenTime()I

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getWaitTime()I

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getCloseTime()I

    iput-object v0, p0, Ly1/D;->e:[B

    iput-object p1, p0, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {p0, p1}, Ly1/D;->b(Lcom/macronum/bledemo/model/BluetoothDevice;)V

    goto/16 :goto_f6

    :cond_6d
    :goto_6d
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v6, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Ly1/D;->a()V

    invoke-interface {p2, v5}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    return-void

    :cond_83
    :goto_83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Ly1/D;->a()V

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result v0

    if-eqz v0, :cond_b4

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_b4

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_b4

    const-string p1, "\u95e8\u9501\u5bc6\u7801\u672a\u914d\u7f6e\uff0c\u8bf7\u8054\u7cfb\u95e8\u9501\u7ba1\u7406\u5458\u5728APP\u4e2d\u7f16\u8f91\u95e8\u9501\u5e76\u8bbe\u7f6e6\u4f4d\u6570\u5b57\u5bc6\u7801"

    invoke-interface {p2, p1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    goto :goto_c8

    :cond_b4
    const-string p1, "\u8bbe\u5907\u4fe1\u606f\u672a\u540c\u6b65\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\u6216\u5237\u65b0\u8bbe\u5907\u5217\u8868"

    invoke-interface {p2, p1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v6, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_c8
    return-void

    :cond_c9
    :goto_c9
    const-string p1, "\u8bbe\u5907\u5730\u5740\u65e0\u6548"

    invoke-interface {p2, p1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V
    :try_end_ce
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_ce} :catch_24

    return-void

    :goto_cf
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Ly1/D;->g:J

    sub-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u5f00\u9501\u64cd\u4f5c\u5f02\u5e38: elapsed="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p0}, Ly1/D;->a()V

    invoke-interface {p2, v5}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    iput-object v4, p0, Ly1/D;->e:[B

    iput-object v4, p0, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    :goto_f6
    return-void
.end method

