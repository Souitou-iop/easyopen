.class public final synthetic Ly1/B;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic b:I

.field public final synthetic d:Ly1/D;


# direct methods
.method public synthetic constructor <init>(Ly1/D;I)V
    .registers 3

    iput p2, p0, Ly1/B;->b:I

    iput-object p1, p0, Ly1/B;->d:Ly1/D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget v0, p0, Ly1/B;->b:I

    packed-switch v0, :pswitch_data_3e

    iget-object v0, p0, Ly1/B;->d:Ly1/D;

    iget-object v1, v0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz v1, :cond_11

    const/4 v2, 0x0

    iput-object v2, v0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    invoke-interface {v1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->e()V

    :cond_11
    invoke-virtual {v0}, Ly1/D;->c()V

    return-void

    :pswitch_15
    iget-object v0, p0, Ly1/B;->d:Ly1/D;

    iget-object v1, v0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    if-eqz v1, :cond_21

    const/4 v2, 0x0

    iput-object v2, v0, Ly1/D;->c:Lcom/macronum/bledemo/DeviceOperator$OperationCallback;

    invoke-interface {v1}, Lcom/macronum/bledemo/DeviceOperator$OperationCallback;->e()V

    :cond_21
    invoke-virtual {v0}, Ly1/D;->c()V

    return-void

    :pswitch_25
    iget-object v0, p0, Ly1/B;->d:Ly1/D;

    invoke-virtual {v0}, Ly1/D;->c()V

    return-void

    :pswitch_2b
    iget-object v0, p0, Ly1/B;->d:Ly1/D;

    invoke-virtual {v0}, Ly1/D;->c()V

    return-void

    :pswitch_31
    iget-object v0, p0, Ly1/B;->d:Ly1/D;

    invoke-virtual {v0}, Ly1/D;->c()V

    return-void

    :pswitch_37
    iget-object v0, p0, Ly1/B;->d:Ly1/D;

    invoke-virtual {v0}, Ly1/D;->c()V

    return-void

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_37
        :pswitch_31
        :pswitch_2b
        :pswitch_25
        :pswitch_15
    .end packed-switch
.end method

