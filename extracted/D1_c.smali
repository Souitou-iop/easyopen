.class public final synthetic LD1/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic b:I

.field public final synthetic d:LD1/d;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(LD1/d;Ljava/lang/String;I)V
    .registers 4

    iput p3, p0, LD1/c;->b:I

    iput-object p1, p0, LD1/c;->d:LD1/d;

    iput-object p2, p0, LD1/c;->e:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget v0, p0, LD1/c;->b:I

    packed-switch v0, :pswitch_data_4e

    iget-object v0, p0, LD1/c;->d:LD1/d;

    iget-object v0, v0, LD1/d;->a:LD1/f;

    iget-object v0, v0, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    move-result v0

    if-nez v0, :cond_28

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u3010\u670d\u52a1\u53d1\u73b0\u3011\u53d1\u73b0\u670d\u52a1\u8bf7\u6c42\u5931\u8d25: device="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, LD1/c;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BluetoothManager"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_28
    return-void

    :pswitch_29
    iget-object v0, p0, LD1/c;->d:LD1/d;

    iget-object v0, v0, LD1/d;->a:LD1/f;

    iget-object v0, v0, LD1/f;->d:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    move-result v0

    if-nez v0, :cond_4c

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u3010\u670d\u52a1\u53d1\u73b0\u3011\u53d1\u73b0\u670d\u52a1\u8bf7\u6c42\u5931\u8d25: device="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, LD1/c;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BluetoothManager"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4c
    return-void

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method

