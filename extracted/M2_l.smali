.class public abstract LM2/l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:J = 0x0L

.field public static d:Ljava/lang/reflect/Method; = null

.field public static e:Z = true


# direct methods
.method public static A(Lf/g;Landroid/content/ComponentName;)Landroid/content/Intent;
    .registers 4

    invoke-static {p0, p1}, LM2/l;->B(Landroid/app/Activity;Landroid/content/ComponentName;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v1}, LM2/l;->B(Landroid/app/Activity;Landroid/content/ComponentName;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_1c

    invoke-static {v1}, Landroid/content/Intent;->makeMainActivity(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p0

    goto :goto_25

    :cond_1c
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p0

    :goto_25
    return-object p0
.end method

.method public static B(Landroid/app/Activity;Landroid/content/ComponentName;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_e

    const v1, 0x100c0280

    goto :goto_11

    :cond_e
    const v1, 0xc0280

    :goto_11
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object p1

    iget-object v0, p1, Landroid/content/pm/ActivityInfo;->parentActivityName:Ljava/lang/String;

    if-eqz v0, :cond_1a

    return-object v0

    :cond_1a
    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const/4 v0, 0x0

    if-nez p1, :cond_20

    return-object v0

    :cond_20
    const-string v1, "android.support.PARENT_ACTIVITY"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_29

    return-object v0

    :cond_29
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2e

    if-ne v0, v1, :cond_45

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_45
    return-object p1
.end method

.method public static C(Ljava/lang/String;Ljava/lang/Exception;)LK1/e;
    .registers 12

    const-string v0, "\u5904\u7406\u5f02\u5e38: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "LoginErrorHandler"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v0, 0x0

    :try_start_c
    invoke-static {v0}, LF1/d;->d(Landroid/content/Context;)LF1/d;

    move-result-object v0

    if-eqz v0, :cond_34

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\u5f02\u5e38: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, LF1/d;->h(Ljava/lang/String;)V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_2d} :catch_2e

    goto :goto_34

    :catch_2e
    move-exception v0

    const-string v2, "\u8bb0\u5f55\u8bca\u65ad\u4fe1\u606f\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_34
    :goto_34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Network"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x4

    const-string v6, "OutOfMemory"

    const-string v7, "Runtime"

    const-string v8, "Validation"

    const-string v9, "IllegalArgument"

    if-nez v2, :cond_12c

    const-string v2, "Connect"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12c

    const-string v2, "Socket"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12c

    const-string v2, "Timeout"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12c

    if-eqz v1, :cond_87

    const-string v2, "\u7f51\u7edc"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12c

    const-string v2, "\u8fde\u63a5"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12c

    const-string v2, "\u8d85\u65f6"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_87

    goto/16 :goto_12c

    :cond_87
    invoke-virtual {v0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12a

    invoke-virtual {v0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12a

    if-eqz v1, :cond_af

    const-string v2, "\u8f93\u5165"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12a

    const-string v2, "\u683c\u5f0f"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12a

    const-string v2, "\u9a8c\u8bc1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_af

    goto/16 :goto_12a

    :cond_af
    const-string v2, "Auth"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_128

    const-string v2, "Security"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_128

    if-eqz v1, :cond_da

    const-string v2, "\u8ba4\u8bc1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_128

    const-string v2, "\u767b\u5f55"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_128

    const-string v2, "\u6743\u9650"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_da

    goto :goto_128

    :cond_da
    const-string v2, "View"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_126

    const-string v2, "Activity"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_126

    const-string v2, "Fragment"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_126

    if-eqz v1, :cond_10d

    const-string v2, "\u754c\u9762"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_126

    const-string v2, "UI"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_126

    const-string v2, "\u89c6\u56fe"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_10d

    goto :goto_126

    :cond_10d
    invoke-virtual {v0, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_124

    const-string v1, "System"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_124

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_122

    goto :goto_124

    :cond_122
    const/4 v0, 0x6

    goto :goto_12d

    :cond_124
    :goto_124
    move v0, v5

    goto :goto_12d

    :cond_126
    :goto_126
    const/4 v0, 0x5

    goto :goto_12d

    :cond_128
    :goto_128
    move v0, v4

    goto :goto_12d

    :cond_12a
    :goto_12a
    move v0, v3

    goto :goto_12d

    :cond_12c
    :goto_12c
    const/4 v0, 0x1

    :goto_12d
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_162

    const-string v2, "Fatal"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_144

    goto :goto_162

    :cond_144
    invoke-virtual {v1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_160

    const-string v2, "IllegalState"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_153

    goto :goto_160

    :cond_153
    invoke-virtual {v1, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_163

    invoke-virtual {v1, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_160

    goto :goto_163

    :cond_160
    :goto_160
    move v3, v4

    goto :goto_163

    :cond_162
    :goto_162
    move v3, v5

    :cond_163
    :goto_163
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0, v3, p0}, LM2/l;->Y(Ljava/lang/String;IILjava/lang/String;)LK1/e;

    move-result-object p0

    return-object p0
.end method

.method public static D(Ljava/lang/String;Ljava/lang/String;)LK1/e;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u672a\u77e5\u9519\u8bef: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " - "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LoginErrorHandler"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p0, LK1/e;

    const-string p1, "\u53d1\u751f\u672a\u77e5\u9519\u8bef\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    const-string v0, "\u91cd\u65b0\u5c1d\u8bd5\u6216\u8054\u7cfb\u6280\u672f\u652f\u6301"

    invoke-direct {p0, p1, v0}, LK1/e;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final E(I)I
    .registers 4

    const/4 v0, 0x1

    if-eqz p0, :cond_15

    if-ne p0, v0, :cond_7

    const/4 v0, 0x2

    goto :goto_15

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Could not convert "

    const-string v2, " to BackoffPolicy"

    invoke-static {v1, p0, v2}, LA/e;->h(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    :goto_15
    return v0
.end method

.method public static final F(I)I
    .registers 4

    const/4 v0, 0x1

    if-eqz p0, :cond_28

    const/4 v1, 0x2

    if-eq p0, v0, :cond_27

    const/4 v0, 0x3

    if-eq p0, v1, :cond_28

    const/4 v1, 0x4

    if-eq p0, v0, :cond_27

    const/4 v0, 0x5

    if-eq p0, v1, :cond_28

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_19

    if-ne p0, v0, :cond_19

    const/4 p0, 0x6

    return p0

    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Could not convert "

    const-string v2, " to NetworkType"

    invoke-static {v1, p0, v2}, LA/e;->h(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    move v0, v1

    :cond_28
    return v0
.end method

.method public static final G(I)I
    .registers 4

    const/4 v0, 0x1

    if-eqz p0, :cond_15

    if-ne p0, v0, :cond_7

    const/4 v0, 0x2

    goto :goto_15

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Could not convert "

    const-string v2, " to OutOfQuotaPolicy"

    invoke-static {v1, p0, v2}, LA/e;->h(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    :goto_15
    return v0
.end method

.method public static final H(I)I
    .registers 4

    const/4 v0, 0x1

    if-eqz p0, :cond_22

    const/4 v1, 0x2

    if-eq p0, v0, :cond_21

    const/4 v0, 0x3

    if-eq p0, v1, :cond_22

    const/4 v1, 0x4

    if-eq p0, v0, :cond_21

    const/4 v0, 0x5

    if-eq p0, v1, :cond_22

    if-ne p0, v0, :cond_13

    const/4 v0, 0x6

    goto :goto_22

    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Could not convert "

    const-string v2, " to State"

    invoke-static {v1, p0, v2}, LA/e;->h(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_21
    move v0, v1

    :cond_22
    :goto_22
    return v0
.end method

.method public static I(Lh2/c;)Lh2/c;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, Lj2/c;

    if-eqz v0, :cond_d

    move-object v0, p0

    check-cast v0, Lj2/c;

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lj2/c;->intercepted()Lh2/c;

    move-result-object v0

    if-nez v0, :cond_17

    goto :goto_18

    :cond_17
    move-object p0, v0

    :cond_18
    :goto_18
    return-object p0
.end method

.method public static J(Ljava/lang/Integer;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_f

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/4 v0, 0x5

    if-gt p0, v0, :cond_f

    const/4 p0, 0x1

    goto :goto_10

    :cond_f
    const/4 p0, 0x0

    :goto_10
    return p0
.end method

.method public static K(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 6

    const/16 v0, 0x11

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p0, v0, :cond_50

    const/16 v0, 0x21

    if-eq p0, v0, :cond_3e

    const/16 v0, 0x42

    if-eq p0, v0, :cond_2c

    const/16 v0, 0x82

    if-ne p0, v0, :cond_24

    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget v0, p2, Landroid/graphics/Rect;->top:I

    if-lt p0, v0, :cond_1c

    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    if-gt p0, v0, :cond_23

    :cond_1c
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    if-ge p0, p1, :cond_23

    move v1, v2

    :cond_23
    return v1

    :cond_24
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2c
    iget p0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p2, Landroid/graphics/Rect;->left:I

    if-lt p0, v0, :cond_36

    iget p0, p1, Landroid/graphics/Rect;->right:I

    if-gt p0, v0, :cond_3d

    :cond_36
    iget p0, p1, Landroid/graphics/Rect;->right:I

    iget p1, p2, Landroid/graphics/Rect;->right:I

    if-ge p0, p1, :cond_3d

    move v1, v2

    :cond_3d
    return v1

    :cond_3e
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    if-gt p0, v0, :cond_48

    iget p0, p1, Landroid/graphics/Rect;->top:I

    if-lt p0, v0, :cond_4f

    :cond_48
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget p1, p2, Landroid/graphics/Rect;->top:I

    if-le p0, p1, :cond_4f

    move v1, v2

    :cond_4f
    return v1

    :cond_50
    iget p0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p2, Landroid/graphics/Rect;->right:I

    if-gt p0, v0, :cond_5a

    iget p0, p1, Landroid/graphics/Rect;->left:I

    if-lt p0, v0, :cond_61

    :cond_5a
    iget p0, p1, Landroid/graphics/Rect;->left:I

    iget p1, p2, Landroid/graphics/Rect;->left:I

    if-le p0, p1, :cond_61

    move v1, v2

    :cond_61
    return v1
.end method

.method public static L(Landroid/widget/EditText;)Z
    .registers 1

    invoke-virtual {p0}, Landroid/widget/TextView;->getInputType()I

    move-result p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    return p0
.end method

.method public static M()Z
    .registers 5

    :try_start_0
    sget-object v0, LM2/l;->d:Ljava/lang/reflect/Method;

    if-nez v0, :cond_9

    invoke-static {}, LD/b;->p()Z

    move-result v0
    :try_end_8
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_8} :catch_9

    return v0

    :catch_9
    :cond_9
    const-class v0, Landroid/os/Trace;

    :try_start_b
    sget-object v1, LM2/l;->d:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    if-nez v1, :cond_2d

    const-string v1, "TRACE_TAG_APP"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v3

    sput-wide v3, LM2/l;->b:J

    const-string v1, "isTagEnabled"

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, LM2/l;->d:Ljava/lang/reflect/Method;

    goto :goto_2d

    :catch_2b
    move-exception v0

    goto :goto_44

    :cond_2d
    :goto_2d
    sget-object v0, LM2/l;->d:Ljava/lang/reflect/Method;

    sget-wide v3, LM2/l;->b:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_43} :catch_2b

    goto :goto_5a

    :goto_44
    instance-of v1, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_59

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_53

    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    :cond_53
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_59
    const/4 v0, 0x0

    :goto_5a
    return v0
.end method

.method public static N(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I
    .registers 4

    const/16 v0, 0x11

    if-eq p0, v0, :cond_28

    const/16 v0, 0x21

    if-eq p0, v0, :cond_23

    const/16 v0, 0x42

    if-eq p0, v0, :cond_1e

    const/16 v0, 0x82

    if-ne p0, v0, :cond_16

    iget p0, p2, Landroid/graphics/Rect;->top:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    :goto_14
    sub-int/2addr p0, p1

    goto :goto_2d

    :cond_16
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1e
    iget p0, p2, Landroid/graphics/Rect;->left:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    goto :goto_14

    :cond_23
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    goto :goto_14

    :cond_28
    iget p0, p1, Landroid/graphics/Rect;->left:I

    iget p1, p2, Landroid/graphics/Rect;->right:I

    goto :goto_14

    :goto_2d
    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static O(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I
    .registers 4

    const/16 v0, 0x11

    if-eq p0, v0, :cond_31

    const/16 v0, 0x21

    if-eq p0, v0, :cond_19

    const/16 v0, 0x42

    if-eq p0, v0, :cond_31

    const/16 v0, 0x82

    if-ne p0, v0, :cond_11

    goto :goto_19

    :cond_11
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_19
    :goto_19
    iget p0, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr p1, p0

    iget p0, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p2, p0

    sub-int/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p0

    return p0

    :cond_31
    iget p0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr p1, p0

    iget p0, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p2, p0

    sub-int/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p0

    return p0
.end method

.method public static final P(I)I
    .registers 4

    const-string v0, "networkType"

    invoke-static {p0, v0}, LA/e;->p(ILjava/lang/String;)V

    invoke-static {p0}, Lq/e;->a(I)I

    move-result v0

    if-eqz v0, :cond_52

    const/4 v1, 0x1

    if-eq v0, v1, :cond_53

    const/4 v1, 0x2

    if-eq v0, v1, :cond_53

    const/4 v1, 0x3

    if-eq v0, v1, :cond_53

    const/4 v1, 0x4

    if-eq v0, v1, :cond_53

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_22

    const/4 v0, 0x6

    if-ne p0, v0, :cond_22

    const/4 v1, 0x5

    goto :goto_53

    :cond_22
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not convert "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    packed-switch p0, :pswitch_data_54

    const-string p0, "null"

    goto :goto_42

    :pswitch_31
    const-string p0, "TEMPORARILY_UNMETERED"

    goto :goto_42

    :pswitch_34
    const-string p0, "METERED"

    goto :goto_42

    :pswitch_37
    const-string p0, "NOT_ROAMING"

    goto :goto_42

    :pswitch_3a
    const-string p0, "UNMETERED"

    goto :goto_42

    :pswitch_3d
    const-string p0, "CONNECTED"

    goto :goto_42

    :pswitch_40
    const-string p0, "NOT_REQUIRED"

    :goto_42
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " to int"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_52
    const/4 v1, 0x0

    :cond_53
    :goto_53
    return v1

    :pswitch_data_54
    .packed-switch 0x1
        :pswitch_40
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_34
        :pswitch_31
    .end packed-switch
.end method

.method public static U([B)LB1/s;
    .registers 10

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eqz p0, :cond_f4

    array-length v2, p0

    if-nez v2, :cond_9

    goto/16 :goto_f4

    :cond_9
    :try_start_9
    invoke-static {p0}, Landroid/support/v4/media/session/a;->d([B)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_f} :catch_8d

    :try_start_f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    array-length v5, p0

    move v6, v1

    :goto_16
    if-ge v6, v5, :cond_35

    aget-byte v7, p0, v6

    const/16 v8, 0x9

    if-eq v7, v8, :cond_2e

    const/16 v8, 0xa

    if-eq v7, v8, :cond_2e

    const/16 v8, 0xd

    if-eq v7, v8, :cond_2e

    const/16 v8, 0x20

    if-lt v7, v8, :cond_32

    const/16 v8, 0x7e

    if-gt v7, v8, :cond_32

    :cond_2e
    int-to-char v7, v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_32
    add-int/lit8 v6, v6, 0x1

    goto :goto_16

    :cond_35
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_39} :catch_39

    :catch_39
    const/4 v4, 0x1

    :try_start_3a
    array-length v5, p0

    const/4 v6, 0x5

    if-ne v5, v4, :cond_4d

    aget-byte p0, p0, v1

    and-int/lit16 p0, p0, 0xff

    if-lt p0, v4, :cond_4d

    if-gt p0, v6, :cond_4d

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_4a} :catch_4b

    goto :goto_4e

    :catch_4b
    move-object p0, v0

    goto :goto_77

    :cond_4d
    move-object p0, v0

    :goto_4e
    if-nez p0, :cond_77

    if-eqz v3, :cond_77

    :try_start_52
    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    const-string v7, "(?:BAT|BATT|BATTERY|PWR|POWER)\\D*([1-5])"

    const/4 v8, 0x2

    invoke-static {v7, v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_77

    invoke-virtual {v5, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    if-lt v5, v4, :cond_77

    if-gt v5, v6, :cond_77

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_77} :catch_77

    :catch_77
    :cond_77
    :goto_77
    const-string v5, "OK"

    const-string v6, "ERROR"

    if-eqz v3, :cond_ab

    :try_start_7d
    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_8f

    new-instance v2, LB1/s;

    invoke-direct {v2, v4, p0, v5}, LB1/s;-><init>(ZLjava/lang/Integer;Ljava/lang/String;)V

    return-object v2

    :catch_8d
    move-exception p0

    goto :goto_d5

    :cond_8f
    invoke-virtual {v3, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_93} :catch_8d

    const-string v8, "FAIL"

    if-nez v7, :cond_9d

    :try_start_97
    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_ab

    :cond_9d
    new-instance v2, LB1/s;

    invoke-virtual {v3, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_a6

    goto :goto_a7

    :cond_a6
    move-object v6, v8

    :goto_a7
    invoke-direct {v2, v1, p0, v6}, LB1/s;-><init>(ZLjava/lang/Integer;Ljava/lang/String;)V

    return-object v2

    :cond_ab
    if-eqz v2, :cond_cd

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "4F4B"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_bf

    new-instance v2, LB1/s;

    invoke-direct {v2, v4, p0, v5}, LB1/s;-><init>(ZLjava/lang/Integer;Ljava/lang/String;)V

    return-object v2

    :cond_bf
    const-string v3, "4552524F52"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_cd

    new-instance v2, LB1/s;

    invoke-direct {v2, v1, p0, v6}, LB1/s;-><init>(ZLjava/lang/Integer;Ljava/lang/String;)V

    return-object v2

    :cond_cd
    new-instance v2, LB1/s;

    const-string v3, "\u672a\u77e5\u54cd\u5e94"

    invoke-direct {v2, v1, p0, v3}, LB1/s;-><init>(ZLjava/lang/Integer;Ljava/lang/String;)V
    :try_end_d4
    .catch Ljava/lang/Exception; {:try_start_97 .. :try_end_d4} :catch_8d

    return-object v2

    :goto_d5
    const-string v2, "DeviceResponseParser"

    const-string v3, "\u89e3\u6790\u8bbe\u5907\u54cd\u5e94\u5931\u8d25"

    invoke-static {v2, v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v2, LB1/s;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u89e3\u6790\u5931\u8d25: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, v1, v0, p0}, LB1/s;-><init>(ZLjava/lang/Integer;Ljava/lang/String;)V

    return-object v2

    :cond_f4
    :goto_f4
    new-instance p0, LB1/s;

    const-string v2, "\u7a7a\u54cd\u5e94"

    invoke-direct {p0, v1, v0, v2}, LB1/s;-><init>(ZLjava/lang/Integer;Ljava/lang/String;)V

    return-object p0
.end method

.method public static V([B)Ljava/lang/Integer;
    .registers 13

    const/4 v0, 0x0

    if-eqz p0, :cond_86

    array-length v1, p0

    if-nez v1, :cond_8

    goto/16 :goto_86

    :cond_8
    const/4 v1, 0x0

    move v2, v1

    :goto_a
    :try_start_a
    array-length v3, p0

    const/4 v4, 0x2

    sub-int/2addr v3, v4

    const/4 v5, 0x5

    const/16 v6, 0xff

    const/4 v7, 0x1

    if-ge v2, v3, :cond_71

    aget-byte v3, p0, v2

    and-int/2addr v3, v6

    if-nez v3, :cond_19

    goto :goto_71

    :cond_19
    add-int/lit8 v8, v2, 0x1

    aget-byte v8, p0, v8

    and-int/2addr v8, v6

    if-ne v8, v6, :cond_6d

    add-int/lit8 v8, v2, 0x4

    array-length v9, p0

    if-ge v8, v9, :cond_6d

    add-int/lit8 v8, v2, 0x2

    add-int/lit8 v9, v3, -0x1

    add-int v10, v8, v9

    array-length v11, p0

    if-gt v10, v11, :cond_6d

    if-lez v9, :cond_6d

    invoke-static {p0, v8, v10}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v8

    invoke-static {v8}, Landroid/support/v4/media/session/a;->d([B)Ljava/lang/String;

    array-length v9, v8

    if-lt v9, v4, :cond_46

    aget-byte v4, v8, v7

    and-int/2addr v4, v6

    shl-int/lit8 v4, v4, 0x8

    aget-byte v8, v8, v1

    and-int/2addr v8, v6

    or-int/2addr v4, v8

    goto :goto_47

    :catch_44
    move-exception p0

    goto :goto_7f

    :cond_46
    move v4, v1

    :goto_47
    add-int/lit8 v10, v10, -0x1

    aget-byte v8, p0, v10
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_4b} :catch_44

    and-int/2addr v6, v8

    const-string v8, "%04X"

    if-lt v6, v7, :cond_62

    if-gt v6, v5, :cond_62

    :try_start_52
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v8, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_62
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v8, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :cond_6d
    add-int/lit8 v3, v3, 0x1

    add-int/2addr v2, v3

    goto :goto_a

    :cond_71
    :goto_71
    array-length v1, p0

    sub-int/2addr v1, v7

    aget-byte p0, p0, v1

    and-int/2addr p0, v6

    if-lt p0, v7, :cond_86

    if-gt p0, v5, :cond_86

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_7e} :catch_44

    return-object p0

    :goto_7f
    const-string v1, "BatteryUtils"

    const-string v2, "\u89e3\u6790\u7535\u91cf\u4fe1\u606f\u5931\u8d25"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_86
    :goto_86
    return-object v0
.end method

.method public static W(ILjava/lang/String;)J
    .registers 16

    const/4 v0, 0x0

    invoke-static {p1, v0, p0, v0}, LM2/l;->t(Ljava/lang/String;IIZ)I

    move-result v1

    sget-object v2, LE2/k;->m:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const/4 v3, -0x1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    move v8, v7

    move v9, v8

    :goto_12
    const/4 v10, 0x1

    const/4 v11, 0x2

    if-ge v1, p0, :cond_c7

    add-int/lit8 v12, v1, 0x1

    invoke-static {p1, v12, p0, v10}, LM2/l;->t(Ljava/lang/String;IIZ)I

    move-result v12

    invoke-virtual {v2, v1, v12}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    const-string v1, "matcher.group(1)"

    if-ne v5, v3, :cond_56

    sget-object v13, LE2/k;->m:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v13}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-eqz v13, :cond_56

    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v8, "matcher.group(2)"

    invoke-static {v1, v8}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const/4 v1, 0x3

    invoke-virtual {v2, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v9, "matcher.group(3)"

    invoke-static {v1, v9}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    goto :goto_bf

    :cond_56
    if-ne v6, v3, :cond_70

    sget-object v11, LE2/k;->l:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v11}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v11

    if-eqz v11, :cond_70

    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v1}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    goto :goto_bf

    :cond_70
    if-ne v7, v3, :cond_a6

    sget-object v11, LE2/k;->k:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v11}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-eqz v13, :cond_a6

    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v1}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "US"

    invoke-static {v1, v10}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v7, "this as java.lang.String).toLowerCase(locale)"

    invoke-static {v1, v7}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v7

    const-string v10, "MONTH_PATTERN.pattern()"

    invoke-static {v7, v10}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v10, 0x6

    invoke-static {v7, v1, v0, v0, v10}, Lx2/e;->n0(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result v1

    div-int/lit8 v7, v1, 0x4

    goto :goto_bf

    :cond_a6
    if-ne v4, v3, :cond_bf

    sget-object v11, LE2/k;->j:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v11}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v11

    if-eqz v11, :cond_bf

    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :cond_bf
    :goto_bf
    add-int/lit8 v12, v12, 0x1

    invoke-static {p1, v12, p0, v0}, LM2/l;->t(Ljava/lang/String;IIZ)I

    move-result v1

    goto/16 :goto_12

    :cond_c7
    const/16 p0, 0x46

    if-gt p0, v4, :cond_d1

    const/16 p1, 0x64

    if-ge v4, p1, :cond_d1

    add-int/lit16 v4, v4, 0x76c

    :cond_d1
    if-ltz v4, :cond_d7

    if-ge v4, p0, :cond_d7

    add-int/lit16 v4, v4, 0x7d0

    :cond_d7
    const/16 p0, 0x641

    const-string p1, "Failed requirement."

    if-lt v4, p0, :cond_141

    if-eq v7, v3, :cond_13b

    if-gt v10, v6, :cond_135

    const/16 p0, 0x20

    if-ge v6, p0, :cond_135

    if-ltz v5, :cond_12f

    const/16 p0, 0x18

    if-ge v5, p0, :cond_12f

    if-ltz v8, :cond_129

    const/16 p0, 0x3c

    if-ge v8, p0, :cond_129

    if-ltz v9, :cond_123

    if-ge v9, p0, :cond_123

    new-instance p0, Ljava/util/GregorianCalendar;

    sget-object p1, LF2/b;->f:Ljava/util/TimeZone;

    invoke-direct {p0, p1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->setLenient(Z)V

    invoke-virtual {p0, v10, v4}, Ljava/util/Calendar;->set(II)V

    sub-int/2addr v7, v10

    invoke-virtual {p0, v11, v7}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x5

    invoke-virtual {p0, p1, v6}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xb

    invoke-virtual {p0, p1, v5}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xc

    invoke-virtual {p0, p1, v8}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xd

    invoke-virtual {p0, p1, v9}, Ljava/util/Calendar;->set(II)V

    const/16 p1, 0xe

    invoke-virtual {p0, p1, v0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0

    :cond_123
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_129
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_12f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_135
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_13b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_141
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static X(Landroid/content/Context;Ljava/lang/String;)V
    .registers 9

    const-string v0, "AppLocalesStorageHelper"

    const-string v1, "locales"

    const-string v2, "Storing App Locales : Failed to persist app-locales: "

    const-string v3, ""

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "androidx.appcompat.app.AppCompatDelegate.application_locales_record_file"

    if-eqz v3, :cond_14

    invoke-virtual {p0, v4}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    return-void

    :cond_14
    const/4 v3, 0x0

    :try_start_15
    invoke-virtual {p0, v4, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object p0
    :try_end_19
    .catch Ljava/io/FileNotFoundException; {:try_start_15 .. :try_end_19} :catch_50

    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v3

    const/4 v4, 0x0

    :try_start_1e
    invoke-interface {v3, p0, v4}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    const-string v5, "UTF-8"

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v3, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    invoke-interface {v3, v4, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string v5, "application_locales"

    invoke-interface {v3, v4, v5, p1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v3, v4, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_36} :catch_3e
    .catchall {:try_start_1e .. :try_end_36} :catchall_3c

    if-eqz p0, :cond_49

    :goto_38
    :try_start_38
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_3b} :catch_49

    goto :goto_49

    :catchall_3c
    move-exception p1

    goto :goto_4a

    :catch_3e
    move-exception v1

    :try_start_3f
    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_46
    .catchall {:try_start_3f .. :try_end_46} :catchall_3c

    if-eqz p0, :cond_49

    goto :goto_38

    :catch_49
    :cond_49
    :goto_49
    return-void

    :goto_4a
    if-eqz p0, :cond_4f

    :try_start_4c
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_4f} :catch_4f

    :catch_4f
    :cond_4f
    throw p1

    :catch_50
    const-string p0, "Storing App Locales : FileNotFoundException: Cannot open file androidx.appcompat.app.AppCompatDelegate.application_locales_record_file for writing "

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static Y(Ljava/lang/String;IILjava/lang/String;)LK1/e;
    .registers 5

    invoke-static {p1}, Lq/e;->a(I)I

    move-result p1

    if-eqz p1, :cond_71

    const/4 p2, 0x1

    if-eq p1, p2, :cond_64

    const/4 p2, 0x2

    if-eq p1, p2, :cond_47

    const/4 p2, 0x3

    const-string v0, "\u91cd\u542f\u5e94\u7528\u6216\u8054\u7cfb\u6280\u672f\u652f\u6301"

    if-eq p1, p2, :cond_30

    const/4 p2, 0x4

    if-eq p1, p2, :cond_19

    invoke-static {p0, p3}, LM2/l;->D(Ljava/lang/String;Ljava/lang/String;)LK1/e;

    move-result-object p0

    return-object p0

    :cond_19
    if-eqz p0, :cond_28

    const-string p1, "\u521d\u59cb\u5316"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_28

    const-string p0, "\u754c\u9762\u7ec4\u4ef6\u521d\u59cb\u5316\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    const-string v0, "\u91cd\u65b0\u6253\u5f00\u9875\u9762\u6216\u91cd\u542f\u5e94\u7528"

    goto :goto_2a

    :cond_28
    const-string p0, "\u754c\u9762\u521d\u59cb\u5316\u5931\u8d25\uff0c\u8bf7\u91cd\u542f\u5e94\u7528"

    :goto_2a
    new-instance p1, LK1/e;

    invoke-direct {p1, p0, v0}, LK1/e;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_30
    if-eqz p0, :cond_3f

    const-string p1, "\u5185\u5b58"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3f

    const-string p0, "\u5185\u5b58\u4e0d\u8db3\uff0c\u8bf7\u5173\u95ed\u5176\u4ed6\u5e94\u7528\u540e\u91cd\u8bd5"

    const-string v0, "\u6e05\u7406\u5185\u5b58\u540e\u91cd\u65b0\u5c1d\u8bd5"

    goto :goto_41

    :cond_3f
    const-string p0, "\u7cfb\u7edf\u5f02\u5e38\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    :goto_41
    new-instance p1, LK1/e;

    invoke-direct {p1, p0, v0}, LK1/e;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_47
    if-eqz p0, :cond_4b

    move-object p1, p0

    goto :goto_4d

    :cond_4b
    const-string p1, "\u767b\u5f55\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u624b\u673a\u53f7\u548c\u9a8c\u8bc1\u7801"

    :goto_4d
    if-eqz p0, :cond_5c

    const-string p2, "\u8fc7\u671f"

    invoke-virtual {p0, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_5c

    const-string p1, "\u9a8c\u8bc1\u7801\u5df2\u8fc7\u671f\uff0c\u8bf7\u91cd\u65b0\u83b7\u53d6"

    const-string p0, "\u70b9\u51fb\u91cd\u65b0\u53d1\u9001\u9a8c\u8bc1\u7801"

    goto :goto_5e

    :cond_5c
    const-string p0, "\u8bf7\u91cd\u65b0\u83b7\u53d6\u9a8c\u8bc1\u7801\u6216\u68c0\u67e5\u8f93\u5165\u4fe1\u606f"

    :goto_5e
    new-instance p2, LK1/e;

    invoke-direct {p2, p1, p0}, LK1/e;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    :cond_64
    if-eqz p0, :cond_67

    goto :goto_69

    :cond_67
    const-string p0, "\u8f93\u5165\u4fe1\u606f\u6709\u8bef\uff0c\u8bf7\u68c0\u67e5\u540e\u91cd\u8bd5"

    :goto_69
    new-instance p1, LK1/e;

    const-string p2, "\u8bf7\u68c0\u67e5\u8f93\u5165\u4fe1\u606f\u7684\u683c\u5f0f\u548c\u5b8c\u6574\u6027"

    invoke-direct {p1, p0, p2}, LK1/e;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_71
    if-eqz p0, :cond_80

    const-string p1, "\u8d85\u65f6"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_80

    const-string p0, "\u7f51\u7edc\u8bf7\u6c42\u8d85\u65f6\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    const-string p1, "\u7b49\u5f85\u7247\u523b\u540e\u91cd\u8bd5"

    goto :goto_84

    :cond_80
    const-string p0, "\u7f51\u7edc\u8fde\u63a5\u5f02\u5e38\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8bbe\u7f6e"

    const-string p1, "\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u540e\u91cd\u8bd5"

    :goto_84
    new-instance p2, LK1/e;

    invoke-direct {p2, p0, p1}, LK1/e;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2
.end method

.method public static final Z(Landroid/database/Cursor;)Ljava/util/List;
    .registers 12

    const-string v0, "id"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    const-string v1, "seq"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    const-string v2, "from"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    const-string v3, "to"

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    new-instance v4, Lf2/c;

    const/16 v5, 0xa

    invoke-direct {v4, v5}, Lf2/c;-><init>(I)V

    :goto_1f
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_48

    new-instance v5, Lg0/c;

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "cursor.getString(fromColumnIndex)"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v10, "cursor.getString(toColumnIndex)"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v5, v8, v6, v7, v9}, Lg0/c;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    invoke-virtual {v4, v5}, Lf2/c;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_48
    invoke-static {v4}, LM2/d;->e(Lf2/c;)Lf2/c;

    move-result-object p0

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lf2/c;->a()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_5d

    invoke-static {p0}, Le2/k;->h0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    goto :goto_76

    :cond_5d
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Comparable;

    invoke-virtual {p0, v0}, Lf2/c;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, [Ljava/lang/Comparable;

    array-length v2, v0

    if-le v2, v1, :cond_6d

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    :cond_6d
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const-string v0, "asList(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_76
    return-object p0
.end method

.method public static final a0(Li0/a;Ljava/lang/String;Z)Lg0/d;
    .registers 15

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PRAGMA index_xinfo(`"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "`)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Li0/a;->z(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    :try_start_17
    const-string v0, "seqno"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    const-string v1, "cid"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    const-string v2, "name"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    const-string v3, "desc"

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, -0x1

    if-eq v0, v5, :cond_9d

    if-eq v1, v5, :cond_9d

    if-eq v2, v5, :cond_9d

    if-ne v3, v5, :cond_3a

    goto :goto_9d

    :cond_3a
    new-instance v5, Ljava/util/TreeMap;

    invoke-direct {v5}, Ljava/util/TreeMap;-><init>()V

    new-instance v6, Ljava/util/TreeMap;

    invoke-direct {v6}, Ljava/util/TreeMap;-><init>()V

    :goto_44
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_7a

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    if-gez v7, :cond_51

    goto :goto_44

    :cond_51
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    if-lez v9, :cond_64

    const-string v9, "DESC"

    goto :goto_66

    :catchall_62
    move-exception p1

    goto :goto_a1

    :cond_64
    const-string v9, "ASC"

    :goto_66
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v11, "columnName"

    invoke-static {v8, v11}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5, v10, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7, v9}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_44

    :cond_7a
    invoke-virtual {v5}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v0

    const-string v1, "columnsMap.values"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, Le2/k;->h0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v6}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v1

    const-string v2, "ordersMap.values"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Le2/k;->h0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    new-instance v2, Lg0/d;

    invoke-direct {v2, p1, p2, v0, v1}, Lg0/d;-><init>(Ljava/lang/String;ZLjava/util/List;Ljava/util/List;)V
    :try_end_99
    .catchall {:try_start_17 .. :try_end_99} :catchall_62

    invoke-static {p0, v4}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v2

    :cond_9d
    :goto_9d
    invoke-static {p0, v4}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v4

    :goto_a1
    :try_start_a1
    throw p1
    :try_end_a2
    .catchall {:try_start_a1 .. :try_end_a2} :catchall_a2

    :catchall_a2
    move-exception p2

    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static b0(Landroid/content/Context;)Ljava/lang/String;
    .registers 10

    const-string v0, "AppLocalesStorageHelper"

    const-string v1, "androidx.appcompat.app.AppCompatDelegate.application_locales_record_file"

    const-string v2, ""

    :try_start_6
    invoke-virtual {p0, v1}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v3
    :try_end_a
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_a} :catch_62

    :try_start_a
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-interface {v4, v3, v5}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v5

    :cond_17
    :goto_17
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    const/4 v7, 0x1

    if-eq v6, v7, :cond_43

    const/4 v7, 0x3

    if-ne v6, v7, :cond_2a

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v8

    if-le v8, v5, :cond_43

    goto :goto_2a

    :catchall_28
    move-exception p0

    goto :goto_5c

    :cond_2a
    :goto_2a
    if-eq v6, v7, :cond_17

    const/4 v7, 0x4

    if-ne v6, v7, :cond_30

    goto :goto_17

    :cond_30
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "locales"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_17

    const-string v5, "application_locales"

    const/4 v6, 0x0

    invoke-interface {v4, v6, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_43
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_a .. :try_end_43} :catch_49
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_43} :catch_49
    .catchall {:try_start_a .. :try_end_43} :catchall_28

    :cond_43
    if-eqz v3, :cond_51

    :goto_45
    :try_start_45
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_51

    goto :goto_51

    :catch_49
    :try_start_49
    const-string v4, "Reading app Locales : Unable to parse through file :androidx.appcompat.app.AppCompatDelegate.application_locales_record_file"

    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4e
    .catchall {:try_start_49 .. :try_end_4e} :catchall_28

    if-eqz v3, :cond_51

    goto :goto_45

    :catch_51
    :cond_51
    :goto_51
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_58

    goto :goto_5b

    :cond_58
    invoke-virtual {p0, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    :goto_5b
    return-object v2

    :goto_5c
    if-eqz v3, :cond_61

    :try_start_5e
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_61} :catch_61

    :catch_61
    :cond_61
    throw p0

    :catch_62
    const-string p0, "Reading app Locales : Locales record file not found: androidx.appcompat.app.AppCompatDelegate.application_locales_record_file"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2
.end method

.method public static final c(LH2/a;LH2/c;Ljava/lang/String;)V
    .registers 5

    sget-object v0, LH2/d;->i:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p1, p1, LH2/c;->b:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x20

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 p1, 0x1

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    const-string p2, "%-22s"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, LH2/a;->a:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    return-void
.end method

.method public static final c0(Ljava/util/Set;)[B
    .registers 5

    const-string v0, "triggers"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 p0, 0x0

    new-array p0, p0, [B

    return-object p0

    :cond_f
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_14
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_19
    .catchall {:try_start_14 .. :try_end_19} :catchall_52

    :try_start_19
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_24
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_41

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt0/c;

    iget-object v3, v2, Lt0/c;->a:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-boolean v2, v2, Lt0/c;->b:Z

    invoke-virtual {v1, v2}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V
    :try_end_3e
    .catchall {:try_start_19 .. :try_end_3e} :catchall_3f

    goto :goto_24

    :catchall_3f
    move-exception p0

    goto :goto_54

    :cond_41
    const/4 p0, 0x0

    :try_start_42
    invoke-static {v1, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_52

    invoke-static {v0, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    const-string v0, "outputStream.toByteArray()"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    :catchall_52
    move-exception p0

    goto :goto_5a

    :goto_54
    :try_start_54
    throw p0
    :try_end_55
    .catchall {:try_start_54 .. :try_end_55} :catchall_55

    :catchall_55
    move-exception v2

    :try_start_56
    invoke-static {v1, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v2
    :try_end_5a
    .catchall {:try_start_56 .. :try_end_5a} :catchall_52

    :goto_5a
    :try_start_5a
    throw p0
    :try_end_5b
    .catchall {:try_start_5a .. :try_end_5b} :catchall_5b

    :catchall_5b
    move-exception v1

    invoke-static {v0, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static d0(Landroid/graphics/drawable/Drawable;I)V
    .registers 2

    invoke-static {p0, p1}, LE/b;->g(Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method

.method public static final e0(I)I
    .registers 2

    const-string v0, "state"

    invoke-static {p0, v0}, LA/e;->p(ILjava/lang/String;)V

    invoke-static {p0}, Lq/e;->a(I)I

    move-result p0

    if-eqz p0, :cond_21

    const/4 v0, 0x1

    if-eq p0, v0, :cond_22

    const/4 v0, 0x2

    if-eq p0, v0, :cond_22

    const/4 v0, 0x3

    if-eq p0, v0, :cond_22

    const/4 v0, 0x4

    if-eq p0, v0, :cond_22

    const/4 v0, 0x5

    if-ne p0, v0, :cond_1b

    goto :goto_22

    :cond_1b
    new-instance p0, Landroidx/fragment/app/o;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :cond_21
    const/4 v0, 0x0

    :cond_22
    :goto_22
    return v0
.end method

.method public static final f(III[B[B)Z
    .registers 9

    const-string v0, "a"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "b"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    move v1, v0

    :goto_c
    if-ge v1, p2, :cond_1c

    add-int v2, v1, p0

    aget-byte v2, p3, v2

    add-int v3, v1, p1

    aget-byte v3, p4, v3

    if-eq v2, v3, :cond_19

    return v0

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_1c
    const/4 p0, 0x1

    return p0
.end method

.method public static f0(Lu2/c;I)Lu2/a;
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    if-lez p1, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v0, :cond_20

    iget v0, p0, Lu2/a;->e:I

    if-lez v0, :cond_15

    goto :goto_16

    :cond_15
    neg-int p1, p1

    :goto_16
    new-instance v0, Lu2/a;

    iget v1, p0, Lu2/a;->b:I

    iget p0, p0, Lu2/a;->d:I

    invoke-direct {v0, v1, p0, p1}, Lu2/a;-><init>(III)V

    return-object v0

    :cond_20
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Step must be positive, was: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static g(Ljava/lang/Integer;)Ljava/lang/String;
    .registers 3

    const-string v0, "\u7535\u91cf\u672a\u77e5"

    if-nez p0, :cond_5

    return-object v0

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/4 v1, 0x1

    if-eq p0, v1, :cond_25

    const/4 v1, 0x2

    if-eq p0, v1, :cond_22

    const/4 v1, 0x3

    if-eq p0, v1, :cond_1f

    const/4 v1, 0x4

    if-eq p0, v1, :cond_1c

    const/4 v1, 0x5

    if-eq p0, v1, :cond_19

    return-object v0

    :cond_19
    const-string p0, "\u7535\u91cf\u7ea6100%"

    return-object p0

    :cond_1c
    const-string p0, "\u7535\u91cf\u7ea675%"

    return-object p0

    :cond_1f
    const-string p0, "\u7535\u91cf\u7ea650%"

    return-object p0

    :cond_22
    const-string p0, "\u7535\u91cf\u7ea625%"

    return-object p0

    :cond_25
    const-string p0, "\u7535\u91cf\u4f4e\uff0c\u8bf7\u53ca\u65f6\u5145\u7535"

    return-object p0
.end method

.method public static g0(Landroid/view/ViewGroup;Z)V
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_a

    invoke-static {p0, p1}, LD/b;->l(Landroid/view/ViewGroup;Z)V

    goto :goto_15

    :cond_a
    sget-boolean v0, LM2/l;->e:Z

    if-eqz v0, :cond_15

    :try_start_e
    invoke-static {p0, p1}, LD/b;->l(Landroid/view/ViewGroup;Z)V
    :try_end_11
    .catch Ljava/lang/NoSuchMethodError; {:try_start_e .. :try_end_11} :catch_12

    goto :goto_15

    :catch_12
    const/4 p0, 0x0

    sput-boolean p0, LM2/l;->e:Z

    :cond_15
    :goto_15
    return-void
.end method

.method public static h(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 13

    invoke-static {p0, p1, p2}, LM2/l;->i(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0

    invoke-static {p0, p1, p3}, LM2/l;->i(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_78

    if-nez v0, :cond_f

    goto/16 :goto_78

    :cond_f
    const-string v0, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    const/16 v1, 0x82

    const/16 v3, 0x21

    const/16 v4, 0x42

    const/16 v5, 0x11

    const/4 v6, 0x1

    if-eq p0, v5, :cond_3d

    if-eq p0, v3, :cond_36

    if-eq p0, v4, :cond_2f

    if-ne p0, v1, :cond_29

    iget v7, p1, Landroid/graphics/Rect;->bottom:I

    iget v8, p3, Landroid/graphics/Rect;->top:I

    if-gt v7, v8, :cond_77

    goto :goto_43

    :cond_29
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2f
    iget v7, p1, Landroid/graphics/Rect;->right:I

    iget v8, p3, Landroid/graphics/Rect;->left:I

    if-gt v7, v8, :cond_77

    goto :goto_43

    :cond_36
    iget v7, p1, Landroid/graphics/Rect;->top:I

    iget v8, p3, Landroid/graphics/Rect;->bottom:I

    if-lt v7, v8, :cond_77

    goto :goto_43

    :cond_3d
    iget v7, p1, Landroid/graphics/Rect;->left:I

    iget v8, p3, Landroid/graphics/Rect;->right:I

    if-lt v7, v8, :cond_77

    :goto_43
    if-eq p0, v5, :cond_77

    if-ne p0, v4, :cond_48

    goto :goto_77

    :cond_48
    invoke-static {p0, p1, p2}, LM2/l;->N(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result p2

    if-eq p0, v5, :cond_6a

    if-eq p0, v3, :cond_65

    if-eq p0, v4, :cond_60

    if-ne p0, v1, :cond_5a

    iget p0, p3, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    :goto_58
    sub-int/2addr p0, p1

    goto :goto_6f

    :cond_5a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_60
    iget p0, p3, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    goto :goto_58

    :cond_65
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget p1, p3, Landroid/graphics/Rect;->top:I

    goto :goto_58

    :cond_6a
    iget p0, p1, Landroid/graphics/Rect;->left:I

    iget p1, p3, Landroid/graphics/Rect;->left:I

    goto :goto_58

    :goto_6f
    invoke-static {v6, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    if-ge p2, p0, :cond_76

    move v2, v6

    :cond_76
    return v2

    :cond_77
    :goto_77
    return v6

    :cond_78
    :goto_78
    return v2
.end method

.method public static h0(II)Lu2/c;
    .registers 4

    const/high16 v0, -0x80000000

    if-gt p1, v0, :cond_9

    sget-object p0, Lu2/c;->f:Lu2/c;

    sget-object p0, Lu2/c;->f:Lu2/c;

    return-object p0

    :cond_9
    new-instance v0, Lu2/c;

    const/4 v1, 0x1

    sub-int/2addr p1, v1

    invoke-direct {v0, p0, p1, v1}, Lu2/a;-><init>(III)V

    return-object v0
.end method

.method public static i(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 6

    const/16 v0, 0x11

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p0, v0, :cond_29

    const/16 v0, 0x21

    if-eq p0, v0, :cond_1b

    const/16 v0, 0x42

    if-eq p0, v0, :cond_29

    const/16 v0, 0x82

    if-ne p0, v0, :cond_13

    goto :goto_1b

    :cond_13
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1b
    :goto_1b
    iget p0, p2, Landroid/graphics/Rect;->right:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    if-lt p0, v0, :cond_28

    iget p0, p2, Landroid/graphics/Rect;->left:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    if-gt p0, p1, :cond_28

    move v1, v2

    :cond_28
    return v1

    :cond_29
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    if-lt p0, v0, :cond_36

    iget p0, p2, Landroid/graphics/Rect;->top:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    if-gt p0, p1, :cond_36

    move v1, v2

    :cond_36
    return v1
.end method

.method public static final j([B)Ljava/util/LinkedHashSet;
    .registers 10

    const-string v0, "bytes"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    array-length v1, p0

    if-nez v1, :cond_e

    return-object v0

    :cond_e
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const/4 p0, 0x0

    :try_start_14
    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_19} :catch_50
    .catchall {:try_start_14 .. :try_end_19} :catchall_42

    :try_start_19
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v3

    const/4 v4, 0x0

    :goto_1e
    if-ge v4, v3, :cond_3e

    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v6

    new-instance v7, Lt0/c;

    const-string v8, "uri"

    invoke-static {v5, v8}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v7, v5, v6}, Lt0/c;-><init>(Landroid/net/Uri;Z)V

    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_39
    .catchall {:try_start_19 .. :try_end_39} :catchall_3c

    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    :catchall_3c
    move-exception v3

    goto :goto_44

    :cond_3e
    :try_start_3e
    invoke-static {v2, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_41} :catch_50
    .catchall {:try_start_3e .. :try_end_41} :catchall_42

    goto :goto_50

    :catchall_42
    move-exception p0

    goto :goto_4a

    :goto_44
    :try_start_44
    throw v3
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_45

    :catchall_45
    move-exception v4

    :try_start_46
    invoke-static {v2, v3}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v4
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_4a} :catch_50
    .catchall {:try_start_46 .. :try_end_4a} :catchall_42

    :goto_4a
    :try_start_4a
    throw p0
    :try_end_4b
    .catchall {:try_start_4a .. :try_end_4b} :catchall_4b

    :catchall_4b
    move-exception v0

    invoke-static {v1, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :catch_50
    :goto_50
    invoke-static {v1, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static k(Ljava/lang/String;Z)V
    .registers 2

    if-eqz p1, :cond_3

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static l(I)V
    .registers 1

    if-ltz p0, :cond_3

    return-void

    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method public static m(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 2

    if-eqz p0, :cond_3

    return-void

    :cond_3
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final n(JJJ)V
    .registers 10

    or-long v0, p2, p4

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_13

    cmp-long v0, p2, p0

    if-gtz v0, :cond_13

    sub-long v0, p0, p2

    cmp-long v0, v0, p4

    if-ltz v0, :cond_13

    return-void

    :cond_13
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "size="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " offset="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " byteCount="

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static p(Le0/W;Landroidx/emoji2/text/g;Landroid/view/View;Landroid/view/View;Le0/J;Z)I
    .registers 6

    invoke-virtual {p4}, Le0/J;->v()I

    move-result p4

    if-eqz p4, :cond_35

    invoke-virtual {p0}, Le0/W;->b()I

    move-result p0

    if-eqz p0, :cond_35

    if-eqz p2, :cond_35

    if-nez p3, :cond_11

    goto :goto_35

    :cond_11
    if-nez p5, :cond_23

    invoke-static {p2}, Le0/J;->J(Landroid/view/View;)I

    move-result p0

    invoke-static {p3}, Le0/J;->J(Landroid/view/View;)I

    move-result p1

    sub-int/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0

    :cond_23
    invoke-virtual {p1, p3}, Landroidx/emoji2/text/g;->b(Landroid/view/View;)I

    move-result p0

    invoke-virtual {p1, p2}, Landroidx/emoji2/text/g;->e(Landroid/view/View;)I

    move-result p2

    sub-int/2addr p0, p2

    invoke-virtual {p1}, Landroidx/emoji2/text/g;->l()I

    move-result p1

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    return p0

    :cond_35
    :goto_35
    const/4 p0, 0x0

    return p0
.end method

.method public static q(Le0/W;Landroidx/emoji2/text/g;Landroid/view/View;Landroid/view/View;Le0/J;ZZ)I
    .registers 10

    invoke-virtual {p4}, Le0/J;->v()I

    move-result p4

    const/4 v0, 0x0

    if-eqz p4, :cond_70

    invoke-virtual {p0}, Le0/W;->b()I

    move-result p4

    if-eqz p4, :cond_70

    if-eqz p2, :cond_70

    if-nez p3, :cond_12

    goto :goto_70

    :cond_12
    invoke-static {p2}, Le0/J;->J(Landroid/view/View;)I

    move-result p4

    invoke-static {p3}, Le0/J;->J(Landroid/view/View;)I

    move-result v1

    invoke-static {p4, v1}, Ljava/lang/Math;->min(II)I

    move-result p4

    invoke-static {p2}, Le0/J;->J(Landroid/view/View;)I

    move-result v1

    invoke-static {p3}, Le0/J;->J(Landroid/view/View;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-eqz p6, :cond_38

    invoke-virtual {p0}, Le0/W;->b()I

    move-result p0

    sub-int/2addr p0, v1

    add-int/lit8 p0, p0, -0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    goto :goto_3c

    :cond_38
    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result p0

    :goto_3c
    if-nez p5, :cond_3f

    return p0

    :cond_3f
    invoke-virtual {p1, p3}, Landroidx/emoji2/text/g;->b(Landroid/view/View;)I

    move-result p4

    invoke-virtual {p1, p2}, Landroidx/emoji2/text/g;->e(Landroid/view/View;)I

    move-result p5

    sub-int/2addr p4, p5

    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p4

    invoke-static {p2}, Le0/J;->J(Landroid/view/View;)I

    move-result p5

    invoke-static {p3}, Le0/J;->J(Landroid/view/View;)I

    move-result p3

    sub-int/2addr p5, p3

    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    int-to-float p4, p4

    int-to-float p3, p3

    div-float/2addr p4, p3

    int-to-float p0, p0

    mul-float/2addr p0, p4

    invoke-virtual {p1}, Landroidx/emoji2/text/g;->k()I

    move-result p3

    invoke-virtual {p1, p2}, Landroidx/emoji2/text/g;->e(Landroid/view/View;)I

    move-result p1

    sub-int/2addr p3, p1

    int-to-float p1, p3

    add-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0

    :cond_70
    :goto_70
    return v0
.end method

.method public static r(Le0/W;Landroidx/emoji2/text/g;Landroid/view/View;Landroid/view/View;Le0/J;Z)I
    .registers 6

    invoke-virtual {p4}, Le0/J;->v()I

    move-result p4

    if-eqz p4, :cond_3b

    invoke-virtual {p0}, Le0/W;->b()I

    move-result p4

    if-eqz p4, :cond_3b

    if-eqz p2, :cond_3b

    if-nez p3, :cond_11

    goto :goto_3b

    :cond_11
    if-nez p5, :cond_18

    invoke-virtual {p0}, Le0/W;->b()I

    move-result p0

    return p0

    :cond_18
    invoke-virtual {p1, p3}, Landroidx/emoji2/text/g;->b(Landroid/view/View;)I

    move-result p4

    invoke-virtual {p1, p2}, Landroidx/emoji2/text/g;->e(Landroid/view/View;)I

    move-result p1

    sub-int/2addr p4, p1

    invoke-static {p2}, Le0/J;->J(Landroid/view/View;)I

    move-result p1

    invoke-static {p3}, Le0/J;->J(Landroid/view/View;)I

    move-result p2

    sub-int/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    int-to-float p2, p4

    int-to-float p1, p1

    div-float/2addr p2, p1

    invoke-virtual {p0}, Le0/W;->b()I

    move-result p0

    int-to-float p0, p0

    mul-float/2addr p2, p0

    float-to-int p0, p2

    return p0

    :cond_3b
    :goto_3b
    const/4 p0, 0x0

    return p0
.end method

.method public static s(Landroid/content/Context;)Landroidx/emoji2/text/p;
    .registers 9

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_e

    new-instance v0, Landroidx/emoji2/text/c;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lf1/e;-><init>(I)V

    goto :goto_15

    :cond_e
    new-instance v0, Lf1/e;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lf1/e;-><init>(I)V

    :goto_15
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "Package manager required to locate emoji font provider"

    invoke-static {v1, v2}, LM2/l;->m(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    const-string v3, "androidx.content.action.LOAD_EMOJI_FONT"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->queryIntentContentProviders(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_4a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    iget-object v4, v4, Landroid/content/pm/ResolveInfo;->providerInfo:Landroid/content/pm/ProviderInfo;

    if-eqz v4, :cond_2e

    iget-object v6, v4, Landroid/content/pm/ProviderInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v6, :cond_2e

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v7, 0x1

    and-int/2addr v6, v7

    if-ne v6, v7, :cond_2e

    goto :goto_4b

    :cond_4a
    move-object v4, v5

    :goto_4b
    if-nez v4, :cond_4f

    :goto_4d
    move-object v1, v5

    goto :goto_7e

    :cond_4f
    :try_start_4f
    iget-object v2, v4, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    iget-object v4, v4, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Lf1/e;->n(Landroid/content/pm/PackageManager;Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    array-length v6, v0

    :goto_5d
    if-ge v3, v6, :cond_6b

    aget-object v7, v0, v3

    invoke-virtual {v7}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_5d

    :cond_6b
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, LG1/o;

    const-string v3, "emojicompat-emoji-font"

    invoke-direct {v1, v2, v4, v3, v0}, LG1/o;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    :try_end_76
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4f .. :try_end_76} :catch_77

    goto :goto_7e

    :catch_77
    move-exception v0

    const-string v1, "emoji2.text.DefaultEmojiConfig"

    invoke-static {v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4d

    :goto_7e
    if-nez v1, :cond_81

    goto :goto_8b

    :cond_81
    new-instance v5, Landroidx/emoji2/text/p;

    new-instance v0, Landroidx/emoji2/text/o;

    invoke-direct {v0, p0, v1}, Landroidx/emoji2/text/o;-><init>(Landroid/content/Context;LG1/o;)V

    invoke-direct {v5, v0}, Landroidx/emoji2/text/g;-><init>(Landroidx/emoji2/text/i;)V

    :goto_8b
    return-object v5
.end method

.method public static t(Ljava/lang/String;IIZ)I
    .registers 8

    :goto_0
    if-ge p1, p2, :cond_3f

    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x20

    const/4 v3, 0x1

    if-ge v1, v2, :cond_11

    const/16 v2, 0x9

    if-ne v1, v2, :cond_37

    :cond_11
    const/16 v2, 0x7f

    if-ge v1, v2, :cond_37

    const/16 v2, 0x39

    if-gt v1, v2, :cond_1e

    const/16 v2, 0x30

    if-gt v2, v1, :cond_1e

    goto :goto_37

    :cond_1e
    const/16 v2, 0x7a

    if-gt v1, v2, :cond_27

    const/16 v2, 0x61

    if-gt v2, v1, :cond_27

    goto :goto_37

    :cond_27
    const/16 v2, 0x5a

    if-gt v1, v2, :cond_30

    const/16 v2, 0x41

    if-gt v2, v1, :cond_30

    goto :goto_37

    :cond_30
    const/16 v2, 0x3a

    if-ne v1, v2, :cond_35

    goto :goto_37

    :cond_35
    const/4 v1, 0x0

    goto :goto_38

    :cond_37
    :goto_37
    move v1, v3

    :goto_38
    xor-int/lit8 v2, p3, 0x1

    if-ne v1, v2, :cond_3d

    return p1

    :cond_3d
    move p1, v0

    goto :goto_0

    :cond_3f
    return p2
.end method

.method public static u([B)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_40

    array-length v1, p0

    if-nez v1, :cond_7

    goto :goto_40

    :cond_7
    :try_start_7
    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_19

    return-object v1

    :cond_19
    new-instance v1, Ljava/lang/String;

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p0
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_2a} :catch_2f

    if-eqz p0, :cond_2d

    goto :goto_2e

    :cond_2d
    move-object v0, v1

    :goto_2e
    return-object v0

    :catch_2f
    :try_start_2f
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_3c} :catch_40

    if-eqz v1, :cond_3f

    goto :goto_40

    :cond_3f
    move-object v0, p0

    :catch_40
    :cond_40
    :goto_40
    return-object v0
.end method

.method public static final v(J)Ljava/lang/String;
    .registers 14

    const-wide/32 v0, -0x3b9328e0

    cmp-long v0, p0, v0

    const-string v1, " s "

    const v2, 0x3b9aca00

    const v3, 0x1dcd6500

    if-gtz v0, :cond_24

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v3, v3

    sub-long/2addr p0, v3

    int-to-long v2, v2

    div-long/2addr p0, v2

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_b0

    :cond_24
    const-wide/32 v4, -0xf404c

    cmp-long v0, p0, v4

    const-string v4, " ms"

    const v5, 0xf4240

    const v6, 0x7a120

    if-gtz v0, :cond_47

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v1, v6

    sub-long/2addr p0, v1

    int-to-long v1, v5

    div-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_b0

    :cond_47
    const-wide/16 v7, 0x0

    cmp-long v0, p0, v7

    const-string v7, " \u00b5s"

    const/16 v8, 0x3e8

    const/16 v9, 0x1f4

    if-gtz v0, :cond_67

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v1, v9

    sub-long/2addr p0, v1

    int-to-long v1, v8

    div-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_b0

    :cond_67
    const-wide/32 v10, 0xf404c

    cmp-long v0, p0, v10

    if-gez v0, :cond_82

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v1, v9

    add-long/2addr p0, v1

    int-to-long v1, v8

    div-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_b0

    :cond_82
    const-wide/32 v7, 0x3b9328e0

    cmp-long v0, p0, v7

    if-gez v0, :cond_9d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v1, v6

    add-long/2addr p0, v1

    int-to-long v1, v5

    div-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_b0

    :cond_9d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v3, v3

    add-long/2addr p0, v3

    int-to-long v2, v2

    div-long/2addr p0, v2

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_b0
    const/4 p1, 0x1

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%6s"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static w(Ljava/lang/String;)LE2/t;
    .registers 3

    const-string v0, "http/1.0"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object p0, LE2/t;->d:LE2/t;

    goto :goto_41

    :cond_b
    const-string v0, "http/1.1"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    sget-object p0, LE2/t;->e:LE2/t;

    goto :goto_41

    :cond_16
    const-string v0, "h2_prior_knowledge"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object p0, LE2/t;->h:LE2/t;

    goto :goto_41

    :cond_21
    const-string v0, "h2"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    sget-object p0, LE2/t;->g:LE2/t;

    goto :goto_41

    :cond_2c
    const-string v0, "spdy/3.1"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    sget-object p0, LE2/t;->f:LE2/t;

    goto :goto_41

    :cond_37
    const-string v0, "quic"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    sget-object p0, LE2/t;->i:LE2/t;

    :goto_41
    return-object p0

    :cond_42
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unexpected protocol: "

    invoke-static {p0, v1}, Lkotlin/jvm/internal/k;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static x(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 3

    invoke-static {}, Lj/L0;->b()Lj/L0;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lj/L0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static y([B)Ljava/lang/String;
    .registers 9

    const/4 v0, 0x0

    if-eqz p0, :cond_45

    array-length v1, p0

    if-nez v1, :cond_7

    goto :goto_45

    :cond_7
    const/4 v1, 0x0

    move-object v2, v0

    :goto_9
    :try_start_9
    array-length v3, p0

    if-ge v1, v3, :cond_44

    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    if-nez v3, :cond_13

    goto :goto_44

    :cond_13
    add-int/lit8 v4, v1, 0x1

    array-length v5, p0

    if-lt v4, v5, :cond_19

    goto :goto_44

    :cond_19
    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, v1, 0x2

    add-int/lit8 v6, v3, -0x1

    if-lez v6, :cond_40

    add-int/2addr v6, v5

    array-length v7, p0

    if-gt v6, v7, :cond_40

    const/16 v7, 0x9

    if-ne v4, v7, :cond_34

    invoke-static {p0, v5, v6}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    invoke-static {p0}, LM2/l;->u([B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_34
    const/16 v7, 0x8

    if-ne v4, v7, :cond_40

    invoke-static {p0, v5, v6}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v2

    invoke-static {v2}, LM2/l;->u([B)Ljava/lang/String;

    move-result-object v2
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_40} :catch_45

    :cond_40
    add-int/lit8 v3, v3, 0x1

    add-int/2addr v1, v3

    goto :goto_9

    :cond_44
    :goto_44
    return-object v2

    :catch_45
    :cond_45
    :goto_45
    return-object v0
.end method

.method public static z(Lf/g;)Landroid/content/Intent;
    .registers 4

    invoke-static {p0}, Lz/i;->a(Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    :try_start_7
    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    invoke-static {p0, v0}, LM2/l;->B(Landroid/app/Activity;Landroid/content/ComponentName;)Ljava/lang/String;

    move-result-object v0
    :try_end_f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_f} :catch_46

    const/4 v1, 0x0

    if-nez v0, :cond_13

    return-object v1

    :cond_13
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, p0, v0}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    :try_start_18
    invoke-static {p0, v2}, LM2/l;->B(Landroid/app/Activity;Landroid/content/ComponentName;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_23

    invoke-static {v2}, Landroid/content/Intent;->makeMainActivity(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p0

    goto :goto_2c

    :cond_23
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p0
    :try_end_2c
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_18 .. :try_end_2c} :catch_2d

    :goto_2c
    return-object p0

    :catch_2d
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "getParentActivityIntent: bad parentActivityName \'"

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' in manifest"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "NavUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :catch_46
    move-exception p0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public abstract Q(I)Landroid/view/View;
.end method

.method public abstract R(I)V
.end method

.method public abstract S(Landroid/graphics/Typeface;Z)V
.end method

.method public abstract T()Z
.end method

.method public abstract o(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
.end method

