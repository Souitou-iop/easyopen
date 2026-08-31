.class public final Ly1/A;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LB1/C;
.implements LB1/z;


# static fields
.field public static i:Ly1/A;


# instance fields
.field public final synthetic b:I

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    iput v0, p0, Ly1/A;->b:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ly1/A;->g:Ljava/lang/Object;

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ly1/A;->h:Ljava/lang/Object;

    if-eqz p1, :cond_29

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ly1/A;->e:Ljava/lang/Object;

    .line 6
    invoke-static {p1}, LE1/a;->F(Landroid/content/Context;)LE1/a;

    move-result-object v0

    iput-object v0, p0, Ly1/A;->d:Ljava/lang/Object;

    .line 7
    invoke-static {p1}, LJ1/b;->d(Landroid/content/Context;)LJ1/b;

    move-result-object p1

    iput-object p1, p0, Ly1/A;->f:Ljava/lang/Object;

    return-void

    .line 8
    :cond_29
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Context cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 7

    .line 1
    iput p6, p0, Ly1/A;->b:I

    iput-object p1, p0, Ly1/A;->h:Ljava/lang/Object;

    iput-object p2, p0, Ly1/A;->d:Ljava/lang/Object;

    iput-object p3, p0, Ly1/A;->e:Ljava/lang/Object;

    iput-object p4, p0, Ly1/A;->f:Ljava/lang/Object;

    iput-object p5, p0, Ly1/A;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static c(Landroid/content/SharedPreferences;)V
    .registers 11

    const-string v0, "DeviceManager"

    :try_start_2
    invoke-static {p0}, LC0/f;->Q(Landroid/content/SharedPreferences;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_d

    return-void

    :cond_d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1a
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_26} :catch_5c

    :try_start_26
    const-string v6, "\\|"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    const/4 v8, 0x2

    if-lt v7, v8, :cond_1a

    const/4 v7, 0x1

    aget-object v6, v6, v7

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    sub-long v6, v2, v6

    const-wide v8, 0x9a7ec800L

    cmp-long v6, v6, v8

    if-lez v6, :cond_1a

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_45} :catch_46

    goto :goto_1a

    :catch_46
    move-exception v6

    :try_start_47
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u89e3\u6790\u5df2\u5220\u9664\u5217\u8868\u9879\u5931\u8d25: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1a

    :catch_5c
    move-exception p0

    goto :goto_7c

    :cond_5e
    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_81

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_68
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_78

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p0, v2}, LC0/f;->j0(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    goto :goto_68

    :cond_78
    invoke-virtual {v4}, Ljava/util/HashSet;->size()I
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_7b} :catch_5c

    goto :goto_81

    :goto_7c
    const-string v1, "\u6e05\u7406\u8fc7\u671f\u5df2\u5220\u9664\u5217\u8868\u5931\u8d25"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_81
    :goto_81
    return-void
.end method

.method public static declared-synchronized h(Landroid/content/Context;)Ly1/A;
    .registers 3

    const-class v0, Ly1/A;

    monitor-enter v0

    :try_start_3
    sget-object v1, Ly1/A;->i:Ly1/A;

    if-nez v1, :cond_13

    if-eqz p0, :cond_13

    new-instance v1, Ly1/A;

    invoke-direct {v1, p0}, Ly1/A;-><init>(Landroid/content/Context;)V

    sput-object v1, Ly1/A;->i:Ly1/A;

    goto :goto_13

    :catchall_11
    move-exception p0

    goto :goto_17

    :cond_13
    :goto_13
    sget-object p0, Ly1/A;->i:Ly1/A;
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_11

    monitor-exit v0

    return-object p0

    :goto_17
    :try_start_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_11

    throw p0
.end method

.method public static k(Ljava/util/ArrayList;)V
    .registers 8

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    :goto_8
    :try_start_8
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_48

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v1, :cond_3e

    const-string v2, "\u4f4d\u7f6e%d: %s (sort_order=%d, name=%s)\n"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getSortOrder()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_35

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_37

    :catch_33
    move-exception p0

    goto :goto_41

    :cond_35
    const-string v1, "\u672a\u547d\u540d"

    :goto_37
    filled-new-array {v3, v4, v5, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_3e} :catch_33

    :cond_3e
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :goto_41
    const-string v0, "DeviceManager"

    const-string v1, "\u8bb0\u5f55\u6392\u5e8f\u72b6\u6001\u65f6\u53d1\u751f\u5f02\u5e38"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_48
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 7

    iget v0, p0, Ly1/A;->b:I

    packed-switch v0, :pswitch_data_118

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u3010\u6743\u9650\u9a8c\u8bc1\u3011\u4ece\u670d\u52a1\u5668\u83b7\u53d6\u95e8\u9501\u8be6\u60c5\u5931\u8d25: lockMac="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ly1/A;->g:Ljava/lang/Object;

    check-cast v1, Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", error="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "HybridUnlockManager"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Ly1/A;->h:Ljava/lang/Object;

    check-cast v1, LY1/f;

    invoke-virtual {v1, v0}, LY1/f;->g(Ljava/lang/String;)V

    iget-object v0, p0, Ly1/A;->f:Ljava/lang/Object;

    check-cast v0, LY1/e;

    if-eqz v0, :cond_dc

    if-eqz p1, :cond_d7

    const-string v1, "\u7f51\u7edc"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d4

    const-string v1, "\u8fde\u63a5"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d4

    const-string v1, "timeout"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d4

    const-string v1, "time out"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5d

    goto/16 :goto_d4

    :cond_5d
    const-string v1, "401"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d1

    const-string v1, "\u672a\u6388\u6743"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d1

    const-string v1, "token"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d1

    const-string v1, "Token"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7e

    goto :goto_d1

    :cond_7e
    const-string v1, "403"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_ce

    const-string v1, "\u6743\u9650"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_ce

    const-string v1, "forbidden"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_97

    goto :goto_ce

    :cond_97
    const-string v1, "404"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_cb

    const-string v1, "\u4e0d\u5b58\u5728"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_cb

    const-string v1, "not found"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_b0

    goto :goto_cb

    :cond_b0
    const-string v1, "\u8bf7\u6c42\u8fc7\u4e8e\u9891\u7e41"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_c8

    const-string v1, "\u8bf7\u6c42\u6b63\u5728\u8fdb\u884c\u4e2d"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_c1

    goto :goto_c8

    :cond_c1
    const-string v1, "\u65e0\u6cd5\u9a8c\u8bc1\u6743\u9650: "

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_d9

    :cond_c8
    :goto_c8
    const-string p1, "\u8bf7\u6c42\u8fc7\u4e8e\u9891\u7e41\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    goto :goto_d9

    :cond_cb
    :goto_cb
    const-string p1, "\u95e8\u9501\u4e0d\u5b58\u5728\uff0c\u8bf7\u91cd\u65b0\u6dfb\u52a0"

    goto :goto_d9

    :cond_ce
    :goto_ce
    const-string p1, "\u60a8\u6ca1\u6709\u6b64\u95e8\u9501\u7684\u5f00\u9501\u6743\u9650\u6216\u6743\u9650\u5df2\u8fc7\u671f"

    goto :goto_d9

    :cond_d1
    :goto_d1
    const-string p1, "\u767b\u5f55\u5df2\u8fc7\u671f\uff0c\u8bf7\u91cd\u65b0\u767b\u5f55"

    goto :goto_d9

    :cond_d4
    :goto_d4
    const-string p1, "\u7f51\u7edc\u8fde\u63a5\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8bbe\u7f6e\u540e\u91cd\u8bd5"

    goto :goto_d9

    :cond_d7
    const-string p1, "\u65e0\u6cd5\u9a8c\u8bc1\u6743\u9650\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    :goto_d9
    invoke-interface {v0, p1}, LY1/e;->a(Ljava/lang/String;)V

    :cond_dc
    return-void

    :pswitch_dd
    const-string v0, "\u670d\u52a1\u5668API\u8c03\u7528\u5931\u8d25: "

    invoke-static {v0, p1}, LA/e;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Ly1/A;->h:Ljava/lang/Object;

    check-cast v3, LK1/b;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "verifyOwnerFromServer"

    iget-object v4, p0, Ly1/A;->e:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-static {v3, v1, v2, v4}, LK1/b;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p1, v0}, LK1/c;->a(Ljava/lang/String;Ljava/lang/Exception;)LK1/c;

    move-result-object p1

    iget-object v0, p0, Ly1/A;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object p1, p0, Ly1/A;->g:Ljava/lang/Object;

    check-cast p1, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    nop

    :pswitch_data_118
    .packed-switch 0x1
        :pswitch_dd
    .end packed-switch
