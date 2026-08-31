.class public final Ly1/C;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LD1/e;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .registers 3

    iput p1, p0, Ly1/C;->a:I

    iput-object p2, p0, Ly1/C;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a([B)V
    .registers 2

    return-void
.end method

.method private final b(Landroid/bluetooth/BluetoothDevice;)V
    .registers 2

    return-void
.end method

.method private final i(Landroid/bluetooth/BluetoothDevice;I[B)V
    .registers 4

    return-void
.end method

.method private final j()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/String;)V
    .registers 5

    iget v0, p0, Ly1/C;->a:I

    packed-switch v0, :pswitch_data_2a

    new-instance v0, Ly1/n;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1, p1}, Ly1/n;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    iget-object p1, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast p1, Lcom/macronum/bledemo/ScanActivity;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :pswitch_13
    iget-object v0, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast v0, Ly1/D;

    iget-object v1, v0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    const/4 v2, 0x0

    if-eqz v1, :cond_21

    iput-object v2, v0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    invoke-interface {v1, p1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    :cond_21
    invoke-virtual {v0}, Ly1/D;->a()V

    iput-object v2, v0, Ly1/D;->e:[B

    iput-object v2, v0, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final d(Landroid/bluetooth/BluetoothDevice;)V
    .registers 3

    iget p1, p0, Ly1/C;->a:I

    packed-switch p1, :pswitch_data_1a

    return-void

    :pswitch_6
    iget-object p1, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast p1, Ly1/D;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    iput-object v0, p1, Ly1/D;->e:[B

    iput-object v0, p1, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final e()V
    .registers 7

    iget v0, p0, Ly1/C;->a:I

    packed-switch v0, :pswitch_data_42

    return-void

    :pswitch_6
    iget-object v0, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast v0, Ly1/D;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Ly1/D;->e:[B

    if-eqz v1, :cond_3a

    iget-object v1, v0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz v1, :cond_3a

    iget-object v1, v0, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    :cond_1c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-object v1, v0, Ly1/D;->e:[B

    const/4 v2, 0x0

    iput-object v2, v0, Ly1/D;->e:[B

    invoke-virtual {v0}, Ly1/D;->a()V

    new-instance v2, Ly1/B;

    const/4 v3, 0x4

    invoke-direct {v2, v0, v3}, Ly1/B;-><init>(Ly1/D;I)V

    iput-object v2, v0, Ly1/D;->d:Ljava/lang/Runnable;

    iget-object v3, v0, Ly1/D;->b:Landroid/os/Handler;

    const-wide/16 v4, 0x1f40

    invoke-virtual {v3, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {v0, v1}, Ly1/D;->d([B)V

    goto :goto_41

    :cond_3a
    const-string v0, "DeviceOperator"

    const-string v1, "\u3010\u5f00\u9501\u6d41\u7a0b\u3011\u670d\u52a1\u53d1\u73b0\u5b8c\u6210\uff0c\u4f46\u65e0\u5f85\u53d1\u9001\u547d\u4ee4\u6216\u56de\u8c03\u5df2\u6e05\u9664"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_41
    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final f(Landroid/bluetooth/BluetoothDevice;I[B)V
    .registers 7

    iget v0, p0, Ly1/C;->a:I

    packed-switch v0, :pswitch_data_96

    if-nez p1, :cond_9

    goto/16 :goto_95

    :cond_9
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    if-eqz p3, :cond_15

    :try_start_11
    invoke-static {p3}, LM2/l;->y([B)Ljava/lang/String;

    move-result-object v0
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_15} :catch_15

    :catch_15
    :cond_15
    if-eqz v0, :cond_95

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "YILA"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_95

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast v1, Lcom/macronum/bledemo/ScanActivity;

    iget-object v2, v1, Lcom/macronum/bledemo/ScanActivity;->C:Ly1/A;

    if-eqz v2, :cond_36

    invoke-virtual {v2, v0}, Ly1/A;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_36

    goto :goto_95

    :cond_36
    iget-object v2, v1, Lcom/macronum/bledemo/ScanActivity;->I:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v2, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_5e

    invoke-static {p3}, LM2/l;->V([B)Ljava/lang/Integer;

    move-result-object p2

    if-eqz p2, :cond_5e

    iget-object p3, v1, Lcom/macronum/bledemo/ScanActivity;->J:Lc2/d;

    if-eqz p3, :cond_5e

    if-eqz v0, :cond_52

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p3

    goto :goto_53

    :cond_52
    const/4 p3, 0x0

    :goto_53
    if-eqz p3, :cond_5e

    iget-object v2, v1, Lcom/macronum/bledemo/ScanActivity;->J:Lc2/d;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {v2, p2, p3}, Lc2/d;->c(ILjava/lang/String;)V

    :cond_5e
    iget-object p2, v1, Lcom/macronum/bledemo/ScanActivity;->H:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_64
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7d

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    if-eqz v2, :cond_64

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_64

    goto :goto_80

    :cond_7d
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_80
    iget-boolean p1, v1, Lcom/macronum/bledemo/ScanActivity;->O:Z

    if-nez p1, :cond_95

    new-instance p1, Ly1/a0;

    invoke-direct {p1, p0}, Ly1/a0;-><init>(Ly1/C;)V

    invoke-static {p2, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance p1, Ly1/b0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ly1/b0;-><init>(Ly1/C;I)V

    invoke-virtual {v1, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_95
    :goto_95
    :pswitch_95
    return-void

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_95
    .end packed-switch
.end method

.method public final g([B)V
    .registers 15

    iget v0, p0, Ly1/C;->a:I

    packed-switch v0, :pswitch_data_cc

    return-void

    :pswitch_6
    const-string v0, "\u6536\u5230\u7a7a\u6570\u636e\u54cd\u5e94: \u603b\u8017\u65f6="

    const-string v1, "\u5f00\u9501\u5931\u8d25: "

    iget-object v2, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast v2, Ly1/D;

    iget-object v3, v2, Ly1/D;->b:Landroid/os/Handler;

    const-string v4, "ms"

    const-string v5, "DeviceOperator"

    const-wide/16 v6, 0x1f4

    const/4 v8, 0x0

    if-eqz p1, :cond_86

    :try_start_19
    array-length v9, p1

    if-nez v9, :cond_1d

    goto :goto_86

    :cond_1d
    invoke-static {p1}, LM2/l;->U([B)LB1/s;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iget-wide v11, v2, Ly1/D;->g:J

    sub-long/2addr v9, v11

    iget-object v0, v2, Ly1/D;->f:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    goto :goto_33

    :catch_30
    move-exception p1

    goto/16 :goto_ae

    :cond_33
    :goto_33
    iget-boolean v0, p1, LB1/s;->a:Z

    iget-object p1, p1, LB1/s;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v11, v2, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz v11, :cond_82

    iput-object v8, v2, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz v0, :cond_4e

    invoke-interface {v11, p1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->b(Ljava/lang/String;)V

    new-instance p1, Ly1/B;

    const/4 v0, 0x0

    invoke-direct {p1, v2, v0}, Ly1/B;-><init>(Ly1/D;I)V

    invoke-virtual {v3, p1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_82

    :cond_4e
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    const-string v12, "ERROR"

    invoke-virtual {v0, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5c

    const-string p1, "\u5bc6\u7801\u9519\u8bef"

    :cond_5c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", \u603b\u8017\u65f6="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v11, p1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    new-instance p1, Ly1/B;

    const/4 v0, 0x1

    invoke-direct {p1, v2, v0}, Ly1/B;-><init>(Ly1/D;I)V

    invoke-virtual {v3, p1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_82
    :goto_82
    invoke-virtual {v2}, Ly1/D;->a()V

    goto :goto_ca

    :cond_86
    :goto_86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iget-wide v11, v2, Ly1/D;->g:J

    sub-long/2addr v9, v11

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, v2, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz p1, :cond_aa

    iput-object v8, v2, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    const-string v0, "\u8bbe\u5907\u65e0\u54cd\u5e94\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-interface {p1, v0}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    :cond_aa
    invoke-virtual {v2}, Ly1/D;->a()V
    :try_end_ad
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_ad} :catch_30

    goto :goto_ca

    :goto_ae
    const-string v0, "\u5904\u7406\u8bbe\u5907\u54cd\u5e94\u5f02\u5e38"

    invoke-static {v5, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object p1, v2, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz p1, :cond_be

    iput-object v8, v2, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    const-string v0, "\u64cd\u4f5c\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-interface {p1, v0}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->c(Ljava/lang/String;)V

    :cond_be
    invoke-virtual {v2}, Ly1/D;->a()V

    new-instance p1, Ly1/B;

    const/4 v0, 0x2

    invoke-direct {p1, v2, v0}, Ly1/B;-><init>(Ly1/D;I)V

    invoke-virtual {v3, p1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_ca
    return-void

    nop

    :pswitch_data_cc
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final h(Landroid/bluetooth/BluetoothDevice;)V
    .registers 4

    iget v0, p0, Ly1/C;->a:I

    packed-switch v0, :pswitch_data_26

    new-instance p1, Ly1/b0;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Ly1/b0;-><init>(Ly1/C;I)V

    iget-object v0, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast v0, Lcom/macronum/bledemo/ScanActivity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :pswitch_13
    iget-object v0, p0, Ly1/C;->b:Ljava/lang/Object;

    check-cast v0, Ly1/D;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-wide v0, v0, Ly1/D;->g:J

    if-eqz p1, :cond_24

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    :cond_24
    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