.end method

.method public b(Lcom/macronum/bledemo/model/BluetoothDevice;)Z
    .registers 16

    iget-object v0, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v0, LE1/a;

    iget-object v1, p0, Ly1/A;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const-string v2, "DeviceManager"

    const/4 v3, 0x0

    :try_start_b
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1c

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/macronum/bledemo/model/BluetoothDevice;->setAddress(Ljava/lang/String;)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_18} :catch_19

    goto :goto_1c

    :catch_19
    move-exception p1

    goto/16 :goto_223

    :cond_1c
    :goto_1c
    const/4 v5, 0x1

    :try_start_1d
    const-string v6, "device_deleted_list"

    invoke-virtual {v1, v6, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-static {v6}, LC0/f;->Q(Landroid/content/SharedPreferences;)Ljava/util/HashSet;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_34} :catch_73

    move v10, v3

    :cond_35
    :goto_35
    :try_start_35
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_59

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    const-string v12, "\\|"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    array-length v13, v12

    if-lez v13, :cond_35

    aget-object v12, v12, v3

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_35

    invoke-virtual {v9, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move v10, v5

    goto :goto_35

    :catch_57
    move-exception v6

    goto :goto_75

    :cond_59
    invoke-virtual {v9}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5d
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v6, v8}, LC0/f;->j0(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    goto :goto_5d

    :cond_6d
    invoke-virtual {v9}, Ljava/util/HashSet;->isEmpty()Z
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_70} :catch_57

    goto :goto_7a

    :goto_71
    move v10, v3

    goto :goto_75

    :catch_73
    move-exception v6

    goto :goto_71

    :goto_75
    :try_start_75
    const-string v7, "\u79fb\u9664\u5df2\u5220\u9664\u95e8\u9501\u5217\u8868\u5931\u8d25"

    invoke-static {v2, v7, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_7a} :catch_19

    :goto_7a
    const-string v6, "^[0-9]{6}$"

    const/4 v7, 0x6

    if-eqz v10, :cond_a5

    :try_start_7f
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_a5

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_a5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-ne v9, v7, :cond_9a

    invoke-virtual {v8, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_9a

    goto :goto_a5

    :catch_98
    move-exception v8

    goto :goto_a0

    :cond_9a
    const-string v8, ""

    invoke-virtual {p1, v8}, Lcom/macronum/bledemo/model/BluetoothDevice;->setPassword(Ljava/lang/String;)V
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_7f .. :try_end_9f} :catch_98

    goto :goto_a5

    :goto_a0
    :try_start_a0
    const-string v9, "\u5904\u7406\u91cd\u65b0\u6dfb\u52a0\u95e8\u9501\u7684\u5bc6\u7801\u5931\u8d25"

    invoke-static {v2, v9, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_a5
    :goto_a5
    invoke-virtual {v0, v4}, LE1/a;->H(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d7

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_be

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v7, :cond_be

    invoke-virtual {v0, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_be

    goto :goto_d2

    :cond_be
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8bbe\u5907\u5df2\u5b58\u5728\uff0c\u4f46\u4f20\u5165\u7684\u8bbe\u5907\u5bf9\u8c61\u6ca1\u6709\u6709\u6548\u5bc6\u7801\uff0c\u4fdd\u7559\u6570\u636e\u5e93\u4e2d\u7684\u5bc6\u7801: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_d2
    invoke-virtual {p0, p1}, Ly1/A;->p(Lcom/macronum/bledemo/model/BluetoothDevice;)Z

    move-result p1

    return p1

    :cond_d7
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_e7

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_107

    :cond_e7
    invoke-virtual {v0}, LE1/a;->D()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u95e8\u9501"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v4, v5

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/macronum/bledemo/model/BluetoothDevice;->setName(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    :cond_107
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_13c

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_118

    goto :goto_13c

    :cond_118
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result v4

    if-nez v4, :cond_135

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_135

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_135

    invoke-virtual {p1, v5}, Lcom/macronum/bledemo/model/BluetoothDevice;->setShared(Z)V

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    goto :goto_13f

    :cond_135
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    goto :goto_13f

    :cond_13c
    :goto_13c
    invoke-virtual {p1, v3}, Lcom/macronum/bledemo/model/BluetoothDevice;->setShared(Z)V

    :goto_13f
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_14f

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_152

    :cond_14f
    invoke-virtual {p1, v3}, Lcom/macronum/bledemo/model/BluetoothDevice;->setSensitiveSynced(Z)V

    :cond_152
    invoke-virtual {v0, p1}, LE1/a;->a(Lcom/macronum/bledemo/model/BluetoothDevice;)Z

    move-result v4

    if-nez v4, :cond_1a8

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u6dfb\u52a0\u95e8\u9501\u521d\u6b21\u5931\u8d25\uff0c\u5c1d\u8bd5\u4f5c\u4e3a\u66f4\u65b0\u64cd\u4f5c\u91cd\u8bd5: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, p1}, LE1/a;->J(Lcom/macronum/bledemo/model/BluetoothDevice;)Z

    move-result v0

    if-eqz v0, :cond_190

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_179
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_179} :catch_19

    if-eqz v1, :cond_1a9

    :try_start_17b
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v0

    if-eqz v0, :cond_1a9

    invoke-static {}, LR1/a;->d()LR1/a;

    move-result-object v0

    invoke-virtual {v0, v1}, LR1/a;->e(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, LR1/a;->h(Lcom/macronum/bledemo/model/BluetoothDevice;)V
    :try_end_18f
    .catch Ljava/lang/Exception; {:try_start_17b .. :try_end_18f} :catch_1a9

    goto :goto_1a9

    :cond_190
    :try_start_190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u6dfb\u52a0\u95e8\u9501\u5f7b\u5e95\u5931\u8d25\uff08\u6dfb\u52a0\u548c\u66f4\u65b0\u5747\u65e0\u6548\uff09: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1a8
    move v5, v4

    :catch_1a9
    :cond_1a9
    :goto_1a9
    if-eqz v5, :cond_20a

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1de

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4
    :try_end_1b8
    .catch Ljava/lang/Exception; {:try_start_190 .. :try_end_1b8} :catch_19

    if-eqz v4, :cond_1bb

    goto :goto_1de

    :cond_1bb
    :try_start_1bb
    const-string v4, "lock_added_times"

    invoke-virtual {v1, v4, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-interface {v4, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1d3
    .catch Ljava/lang/Exception; {:try_start_1bb .. :try_end_1d3} :catch_1d4

    goto :goto_1de

    :catch_1d4
    move-exception v4

    :try_start_1d5
    const-string v6, "\u8bb0\u5f55\u95e8\u9501\u6dfb\u52a0\u65f6\u95f4\u5931\u8d25: "

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1de
    .catch Ljava/lang/Exception; {:try_start_1d5 .. :try_end_1de} :catch_19

    :cond_1de
    :goto_1de
    :try_start_1de
    new-instance v0, Landroid/content/Intent;

    const-string v4, "com.macronum.bledemo.ACTION_DEVICES_UPDATED"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1fb

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    goto :goto_1fc

    :cond_1fb
    const/4 v4, 0x0

    :goto_1fc
    if-eqz v4, :cond_203

    const-string v6, "new_lock_mac"

    invoke-virtual {v0, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_203
    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_206
    .catch Ljava/lang/Exception; {:try_start_1de .. :try_end_206} :catch_206

    :catch_206
    :try_start_206
    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    goto :goto_222

    :cond_20a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6dfb\u52a0\u95e8\u9501\u5931\u8d25: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_222
    .catch Ljava/lang/Exception; {:try_start_206 .. :try_end_222} :catch_19

    :goto_222
    return v5

    :goto_223
    const-string v0, "\u6dfb\u52a0\u95e8\u9501\u51fa\u9519"

    invoke-static {v2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v3
.end method

.method public d(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    iget v2, v1, Ly1/A;->b:I

    packed-switch v2, :pswitch_data_2b2

    iget-object v2, v1, Ly1/A;->g:Ljava/lang/Object;

    check-cast v2, Lcom/macronum/bledemo/model/BluetoothDevice;

    const-string v3, "ACTIVE"

    iget-object v4, v1, Ly1/A;->f:Ljava/lang/Object;

    check-cast v4, LY1/e;

    iget-object v5, v1, Ly1/A;->h:Ljava/lang/Object;

    check-cast v5, LY1/f;

    const-string v6, "HybridUnlockManager"

    :try_start_19
    new-instance v7, LE2/i;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    const/4 v8, 0x0

    iput-boolean v8, v7, LE2/i;->a:Z

    iput-boolean v8, v7, LE2/i;->b:Z

    const/4 v9, 0x0

    iput-object v9, v7, LE2/i;->c:Ljava/lang/Object;

    iput-object v9, v7, LE2/i;->d:Ljava/io/Serializable;

    instance-of v9, v0, Lorg/json/JSONObject;

    if-eqz v9, :cond_1d1

    check-cast v0, Lorg/json/JSONObject;

    const-string v9, "permissions"

    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    const-string v10, "owner_id"

    const-string v11, ""

    invoke-virtual {v0, v10, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_3c} :catch_56

    const/4 v11, 0x1

    iget-object v12, v1, Ly1/A;->d:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    if-eqz v10, :cond_5a

    :try_start_43
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_5a

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5a

    iput-boolean v11, v7, LE2/i;->a:Z

    iput-boolean v11, v7, LE2/i;->b:Z
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_53} :catch_56

    move v10, v11

    :goto_54
    move v13, v10

    goto :goto_5c

    :catch_56
    move-exception v0

    move-object v13, v2

    goto/16 :goto_1d6

    :cond_5a
    move v10, v8

    goto :goto_54

    :goto_5c
    iget-object v14, v1, Ly1/A;->e:Ljava/lang/Object;

    check-cast v14, Ljava/lang/String;

    if-nez v10, :cond_10a

    if-eqz v9, :cond_10a

    move v15, v8

    :goto_65
    :try_start_65
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v15, v11, :cond_10a

    invoke-virtual {v9, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v8, "user_id"

    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v16, v9

    const-string v9, "role"

    move/from16 v17, v13

    const-string v13, "guest"

    invoke-virtual {v11, v9, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v9, "status"

    invoke-virtual {v11, v9, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v12, :cond_fd

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_fd

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u3010\u6743\u9650\u9a8c\u8bc1\u3011\u6743\u9650\u72b6\u6001\u65e0\u6548: lockMac="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", status="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "\u60a8\u7684\u6743\u9650\u5df2\u88ab\u64a4\u9500\uff0c\u65e0\u6cd5\u5f00\u9501"

    invoke-static {v5, v14, v0, v4}, LY1/f;->c(LY1/f;Ljava/lang/String;Ljava/lang/String;LY1/e;)V

    goto/16 :goto_1e7

    :cond_b7
    const-string v3, "remote_allowed"

    const/4 v8, 0x0

    invoke-virtual {v11, v3, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    const-string v9, "ble_allowed"

    invoke-virtual {v11, v9, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v9

    const-string v8, "starts_at"
    :try_end_c6
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_c6} :catch_56

    move-object v13, v2

    const-wide/16 v1, 0x0

    :try_start_c9
    invoke-virtual {v11, v8, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    const-string v8, "expires_at"

    invoke-virtual {v11, v8, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    const-string v1, "password_md5"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "original_password"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v8, 0x1

    if-ne v3, v8, :cond_e2

    move v3, v8

    goto :goto_e3

    :cond_e2
    const/4 v3, 0x0

    :goto_e3
    iput-boolean v3, v7, LE2/i;->a:Z

    if-ne v9, v8, :cond_e9

    const/4 v3, 0x1

    goto :goto_ea

    :cond_e9
    const/4 v3, 0x0

    :goto_ea
    iput-boolean v3, v7, LE2/i;->b:Z

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_f8

    iput-object v2, v7, LE2/i;->d:Ljava/io/Serializable;

    goto :goto_fa

    :catch_f5
    move-exception v0

    goto/16 :goto_1d6

    :cond_f8
    iput-object v1, v7, LE2/i;->d:Ljava/io/Serializable;
    :try_end_fa
    .catch Ljava/lang/Exception; {:try_start_c9 .. :try_end_fa} :catch_f5

    :goto_fa
    const/16 v17, 0x1

    goto :goto_10d

    :cond_fd
    move-object v13, v2

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v1, p0

    move-object v2, v13

    move-object/from16 v9, v16

    move/from16 v13, v17

    const/4 v8, 0x0

    goto/16 :goto_65

    :cond_10a
    move/from16 v17, v13

    move-object v13, v2

    :goto_10d
    const-string v1, "\u60a8\u6ca1\u6709\u5f00\u9501\u6743\u9650"

    if-nez v17, :cond_132

    :try_start_111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u3010\u6743\u9650\u9a8c\u8bc1\u3011\u672a\u627e\u5230\u6743\u9650\u8bb0\u5f55: lockMac="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", userId="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v5, v14, v1, v4}, LY1/f;->c(LY1/f;Ljava/lang/String;Ljava/lang/String;LY1/e;)V

    goto/16 :goto_1e7

    :cond_132
    if-nez v10, :cond_155

    iget-boolean v2, v7, LE2/i;->a:Z

    if-nez v2, :cond_155

    iget-boolean v2, v7, LE2/i;->b:Z

    if-nez v2, :cond_155

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u3010\u6743\u9650\u9a8c\u8bc1\u3011\u6ca1\u6709\u4efb\u4f55\u5f00\u9501\u6743\u9650: lockMac="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v5, v14, v1, v4}, LY1/f;->c(LY1/f;Ljava/lang/String;Ljava/lang/String;LY1/e;)V

    goto/16 :goto_1e7

    :cond_155
    iget-boolean v1, v7, LE2/i;->a:Z

    if-eqz v1, :cond_1d2

    const-string v1, "gateways"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_167

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_16d

    :cond_167
    const-string v1, "gateway_relations"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    :cond_16d
    if-eqz v1, :cond_1b3

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_1b3

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "device_id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_18c

    const-string v1, "gateway_id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_18c
    const-string v2, "online_status"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1d2

    new-instance v3, LN1/e;

    invoke-direct {v3}, LN1/e;-><init>()V

    iput-object v1, v3, LN1/e;->b:Ljava/lang/String;

    const-string v8, "device_name"

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, LN1/e;->c:Ljava/lang/String;

    const/4 v0, 0x1

    if-ne v2, v0, :cond_1ad

    move v8, v0

    goto :goto_1ae

    :cond_1ad
    const/4 v8, 0x0

    :goto_1ae
    iput-boolean v8, v3, LN1/e;->e:Z

    iput-object v3, v7, LE2/i;->c:Ljava/lang/Object;
    :try_end_1b2
    .catch Ljava/lang/Exception; {:try_start_111 .. :try_end_1b2} :catch_f5

    goto :goto_1d2

    :cond_1b3
    if-eqz v10, :cond_1d2

    :try_start_1b5
    invoke-static {}, LN1/f;->k()LN1/f;

    move-result-object v0

    invoke-virtual {v0, v14}, LN1/f;->o(Ljava/lang/String;)LN1/e;

    move-result-object v0

    if-eqz v0, :cond_1c4

    iput-object v0, v7, LE2/i;->c:Ljava/lang/Object;

    goto :goto_1d2

    :catch_1c2
    move-exception v0

    goto :goto_1c8

    :cond_1c4
    const/4 v1, 0x0

    iput-boolean v1, v7, LE2/i;->a:Z
    :try_end_1c7
    .catch Ljava/lang/Exception; {:try_start_1b5 .. :try_end_1c7} :catch_1c2

    goto :goto_1d2

    :goto_1c8
    :try_start_1c8
    const-string v1, "\u4ece\u672c\u5730\u6570\u636e\u5e93\u83b7\u53d6\u5173\u8054\u7f51\u5173\u5931\u8d25"

    invoke-static {v6, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v1, 0x0

    iput-boolean v1, v7, LE2/i;->a:Z

    goto :goto_1d2

    :cond_1d1
    move-object v13, v2

    :cond_1d2
    :goto_1d2
    invoke-static {v5, v13, v7, v4}, LY1/f;->e(LY1/f;Lcom/macronum/bledemo/model/BluetoothDevice;LE2/i;LY1/e;)V
    :try_end_1d5
    .catch Ljava/lang/Exception; {:try_start_1c8 .. :try_end_1d5} :catch_f5

    goto :goto_1e7

    :goto_1d6
    const-string v1, "\u5904\u7406\u670d\u52a1\u5668\u8fd4\u56de\u7684\u95e8\u9501\u8be6\u60c5\u5931\u8d25"

    invoke-static {v6, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {v13}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, LY1/f;->g(Ljava/lang/String;)V

    const-string v0, "\u83b7\u53d6\u6743\u9650\u4fe1\u606f\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-interface {v4, v0}, LY1/e;->a(Ljava/lang/String;)V

    :goto_1e7
    return-void

    :pswitch_1e8
    iget-object v2, v1, Ly1/A;->e:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Ly1/A;->h:Ljava/lang/Object;

    check-cast v3, LK1/b;

    iget-object v4, v1, Ly1/A;->g:Ljava/lang/Object;

    check-cast v4, Ljava/util/concurrent/CountDownLatch;

    iget-object v5, v1, Ly1/A;->f:Ljava/lang/Object;

    check-cast v5, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v6, ""

    const-string v7, "\u901a\u8fc7\u670d\u52a1\u5668API\u9a8c\u8bc1\uff0c\u95e8\u9501ownerId="

    :try_start_1fc
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Lorg/json/JSONObject;

    const-string v8, "owner_id"

    invoke-virtual {v0, v8, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9
    :try_end_20b
    .catch Ljava/lang/Exception; {:try_start_1fc .. :try_end_20b} :catch_227
    .catchall {:try_start_1fc .. :try_end_20b} :catchall_224

    const-string v10, "SERVER_API"

    if-nez v9, :cond_229

    :try_start_20f
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v10, v6, v0}, LK1/c;->b(Ljava/lang/String;Ljava/lang/String;Z)LK1/c;

    move-result-object v6

    iput-boolean v0, v6, LK1/c;->c:Z

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_26a

    :catchall_224
    move-exception v0

    goto/16 :goto_2ad

    :catch_227
    move-exception v0

    goto :goto_26e

    :cond_229
    const-string v7, "permissions"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v7, 0x0

    if-eqz v0, :cond_25c

    move v8, v7

    :goto_233
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_25c

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const-string v11, "user_id"

    invoke-virtual {v9, v11, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "role"

    invoke-virtual {v9, v12, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_259

    const-string v11, "owner"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_259

    const/4 v7, 0x1

    goto :goto_25c

    :cond_259
    add-int/lit8 v8, v8, 0x1

    goto :goto_233

    :cond_25c
    :goto_25c
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "\u901a\u8fc7\u670d\u52a1\u5668API\u6743\u9650\u5217\u8868\u9a8c\u8bc1"

    invoke-static {v10, v0, v7}, LK1/c;->b(Ljava/lang/String;Ljava/lang/String;Z)LK1/c;

    move-result-object v0

    iput-boolean v7, v0, LK1/c;->c:Z

    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_26a
    .catch Ljava/lang/Exception; {:try_start_20f .. :try_end_26a} :catch_227
    .catchall {:try_start_20f .. :try_end_26a} :catchall_224

    :goto_26a
    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_2ac

    :goto_26e
    :try_start_26e
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u89e3\u6790\u670d\u52a1\u5668\u6743\u9650\u6570\u636e\u65f6\u53d1\u751f\u5f02\u5e38: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "verifyOwnerFromServer"

    iget-object v8, v1, Ly1/A;->d:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7, v6, v8, v2, v0}, LK1/b;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u89e3\u6790\u670d\u52a1\u5668\u6570\u636e\u5f02\u5e38: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, LK1/c;->a(Ljava/lang/String;Ljava/lang/Exception;)LK1/c;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_2ab
    .catchall {:try_start_26e .. :try_end_2ab} :catchall_224

    goto :goto_26a

    :goto_2ac
    return-void

    :goto_2ad
    invoke-virtual {v4}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v0

    nop

    :pswitch_data_2b2
    .packed-switch 0x1
        :pswitch_1e8
    .end packed-switch
.end method

.method public e(Ljava/lang/String;Ly1/z;ZLjava/lang/String;)Z
    .registers 21

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    const-string v1, "\u6e05\u9664\u95e8\u9501\u7ed1\u5b9a\u5173\u7cfb\u5931\u8d25: lockMac="

    const-string v2, "\u5220\u9664\u672c\u5730\u95e8\u9501\u5931\u8d25\uff08\u53ef\u80fd\u5df2\u4e0d\u5b58\u5728\u6216\u6570\u636e\u5e93\u9501\u5b9a\uff09: lockMac="

    const-string v0, "\u95e8\u9501\u4e0d\u5b58\u5728\u4e8e\u672c\u5730\u6570\u636e\u5e93\uff0c\u5c1d\u8bd5\u5f3a\u5236\u5220\u9664: "

    const/4 v10, 0x0

    if-eqz v8, :cond_399

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_17

    goto/16 :goto_399

    :cond_17
    :try_start_17
    invoke-virtual/range {p0 .. p1}, Ly1/A;->g(Ljava/lang/String;)Lcom/macronum/bledemo/model/BluetoothDevice;

    move-result-object v3

    if-nez v3, :cond_2a

    const-string v4, "DeviceManager"

    invoke-virtual {v0, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2a

    :catch_27
    move-exception v0

    goto/16 :goto_37a

    :cond_2a
    :goto_2a
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    if-eqz v0, :cond_36

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    :goto_34
    move-object v4, v0

    goto :goto_38

    :cond_36
    const/4 v0, 0x0

    goto :goto_34

    :goto_38
    const/4 v11, 0x1

    if-eqz v3, :cond_60

    if-eqz v4, :cond_60

    invoke-virtual {v3}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-virtual {v3}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_55

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    move v0, v11

    goto :goto_56

    :cond_55
    move v0, v10

    :goto_56
    move v5, v0

    move-object v6, v4

    move-object v12, v6

    :goto_59
    move v0, v11

    goto :goto_90

    :cond_5b
    move-object v6, v4

    move-object v12, v6

    move v0, v11

    :goto_5e
    move v5, v0

    goto :goto_90

    :cond_60
    if-eqz v3, :cond_84

    if-nez v4, :cond_84

    invoke-virtual {v3}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result v0
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_68} :catch_27

    xor-int/2addr v0, v11

    :try_start_69
    iget-object v5, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "android_id"

    invoke-static {v5, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_7a

    goto :goto_7f

    :cond_7a
    const-string v5, "guest"
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_7c} :catch_7d

    goto :goto_7f

    :catch_7d
    :try_start_7d
    const-string v5, "guest"

    :goto_7f
    const-string v6, "PENDING"

    move-object v12, v5

    move v5, v0

    goto :goto_59

    :cond_84
    if-nez v3, :cond_8c

    if-eqz v4, :cond_8c

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    :cond_8c
    move-object v6, v4

    move-object v12, v6

    move v0, v10

    goto :goto_5e

    :goto_90
    if-eqz p3, :cond_96

    if-eqz v0, :cond_96

    move v13, v11

    goto :goto_97

    :cond_96
    move v13, v10

    :goto_97
    if-eqz v6, :cond_9d

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_9d} :catch_27

    :cond_9d
    if-eqz v3, :cond_ad

    :try_start_9f
    const-string v0, ""

    invoke-virtual {v3, v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->setPassword(Ljava/lang/String;)V
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_9f .. :try_end_a4} :catch_a5

    goto :goto_ad

    :catch_a5
    move-exception v0

    :try_start_a6
    const-string v6, "DeviceManager"

    const-string v14, "\u6e05\u9664\u8bbe\u5907\u5bf9\u8c61\u5bc6\u7801\u5931\u8d25"

    invoke-static {v6, v14, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_ad
    :goto_ad
    iget-object v6, v7, Ly1/A;->g:Ljava/lang/Object;

    monitor-enter v6
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_a6 .. :try_end_b0} :catch_27

    :try_start_b0
    iget-object v0, v7, Ly1/A;->d:Ljava/lang/Object;

    check-cast v0, LE1/a;

    invoke-virtual {v0, v8}, LE1/a;->t(Ljava/lang/String;)Z

    move-result v0

    monitor-exit v6
    :try_end_b9
    .catchall {:try_start_b0 .. :try_end_b9} :catchall_377

    if-nez v0, :cond_c7

    :try_start_bb
    const-string v0, "DeviceManager"

    invoke-virtual {v2, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_c4
    move-object v15, v12

    goto/16 :goto_1a7

    :cond_c7
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0
    :try_end_cb
    .catch Ljava/lang/Exception; {:try_start_bb .. :try_end_cb} :catch_27

    if-eqz v0, :cond_ce

    goto :goto_f3

    :cond_ce
    :try_start_ce
    iget-object v0, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v2, "lock_added_times"

    invoke-virtual {v0, v2, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_e6
    .catch Ljava/lang/Exception; {:try_start_ce .. :try_end_e6} :catch_e7

    goto :goto_f3

    :catch_e7
    move-exception v0

    :try_start_e8
    const-string v2, "\u6e05\u9664\u95e8\u9501\u6dfb\u52a0\u65f6\u95f4\u8bb0\u5f55\u5931\u8d25: "

    invoke-virtual {v2, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v6, "DeviceManager"

    invoke-static {v6, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_f3
    .catch Ljava/lang/Exception; {:try_start_e8 .. :try_end_f3} :catch_27

    :goto_f3
    :try_start_f3
    iget-object v0, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, LS1/A;->w(Landroid/content/Context;)LS1/A;

    move-result-object v0

    invoke-virtual {v0, v8}, LS1/A;->t(Ljava/lang/String;)V
    :try_end_fe
    .catch Ljava/lang/Exception; {:try_start_f3 .. :try_end_fe} :catch_ff

    goto :goto_11d

    :catch_ff
    move-exception v0

    :try_start_100
    const-string v2, "DeviceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", error="

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_11d
    .catch Ljava/lang/Exception; {:try_start_100 .. :try_end_11d} :catch_27

    :goto_11d
    :try_start_11d
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.macronum.bledemo.LOCK_DELETED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "lockMac"

    invoke-virtual {v0, v1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_13d

    move-object/from16 v1, p4

    goto :goto_13f

    :cond_13d
    const-string v1, "user"

    :goto_13f
    const-string v2, "deleteReason"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_14b
    .catch Ljava/lang/Exception; {:try_start_11d .. :try_end_14b} :catch_14b

    :catch_14b
    :try_start_14b
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.macronum.bledemo.ACTION_DEVICES_UPDATED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_164
    .catch Ljava/lang/Exception; {:try_start_14b .. :try_end_164} :catch_164

    :catch_164
    :try_start_164
    invoke-static {}, LN1/f;->k()LN1/f;

    move-result-object v0

    iget-object v1, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v0, v1}, LN1/f;->q(Landroid/content/Context;)V

    invoke-virtual {v0}, LN1/f;->j()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_17b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, LN1/e;

    if-eqz v6, :cond_198

    invoke-virtual {v6, v2}, LN1/e;->a(Ljava/lang/String;)I

    move-result v14
    :try_end_18d
    .catch Ljava/lang/Exception; {:try_start_164 .. :try_end_18d} :catch_19a

    if-ltz v14, :cond_198

    move-object v15, v12

    :try_start_190
    iget-wide v11, v6, LN1/e;->a:J

    invoke-virtual {v0, v11, v12, v14}, LN1/f;->f(JI)Z
    :try_end_195
    .catch Ljava/lang/Exception; {:try_start_190 .. :try_end_195} :catch_196

    goto :goto_19d

    :catch_196
    move-exception v0

    goto :goto_1a0

    :cond_198
    move-object v15, v12

    goto :goto_19d

    :catch_19a
    move-exception v0

    move-object v15, v12

    goto :goto_1a0

    :goto_19d
    move-object v12, v15

    const/4 v11, 0x1

    goto :goto_17b

    :goto_1a0
    :try_start_1a0
    const-string v1, "DeviceManager"

    const-string v2, "\u6e05\u7406\u672c\u5730\u7f51\u5173\u6620\u5c04\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1a7
    .catch Ljava/lang/Exception; {:try_start_1a0 .. :try_end_1a7} :catch_27

    :goto_1a7
    if-eqz v9, :cond_1ac

    :try_start_1a9
    invoke-interface/range {p2 .. p2}, Ly1/z;->c()V
    :try_end_1ac
    .catch Ljava/lang/Exception; {:try_start_1a9 .. :try_end_1ac} :catch_1ac

    :catch_1ac
    :cond_1ac
    :try_start_1ac
    iget-object v0, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "device_deleted_list"

    invoke-virtual {v0, v1, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "deleted_lock_macs"

    if-eqz v0, :cond_1ed

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1ed

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1e3

    goto :goto_1ed

    :cond_1e3
    invoke-static {v0}, LC0/f;->Q(Landroid/content/SharedPreferences;)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-static {v0, v2}, LC0/f;->p0(Landroid/content/SharedPreferences;Ljava/util/HashSet;)V

    :cond_1ed
    :goto_1ed
    invoke-static {v0}, Ly1/A;->c(Landroid/content/SharedPreferences;)V
    :try_end_1f0
    .catch Ljava/lang/Exception; {:try_start_1ac .. :try_end_1f0} :catch_1f1

    goto :goto_1f9

    :catch_1f1
    move-exception v0

    :try_start_1f2
    const-string v1, "DeviceManager"

    const-string v2, "\u8bb0\u5f55\u5df2\u5220\u9664\u95e8\u9501\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1f9
    if-eqz v13, :cond_304

    iget-object v0, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_304

    if-eqz v15, :cond_304

    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    move-result v0
    :try_end_207
    .catch Ljava/lang/Exception; {:try_start_1f2 .. :try_end_207} :catch_27

    if-nez v0, :cond_304

    :try_start_209
    iget-object v0, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-nez v0, :cond_219

    goto/16 :goto_2e6

    :cond_219
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    if-nez v1, :cond_221

    goto/16 :goto_2e6

    :cond_221
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v0

    if-eqz v0, :cond_2e6

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v1

    if-eqz v1, :cond_2e6

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v0
    :try_end_235
    .catch Ljava/lang/Exception; {:try_start_209 .. :try_end_235} :catch_2de

    if-eqz v0, :cond_2e6

    :try_start_237
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v1

    if-eqz v1, :cond_24b

    iget-object v0, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v1, v0}, LB1/c;->g(Landroid/content/Context;)V

    move-object v11, v15

    iput-object v11, v1, LB1/c;->e:Ljava/lang/String;
    :try_end_247
    .catch Ljava/lang/Exception; {:try_start_237 .. :try_end_247} :catch_248

    goto :goto_24c

    :catch_248
    move-exception v0

    goto/16 :goto_2ad

    :cond_24b
    move-object v11, v15

    :goto_24c
    if-eqz v5, :cond_264

    :try_start_24e
    new-instance v0, LB1/A;

    invoke-direct {v0, v1}, LB1/A;-><init>(LB1/c;)V

    new-instance v2, Ly1/y;

    invoke-direct {v2, v8, v0, v11}, Ly1/y;-><init>(Ljava/lang/String;LB1/A;Ljava/lang/String;)V

    invoke-virtual {v0, v8, v11, v2}, LB1/A;->b(Ljava/lang/String;Ljava/lang/String;LB1/z;)V
    :try_end_25b
    .catch Ljava/lang/Exception; {:try_start_24e .. :try_end_25b} :catch_25c

    goto :goto_264

    :catch_25c
    move-exception v0

    :try_start_25d
    const-string v2, "DeviceManager"

    const-string v3, "\u9884\u53d6\u6d88\u5173\u8054\u6d41\u7a0b\u5f02\u5e38(\u5ffd\u7565\u7ee7\u7eed\u5220\u9664)"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_264
    :goto_264
    if-eqz v5, :cond_283

    new-instance v2, LB1/A;

    invoke-direct {v2, v1}, LB1/A;-><init>(LB1/c;)V

    new-instance v5, LY1/f;

    invoke-direct {v5, v7, v8, v11, v9}, LY1/f;-><init>(Ly1/A;Ljava/lang/String;Ljava/lang/String;Ly1/z;)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v12, LB1/h;

    const/4 v6, 0x2

    move-object v1, v12

    move-object/from16 v3, p1

    move-object v4, v11

    invoke-direct/range {v1 .. v6}, LB1/h;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-direct {v0, v12}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_2aa

    :cond_283
    new-instance v0, LB1/l;

    invoke-direct {v0, v1}, LB1/l;-><init>(LB1/c;)V

    new-instance v12, Lb2/r;

    const/4 v6, 0x4

    move-object v1, v12

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object v4, v11

    move-object/from16 v5, p2

    invoke-direct/range {v1 .. v6}, Lb2/r;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/lang/Object;I)V

    new-instance v13, Ljava/lang/Thread;

    new-instance v14, LB1/h;

    const/4 v6, 0x3

    move-object v1, v14

    move-object v2, v0

    move-object/from16 v3, p1

    move-object v4, v11

    move-object v5, v12

    invoke-direct/range {v1 .. v6}, LB1/h;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-direct {v13, v14}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v13}, Ljava/lang/Thread;->start()V
    :try_end_2aa
    .catch Ljava/lang/Exception; {:try_start_25d .. :try_end_2aa} :catch_248

    :cond_2aa
    :goto_2aa
    const/4 v1, 0x1

    goto/16 :goto_376

    :goto_2ad
    :try_start_2ad
    const-string v1, "DeviceManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u540c\u6b65\u5220\u9664\u5230\u670d\u52a1\u5668\u5931\u8d25: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    if-eqz v9, :cond_2aa

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5220\u9664\u95e8\u9501\u5931\u8d25: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Ly1/z;->a(Ljava/lang/String;)V

    goto :goto_2aa

    :catch_2de
    move-exception v0

    const-string v1, "DeviceManager"

    const-string v2, "\u68c0\u67e5\u7f51\u7edc\u72b6\u6001\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2e6
    :goto_2e6
    const-string v0, "DeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5220\u9664\u95e8\u9501\u9700\u8981\u7f51\u7edc\u8fde\u63a5\uff0c\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528: address="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v9, :cond_303

    const-string v0, "\u5220\u9664\u95e8\u9501\u9700\u8981\u7f51\u7edc\u8fde\u63a5\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8bbe\u7f6e"

    invoke-interface {v9, v0}, Ly1/z;->a(Ljava/lang/String;)V

    :cond_303
    return v10

    :cond_304
    if-nez v13, :cond_340

    const-string v0, "DeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u4e0d\u540c\u6b65\u5230\u670d\u52a1\u5668: address="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", shouldSync="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", userId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_325

    goto :goto_327

    :cond_325
    const-string v4, "null"

    :goto_327
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", device\u5b58\u5728="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v3, :cond_333

    const/4 v2, 0x1

    goto :goto_334

    :cond_333
    move v2, v10

    :goto_334
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2aa

    :cond_340
    const-string v0, "DeviceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u65e0\u6cd5\u540c\u6b65\u5230\u670d\u52a1\u5668: address="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", context="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v7, Ly1/A;->e:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    if-eqz v2, :cond_35c

    const/4 v2, 0x1

    goto :goto_35d

    :cond_35c
    move v2, v10

    :goto_35d
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", userId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_368

    goto :goto_36a

    :cond_368
    const-string v4, "null"

    :goto_36a
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_374
    .catch Ljava/lang/Exception; {:try_start_2ad .. :try_end_374} :catch_27

    goto/16 :goto_2aa

    :goto_376
    return v1

    :catchall_377
    move-exception v0

    :try_start_378
    monitor-exit v6
    :try_end_379
    .catchall {:try_start_378 .. :try_end_379} :catchall_377

    :try_start_379
    throw v0
    :try_end_37a
    .catch Ljava/lang/Exception; {:try_start_379 .. :try_end_37a} :catch_27

    :goto_37a
    const-string v1, "DeviceManager"

    const-string v2, "\u5220\u9664\u95e8\u9501\u51fa\u9519"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    if-eqz v9, :cond_398

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u5220\u9664\u5931\u8d25: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v9, v0}, Ly1/z;->a(Ljava/lang/String;)V

    :cond_398
    return v10

    :cond_399
    :goto_399
    const-string v0, "DeviceManager"

    const-string v1, "\u95e8\u9501\u5730\u5740\u65e0\u6548"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v9, :cond_3a7

    const-string v0, "\u95e8\u9501\u5730\u5740\u65e0\u6548"

    invoke-interface {v9, v0}, Ly1/z;->a(Ljava/lang/String;)V

    :cond_3a7
    return v10
.end method

.method public f()Ljava/util/ArrayList;
    .registers 11

    iget-object v0, p0, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v1, LE1/a;

    iget-object v2, p0, Ly1/A;->f:Ljava/lang/Object;

    check-cast v2, LJ1/b;

    const-string v3, "DeviceManager"

    if-eqz v2, :cond_17

    :try_start_10
    invoke-virtual {v2}, LJ1/b;->b()V

    goto :goto_17

    :catch_14
    move-exception v0

    goto/16 :goto_c6

    :cond_17
    :goto_17
    invoke-virtual {v1}, LE1/a;->D()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_29

    if-eqz v2, :cond_29

    invoke-virtual {v2, v4}, LJ1/b;->a(Ljava/util/ArrayList;)V

    :cond_29
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_2d} :catch_14

    if-nez v2, :cond_c5

    const/4 v2, 0x0

    if-nez v0, :cond_34

    :goto_32
    move v6, v2

    goto :goto_51

    :cond_34
    :try_start_34
    const-string v5, "device_sorting"

    invoke-virtual {v0, v5, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v6, "user_manual_sorting"

    invoke-interface {v5, v6, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_51

    const-string v7, "manual_sorting_timestamp"

    const-wide/16 v8, 0x0

    invoke-interface {v5, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_49} :catch_4a

    goto :goto_51

    :catch_4a
    move-exception v5

    :try_start_4b
    const-string v6, "\u68c0\u67e5\u7528\u6237\u624b\u52a8\u6392\u5e8f\u6807\u8bb0\u65f6\u53d1\u751f\u5f02\u5e38"

    invoke-static {v3, v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_32

    :cond_51
    :goto_51
    if-eqz v6, :cond_66

    new-instance v2, LC0/t;

    invoke-direct {v2, v1, v0}, LC0/t;-><init>(LE1/a;Landroid/content/Context;)V

    invoke-virtual {v2, v4}, LC0/t;->e(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_62

    invoke-virtual {p0}, Ly1/A;->m()Ljava/util/ArrayList;

    move-result-object v4

    :cond_62
    invoke-virtual {p0, v4}, Ly1/A;->r(Ljava/util/ArrayList;)V

    goto :goto_99

    :cond_66
    new-instance v5, LC0/t;

    invoke-direct {v5, v1, v0}, LC0/t;-><init>(LE1/a;Landroid/content/Context;)V

    invoke-virtual {v5, v4}, LC0/t;->e(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_75

    invoke-virtual {p0}, Ly1/A;->m()Ljava/util/ArrayList;

    move-result-object v4

    :cond_75
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7c

    goto :goto_8a

    :cond_7c
    invoke-interface {v4}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, La2/e;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, La2/e;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->allMatch(Ljava/util/function/Predicate;)Z

    move-result v2

    :goto_8a
    if-eqz v2, :cond_96

    invoke-virtual {v5, v4}, LC0/t;->b(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_96

    invoke-virtual {p0}, Ly1/A;->m()Ljava/util/ArrayList;

    move-result-object v4

    :cond_96
    invoke-virtual {p0, v4}, Ly1/A;->r(Ljava/util/ArrayList;)V

    :goto_99
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_9d
    :goto_9d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v1, :cond_9d

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result v2

    if-eqz v2, :cond_9d

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_c1

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9d

    :cond_c1
    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_c4
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_c4} :catch_14

    goto :goto_9d

    :cond_c5
    return-object v4

    :goto_c6
    const-string v1, "\u83b7\u53d6\u95e8\u9501\u5217\u8868\u5931\u8d25"

    invoke-static {v3, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public g(Ljava/lang/String;)Lcom/macronum/bledemo/model/BluetoothDevice;
    .registers 5

    const/4 v0, 0x0

    const-string v1, "DeviceManager"

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_c

    goto :goto_1c

    :cond_c
    :try_start_c
    iget-object v2, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v2, LE1/a;

    invoke-virtual {v2, p1}, LE1/a;->E(Ljava/lang/String;)Lcom/macronum/bledemo/model/BluetoothDevice;

    move-result-object p1
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_14} :catch_15

    return-object p1

    :catch_15
    move-exception p1

    const-string v2, "\u6839\u636e\u5730\u5740\u83b7\u53d6\u95e8\u9501\u51fa\u9519"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :cond_1c
    :goto_1c
    const-string p1, "\u95e8\u9501\u5730\u5740\u65e0\u6548"

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public i(Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x0

    const-string v1, "DeviceManager"

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_c

    goto :goto_1c

    :cond_c
    :try_start_c
    iget-object v2, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v2, LE1/a;

    invoke-virtual {v2, p1}, LE1/a;->H(Ljava/lang/String;)Z

    move-result p1
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_14} :catch_15

    return p1

    :catch_15
    move-exception p1

    const-string v2, "\u68c0\u67e5\u95e8\u9501\u662f\u5426\u5b58\u5728\u51fa\u9519"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0

    :cond_1c
    :goto_1c
    const-string p1, "\u95e8\u9501\u5730\u5740\u65e0\u6548"

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public j(Ljava/lang/String;)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_47

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_47

    :cond_a
    :try_start_a
    iget-object v1, p0, Ly1/A;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const-string v2, "device_deleted_list"

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {v1}, LC0/f;->Q(Landroid/content/SharedPreferences;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_47

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "\\|"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    if-lez v3, :cond_20

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_3b} :catch_3f

    if-eqz v2, :cond_20

    const/4 p1, 0x1

    return p1

    :catch_3f
    move-exception p1

    const-string v1, "DeviceManager"

    const-string v2, "\u68c0\u67e5\u5df2\u5220\u9664\u5217\u8868\u5931\u8d25"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_47
    :goto_47
    return v0
.end method

.method public l(Ljava/lang/String;)V
    .registers 6

    if-eqz p1, :cond_25

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_25

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Ly1/A;->h:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    monitor-enter v0

    :try_start_11
    iget-object v1, p0, Ly1/A;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    goto :goto_25

    :catchall_22
    move-exception p1

    monitor-exit v0
    :try_end_24
    .catchall {:try_start_11 .. :try_end_24} :catchall_22

    throw p1

    :cond_25
    :goto_25
    return-void
.end method

.method public m()Ljava/util/ArrayList;
    .registers 4

    :try_start_0
    iget-object v0, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v0, LE1/a;

    invoke-virtual {v0}, LE1/a;->D()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_c

    return-object v0

    :catch_c
    move-exception v0

    const-string v1, "DeviceManager"

    const-string v2, "\u8bbe\u5907\u5217\u8868\u91cd\u65b0\u52a0\u8f7d\u5931\u8d25\uff0c\u4f7f\u7528\u7a7a\u5217\u8868\u4f5c\u4e3a\u964d\u7ea7"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public n(Ljava/lang/String;)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    iget-object v0, p0, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "device_deleted_list"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {v0}, LC0/f;->Q(Landroid/content/SharedPreferences;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_23
    :goto_23
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_46

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "\\|"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    if-lez v7, :cond_23

    aget-object v6, v6, v2

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_23

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_23

    :catch_44
    move-exception v0

    goto :goto_60

    :cond_46
    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6b

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_50
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v0, v2}, LC0/f;->j0(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_5f} :catch_44

    goto :goto_50

    :goto_60
    const-string v1, "\u4ece\u5df2\u5220\u9664\u5217\u8868\u79fb\u9664\u95e8\u9501\u5931\u8d25: "

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "DeviceManager"

    invoke-static {v1, p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6b
    return-void
.end method

.method public o(Ljava/util/ArrayList;)Z
    .registers 6

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    :try_start_4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_d
    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v2, :cond_d

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_d

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_d

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :catch_33
    move-exception p1

    goto :goto_3e

    :cond_35
    iget-object p1, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast p1, LE1/a;

    invoke-virtual {p1, v1}, LE1/a;->K(Ljava/util/List;)Z

    move-result p1
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_3d} :catch_33

    return p1

    :goto_3e
    const-string v1, "DeviceManager"

    const-string v2, "\u4fdd\u5b58\u95e8\u9501\u987a\u5e8f\u51fa\u9519"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public p(Lcom/macronum/bledemo/model/BluetoothDevice;)Z
    .registers 7

    const-string v0, "\u66f4\u65b0\u95e8\u9501\u5931\u8d25: "

    const/4 v1, 0x0

    const-string v2, "DeviceManager"

    if-nez p1, :cond_d

    const-string p1, "\u95e8\u9501\u53c2\u6570\u4e3a\u7a7a"

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_d
    :try_start_d
    iget-object v3, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v3, LE1/a;

    invoke-virtual {v3, p1}, LE1/a;->J(Lcom/macronum/bledemo/model/BluetoothDevice;)Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_1a} :catch_35

    iget-object v0, p0, Ly1/A;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_4a

    :try_start_20
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v4

    invoke-virtual {v4}, LZ1/a;->i()Z

    move-result v4

    if-eqz v4, :cond_4a

    invoke-static {}, LR1/a;->d()LR1/a;

    move-result-object v4

    invoke-virtual {v4, v0}, LR1/a;->e(Landroid/content/Context;)V

    invoke-virtual {v4, p1}, LR1/a;->h(Lcom/macronum/bledemo/model/BluetoothDevice;)V

    goto :goto_4a

    :catch_35
    move-exception p1

    goto :goto_4b

    :cond_37
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_4a} :catch_35

    :cond_4a
    :goto_4a
    return v3

    :goto_4b
    const-string v0, "\u66f4\u65b0\u95e8\u9501\u51fa\u9519"

    invoke-static {v2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v1
.end method

.method public q(Lcom/macronum/bledemo/model/BluetoothDevice;)Z
    .registers 14

    iget-object v0, p0, Ly1/A;->d:Ljava/lang/Object;

    check-cast v0, LE1/a;

    const-string v1, "\u66f4\u65b0\u95e8\u9501\u5931\u8d25: "

    const-string v2, "\u3010updateDeviceWithoutSync\u3011\u9a8c\u8bc1\u6570\u636e\u5e93: address="

    const/4 v3, 0x0

    const-string v4, "DeviceManager"

    if-nez p1, :cond_13

    const-string p1, "\u95e8\u9501\u53c2\u6570\u4e3a\u7a7a"

    invoke-static {v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_13
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\u3010updateDeviceWithoutSync\u3011\u51c6\u5907\u66f4\u65b0: address="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", openTime="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOpenTime()I

    move-result v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ", waitTime="

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getWaitTime()I

    move-result v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", closeTime="

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getCloseTime()I

    move-result v10

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", attribute="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAttribute()I

    move-result v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_64
    invoke-virtual {v0, p1}, LE1/a;->J(Lcom/macronum/bledemo/model/BluetoothDevice;)Z

    move-result v5

    if-eqz v5, :cond_bf

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, LE1/a;->E(Ljava/lang/String;)Lcom/macronum/bledemo/model/BluetoothDevice;

    move-result-object p1

    if-eqz p1, :cond_d2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOpenTime()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getWaitTime()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getCloseTime()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAttribute()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d2

    :catch_bd
    move-exception p1

    goto :goto_d3

    :cond_bf
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d2
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_d2} :catch_bd

    :cond_d2
    :goto_d2
    return v5

    :goto_d3
    const-string v0, "\u66f4\u65b0\u95e8\u9501\u51fa\u9519"

    invoke-static {v4, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v3
.end method

.method public r(Ljava/util/ArrayList;)V
    .registers 4

    const-string v0, "DeviceManager"

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    :try_start_9
    invoke-static {p1}, LC0/t;->p(Ljava/util/ArrayList;)LR1/f;

    move-result-object v1

    iget-boolean v1, v1, LR1/f;->a:Z

    if-eqz v1, :cond_12

    goto :goto_21

    :cond_12
    const-string v1, "\u6392\u5e8f\u9a8c\u8bc1\u5931\u8d25\uff1a\u5b58\u5728\u91cd\u590d\u7684sort_order\u503c\uff0c\u9700\u8981\u8fdb\u4e00\u6b65\u4fee\u590d"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Ly1/A;->k(Ljava/util/ArrayList;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_1a} :catch_1b

    goto :goto_21

    :catch_1b
    move-exception p1

    const-string v1, "\u6392\u5e8f\u9a8c\u8bc1\u8fc7\u7a0b\u4e2d\u53d1\u751f\u5f02\u5e38"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_21
    return-void
.end method

