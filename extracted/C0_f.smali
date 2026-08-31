.class public abstract LC0/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LM/g0;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    return-void
.end method

.method public static final A(CCZ)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-nez p2, :cond_8

    return v1

    :cond_8
    invoke-static {p0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result p0

    invoke-static {p1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result p1

    if-eq p0, p1, :cond_1e

    invoke-static {p0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p0

    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    if-ne p0, p1, :cond_1d

    goto :goto_1e

    :cond_1d
    move v0, v1

    :cond_1e
    :goto_1e
    return v0
.end method

.method public static C(Lh2/f;Lh2/g;)Lh2/f;
    .registers 3

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Lh2/f;->getKey()Lh2/g;

    move-result-object v0

    invoke-static {v0, p1}, Lkotlin/jvm/internal/k;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    return-object p0
.end method

.method public static final C0(Ljava/net/Socket;)LR2/b;
    .registers 4

    sget-object v0, LR2/l;->a:Ljava/util/logging/Logger;

    new-instance v0, LI2/h;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p0}, LI2/h;-><init>(ILjava/lang/Object;)V

    new-instance v1, LR2/b;

    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    const-string v2, "getOutputStream()"

    invoke-static {p0, v2}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, p0, v0}, LR2/b;-><init>(Ljava/io/OutputStream;LI2/h;)V

    new-instance p0, LR2/b;

    invoke-direct {p0, v0, v1}, LR2/b;-><init>(LI2/h;LR2/b;)V

    return-object p0
.end method

.method public static D(Lc2/d;)Ljava/util/Map;
    .registers 1

    if-eqz p0, :cond_13

    iget-object p0, p0, Lc2/d;->i:Landroidx/lifecycle/z;

    invoke-virtual {p0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_d

    goto :goto_12

    :cond_d
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :goto_12
    return-object p0

    :cond_13
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0
.end method

.method public static final D0(Ljava/net/Socket;)LR2/c;
    .registers 4

    sget-object v0, LR2/l;->a:Ljava/util/logging/Logger;

    new-instance v0, LI2/h;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p0}, LI2/h;-><init>(ILjava/lang/Object;)V

    new-instance v1, LR2/c;

    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    const-string v2, "getInputStream()"

    invoke-static {p0, v2}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2, v0}, LR2/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    new-instance p0, LR2/c;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, LR2/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    return-object p0
.end method

.method public static E(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 6

    const-string v0, "A:PW;P:"

    const/4 v1, 0x0

    if-eqz p0, :cond_40

    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_40

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_12

    goto :goto_40

    :cond_12
    invoke-static {p0}, LC0/f;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0x18

    const/16 v3, 0x8

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, LC0/f;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ";"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, LC0/f;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LC0/f;->y(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0

    :cond_40
    :goto_40
    new-array p0, v1, [B
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_42} :catch_43

    return-object p0

    :catch_43
    new-array p0, v1, [B

    return-object p0
.end method

.method public static final F0(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    const/4 v0, 0x1

    const-string v1, "<this>"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, ":"

    invoke-static {p0, v1}, Lx2/e;->j0(Ljava/lang/CharSequence;Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eqz v1, :cond_bb

    const-string v1, "["

    invoke-static {p0, v1, v2}, Lx2/m;->h0(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2b

    const-string v1, "]"

    invoke-static {p0, v1}, Lx2/m;->c0(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-static {p0, v0, v1}, LC0/f;->u(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object v1

    goto :goto_33

    :cond_2b
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p0, v2, v1}, LC0/f;->u(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object v1

    :goto_33
    if-nez v1, :cond_36

    return-object v3

    :cond_36
    invoke-virtual {v1}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v3

    array-length v5, v3

    const/4 v6, 0x4

    const/16 v7, 0x10

    if-ne v5, v7, :cond_9a

    move p0, v2

    move v1, p0

    :goto_42
    array-length v5, v3

    if-ge p0, v5, :cond_60

    move v5, p0

    :goto_46
    if-ge v5, v7, :cond_55

    aget-byte v8, v3, v5

    if-nez v8, :cond_55

    add-int/lit8 v8, v5, 0x1

    aget-byte v8, v3, v8

    if-nez v8, :cond_55

    add-int/lit8 v5, v5, 0x2

    goto :goto_46

    :cond_55
    sub-int v8, v5, p0

    if-le v8, v1, :cond_5d

    if-lt v8, v6, :cond_5d

    move v4, p0

    move v1, v8

    :cond_5d
    add-int/lit8 p0, v5, 0x2

    goto :goto_42

    :cond_60
    new-instance p0, LR2/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :cond_65
    :goto_65
    array-length v5, v3

    if-ge v2, v5, :cond_91

    const/16 v5, 0x3a

    if-ne v2, v4, :cond_76

    invoke-virtual {p0, v5}, LR2/e;->M(I)V

    add-int/2addr v2, v1

    if-ne v2, v7, :cond_65

    invoke-virtual {p0, v5}, LR2/e;->M(I)V

    goto :goto_65

    :cond_76
    if-lez v2, :cond_7b

    invoke-virtual {p0, v5}, LR2/e;->M(I)V

    :cond_7b
    aget-byte v5, v3, v2

    sget-object v6, LF2/b;->a:[B

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    add-int/lit8 v6, v2, 0x1

    aget-byte v6, v3, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v5, v6

    int-to-long v5, v5

    invoke-virtual {p0, v5, v6}, LR2/e;->N(J)V

    add-int/lit8 v2, v2, 0x2

    goto :goto_65

    :cond_91
    iget-wide v0, p0, LR2/e;->d:J

    sget-object v2, Lx2/a;->a:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0, v1, v2}, LR2/e;->F(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9a
    array-length v0, v3

    if-ne v0, v6, :cond_a2

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_a2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid IPv6 address: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x27

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_bb
    :try_start_bb
    invoke-static {p0}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "toASCII(host)"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "US"

    invoke-static {v1, v5}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "this as java.lang.String).toLowerCase(locale)"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_db

    return-object v3

    :cond_db
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    move v5, v2

    :goto_e0
    if-ge v5, v1, :cond_105

    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x1f

    invoke-static {v5, v7}, Lkotlin/jvm/internal/k;->f(II)I

    move-result v7

    if-lez v7, :cond_106

    const/16 v7, 0x7f

    invoke-static {v5, v7}, Lkotlin/jvm/internal/k;->f(II)I

    move-result v7

    if-ltz v7, :cond_f9

    goto :goto_106

    :cond_f9
    const-string v7, " #%/:?@[\\]"

    const/4 v8, 0x6

    invoke-static {v7, v5, v2, v2, v8}, Lx2/e;->m0(Ljava/lang/CharSequence;CIZI)I

    move-result v5
    :try_end_100
    .catch Ljava/lang/IllegalArgumentException; {:try_start_bb .. :try_end_100} :catch_106

    if-eq v5, v4, :cond_103

    goto :goto_106

    :cond_103
    move v5, v6

    goto :goto_e0

    :cond_105
    move-object v3, p0

    :catch_106
    :cond_106
    :goto_106
    return-object v3
.end method

.method public static G(Landroid/widget/EdgeEffect;)F
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_b

    invoke-static {p0}, LQ/e;->b(Landroid/widget/EdgeEffect;)F

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static G0(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .registers 7

    const-string v0, "FeedbackApi"

    const-string v1, "\u56fe\u7247\u4e0a\u4f20\u5931\u8d25: "

    const/4 v2, 0x0

    :try_start_5
    invoke-static {p0, p1}, LC0/f;->x(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_c

    return-object v2

    :cond_c
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "image"

    invoke-virtual {p1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p0, "imageType"

    const-string v3, "jpeg"

    invoke-virtual {p1, p0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object p0

    const-string v3, "/api/feedback/upload-image"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, p1, v4}, LB1/c;->l(Ljava/lang/String;Lorg/json/JSONObject;Z)LB1/b;

    move-result-object p0

    iget-boolean p1, p0, LB1/b;->b:Z
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_2a} :catch_50

    iget v3, p0, LB1/b;->a:I

    if-eqz p1, :cond_52

    const/16 p1, 0xc8

    if-ne v3, p1, :cond_52

    :try_start_32
    invoke-virtual {p0}, LB1/b;->d()Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_52

    const-string p1, "success"

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_52

    const-string p1, "data"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_52

    const-string p1, "imagePath"

    invoke-virtual {p0, p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catch_50
    move-exception p0

    goto :goto_62

    :cond_52
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_61} :catch_50

    return-object v2

    :goto_62
    const-string p1, "\u56fe\u7247\u4e0a\u4f20\u5f02\u5e38"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2
.end method

.method public static H(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 7

    const-string v0, "A:PW;P:"

    const-string v1, "CmdUtils"

    const/4 v2, 0x0

    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_42

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_12

    goto :goto_42

    :cond_12
    invoke-static {p0}, LC0/f;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0x18

    const/16 v4, 0x8

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, LC0/f;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ";"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, LC0/f;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LC0/f;->y(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0

    :catch_40
    move-exception p0

    goto :goto_4a

    :cond_42
    :goto_42
    const-string p0, "\u5bc6\u7801\u53c2\u6570\u65e0\u6548: old/new \u4e3a\u7a7a\u6216\u957f\u5ea6\u4e0d\u8db3"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-array p0, v2, [B
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_49} :catch_40

    return-object p0

    :goto_4a
    const-string p1, "\u751f\u6210\u521d\u59cb\u5316\u5bc6\u7801\u547d\u4ee4\u5f02\u5e38"

    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-array p0, v2, [B

    return-object p0
.end method

.method public static H0(Ljava/lang/String;)V
    .registers 2

    const-string v0, "MqttClient"

    invoke-static {p0}, LC0/f;->o0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static I(Lc2/d;)Ljava/util/Map;
    .registers 1

    if-eqz p0, :cond_13

    iget-object p0, p0, Lc2/d;->k:Landroidx/lifecycle/z;

    invoke-virtual {p0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_d

    goto :goto_12

    :cond_d
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :goto_12
    return-object p0

    :cond_13
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0
.end method

.method public static J(Lc2/d;)Ljava/util/Map;
    .registers 1

    if-eqz p0, :cond_13

    iget-object p0, p0, Lc2/d;->j:Landroidx/lifecycle/z;

    invoke-virtual {p0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_d

    goto :goto_12

    :cond_d
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :goto_12
    return-object p0

    :cond_13
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0
.end method

.method public static K(Lcom/macronum/bledemo/model/BluetoothDevice;)[B
    .registers 9

    const-string v0, ","

    const-string v1, "\u3010\u751f\u6210\u5f00\u9501\u547d\u4ee4\u3011\u8bbe\u5907\u5bc6\u7801\u4e3a\u7a7a: lockMac="

    const-string v2, "A:OPEN;P:"

    const-string v3, "CmdUtils"

    const/4 v4, 0x0

    if-nez p0, :cond_13

    :try_start_b
    const-string p0, "\u3010\u751f\u6210\u5f00\u9501\u547d\u4ee4\u3011\u8bbe\u5907\u5bf9\u8c61\u4e3anull"

    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-array p0, v4, [B

    return-object p0

    :cond_13
    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_a4

    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_25

    goto/16 :goto_a4

    :cond_25
    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAttribute()I

    move-result v1

    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOpenTime()I

    move-result v3

    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getWaitTime()I

    move-result v5

    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getCloseTime()I

    move-result v6

    const/4 v7, 0x1

    if-ne v1, v7, :cond_3b

    const-string v1, "-"

    goto :goto_3d

    :cond_3b
    const-string v1, "+"

    :goto_3d
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ";"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_7a

    const-string v1, "[0-9a-fA-F]{16}"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7a

    goto :goto_9b

    :cond_7a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x20

    const/16 v3, 0x18

    const/16 v5, 0x8

    if-ne v1, v2, :cond_93

    const-string v1, "[0-9a-fA-F]{32}"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_93

    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_9b

    :cond_93
    invoke-static {p0}, LC0/f;->R(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :goto_9b
    invoke-static {p0, v0}, LC0/f;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LC0/f;->y(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0

    :cond_a4
    :goto_a4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-array p0, v4, [B
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b9} :catch_ba

    return-object p0

    :catch_ba
    new-array p0, v4, [B

    return-object p0
.end method

.method public static M(Lj0/d;Landroid/database/sqlite/SQLiteDatabase;)Lj0/c;
    .registers 4

    const-string v0, "refHolder"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sqLiteDatabase"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lj0/d;->a:Lj0/c;

    if-eqz v0, :cond_16

    iget-object v1, v0, Lj0/c;->b:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/k;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    :cond_16
    new-instance v0, Lj0/c;

    invoke-direct {v0, p1}, Lj0/c;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iput-object v0, p0, Lj0/d;->a:Lj0/c;

    :cond_1d
    return-object v0
.end method

.method public static final O(Ljava/lang/AssertionError;)Z
    .registers 3

    sget-object v0, LR2/l;->a:Ljava/util/logging/Logger;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_16

    const-string v0, "getsockname failed"

    invoke-static {p0, v0}, Lx2/e;->j0(Ljava/lang/CharSequence;Ljava/lang/String;)Z

    move-result p0

    goto :goto_17

    :cond_16
    move p0, v1

    :goto_17
    if-eqz p0, :cond_1a

    const/4 v1, 0x1

    :cond_1a
    return v1
.end method

.method public static Q(Landroid/content/SharedPreferences;)Ljava/util/HashSet;
    .registers 9

    const-string v0, "QueueStorageHelper"

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    if-eqz p0, :cond_61

    const-string v2, "deleted_lock_macs"

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_12

    goto :goto_61

    :cond_12
    const/4 v3, 0x0

    :try_start_13
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1e

    return-object v1

    :cond_1e
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    :goto_24
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v4, v6, :cond_3f

    invoke-virtual {v5, v4, v3}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3c

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_3c

    :catch_38
    move-exception p0

    goto :goto_43

    :catch_3a
    move-exception v4

    goto :goto_49

    :cond_3c
    :goto_3c
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    :cond_3f
    invoke-virtual {v1}, Ljava/util/HashSet;->size()I
    :try_end_42
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_42} :catch_3a
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_42} :catch_38

    goto :goto_61

    :goto_43
    const-string v2, "\u8bfb\u53d6\u5b57\u7b26\u4e32\u5217\u8868\u5931\u8d25: key=deleted_lock_macs"

    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_61

    :goto_49
    const-string v5, "\u8bfb\u53d6\u5b57\u7b26\u4e32\u5217\u8868\u5931\u8d25\uff08JSON\u89e3\u6790\u9519\u8bef\uff09: key=deleted_lock_macs"

    invoke-static {v0, v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :try_start_4e
    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_61

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-static {p0, v1}, LC0/f;->p0(Landroid/content/SharedPreferences;Ljava/util/HashSet;)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_5a} :catch_5b

    goto :goto_61

    :catch_5b
    move-exception p0

    const-string v2, "\u8bfb\u53d6\u65e7\u683c\u5f0f\u4e5f\u5931\u8d25: key=deleted_lock_macs"

    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_61
    :goto_61
    return-object v1
.end method

.method public static R(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    :cond_5
    :try_start_5
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    array-length v2, p0

    const/4 v3, 0x0

    :goto_1c
    if-ge v3, v2, :cond_38

    aget-byte v4, p0, v3

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_32

    const/16 v5, 0x30

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_32
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    :cond_38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_3c} :catch_3d

    return-object p0

    :catch_3d
    return-object v0
.end method

.method public static final S(Landroid/content/Context;)V
    .registers 11

    const-string v0, "context"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "androidx.work.workdb"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    const-string v2, "context.getDatabasePath(WORK_DATABASE_NAME)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_f6

    invoke-static {}, Lt0/r;->c()Lt0/r;

    move-result-object v1

    sget-object v3, Lu0/l;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-static {v1, v2}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    sget-object v3, Lu0/a;->a:Lu0/a;

    invoke-virtual {v3, p0}, Lu0/a;->a(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    invoke-direct {v2, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sget-object p0, Lu0/l;->b:[Ljava/lang/String;

    array-length v0, p0

    invoke-static {v0}, Le2/w;->i0(I)I

    move-result v0

    const/16 v3, 0x10

    if-ge v0, v3, :cond_3d

    move v0, v3

    :cond_3d
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    array-length v0, p0

    const/4 v4, 0x0

    :goto_44
    if-ge v4, v0, :cond_7e

    aget-object v5, p0, v4

    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v7, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_44

    :cond_7e
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_8e

    invoke-static {v1, v2}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    const-string v0, "singletonMap(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_96

    :cond_8e
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0, v3}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {p0, v1, v2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_96
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_9e
    :goto_9e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_9e

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_d9

    invoke-static {}, Lt0/r;->c()Lt0/r;

    move-result-object v2

    sget-object v3, Lu0/l;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Over-writing contents of "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lt0/r;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d9
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_e6

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    goto :goto_ec

    :cond_e6
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :goto_ec
    invoke-static {}, Lt0/r;->c()Lt0/r;

    move-result-object v0

    sget-object v1, Lu0/l;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_9e

    :cond_f6
    return-void
.end method

.method public static T(Lh2/f;Lh2/g;)Lh2/h;
    .registers 3

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Lh2/f;->getKey()Lh2/g;

    move-result-object v0

    invoke-static {v0, p1}, Lkotlin/jvm/internal/k;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    sget-object p0, Lh2/i;->b:Lh2/i;

    :cond_11
    return-object p0
.end method

.method public static varargs U([Ljava/lang/String;)LE2/n;
    .registers 7

    array-length v0, p0

    const/4 v1, 0x2

    rem-int/2addr v0, v1

    if-nez v0, :cond_4c

    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    array-length v0, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_e
    if-ge v3, v0, :cond_2a

    add-int/lit8 v4, v3, 0x1

    aget-object v5, p0, v3

    if-eqz v5, :cond_22

    invoke-static {v5}, Lx2/e;->v0(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, p0, v3

    move v3, v4

    goto :goto_e

    :cond_22
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Headers cannot be null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2a
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v2, v0, v1}, LM2/d;->z(III)I

    move-result v0

    if-ltz v0, :cond_46

    :goto_33
    add-int/lit8 v1, v2, 0x2

    aget-object v3, p0, v2

    add-int/lit8 v4, v2, 0x1

    aget-object v4, p0, v4

    invoke-static {v3}, LC0/f;->h(Ljava/lang/String;)V

    invoke-static {v4, v3}, LC0/f;->j(Ljava/lang/String;Ljava/lang/String;)V

    if-ne v2, v0, :cond_44

    goto :goto_46

    :cond_44
    move v2, v1

    goto :goto_33

    :cond_46
    :goto_46
    new-instance v0, LE2/n;

    invoke-direct {v0, p0}, LE2/n;-><init>([Ljava/lang/String;)V

    return-object v0

    :cond_4c
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Expected alternating header names and values"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static Z(Landroid/widget/EdgeEffect;FF)F
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_b

    invoke-static {p0, p1, p2}, LQ/e;->c(Landroid/widget/EdgeEffect;FF)F

    move-result p0

    return p0

    :cond_b
    invoke-static {p0, p1, p2}, LQ/d;->a(Landroid/widget/EdgeEffect;FF)V

    return p1
.end method

.method public static b0(Lx1/a;)Lp1/e;
    .registers 7

    const-string v0, " to Json"

    const-string v1, "Failed parsing JSON source: "

    iget-boolean v2, p0, Lx1/a;->d:Z

    const/4 v3, 0x1

    iput-boolean v3, p0, Lx1/a;->d:Z

    :try_start_9
    invoke-static {p0}, Lr1/d;->h(Lx1/a;)Lp1/e;

    move-result-object v0
    :try_end_d
    .catch Ljava/lang/StackOverflowError; {:try_start_9 .. :try_end_d} :catch_28
    .catch Ljava/lang/OutOfMemoryError; {:try_start_9 .. :try_end_d} :catch_12
    .catchall {:try_start_9 .. :try_end_d} :catchall_10

    iput-boolean v2, p0, Lx1/a;->d:Z

    return-object v0

    :catchall_10
    move-exception v0

    goto :goto_3e

    :catch_12
    move-exception v3

    :try_start_13
    new-instance v4, Landroidx/fragment/app/o;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    :catch_28
    move-exception v3

    new-instance v4, Landroidx/fragment/app/o;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_3e
    .catchall {:try_start_13 .. :try_end_3e} :catchall_10

    :goto_3e
    iput-boolean v2, p0, Lx1/a;->d:Z

    throw v0
.end method

.method public static c0(Ljava/lang/String;)Lp1/e;
    .registers 3

    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    :try_start_5
    new-instance p0, Lx1/a;

    invoke-direct {p0, v0}, Lx1/a;-><init>(Ljava/io/StringReader;)V

    invoke-static {p0}, LC0/f;->b0(Lx1/a;)Lp1/e;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v1, v0, Lp1/g;

    if-nez v1, :cond_2c

    invoke-virtual {p0}, Lx1/a;->T()I

    move-result p0

    const/16 v1, 0xa

    if-ne p0, v1, :cond_1e

    goto :goto_2c

    :cond_1e
    new-instance p0, Lp1/j;

    const-string v0, "Did not consume the entire document."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_26
    .catch Lx1/c; {:try_start_5 .. :try_end_26} :catch_2a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_26} :catch_28
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_26} :catch_26

    :catch_26
    move-exception p0

    goto :goto_2d

    :catch_28
    move-exception p0

    goto :goto_33

    :catch_2a
    move-exception p0

    goto :goto_39

    :cond_2c
    :goto_2c
    return-object v0

    :goto_2d
    new-instance v0, Lp1/j;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :goto_33
    new-instance v0, Lp1/f;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :goto_39
    new-instance v0, Lp1/j;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static d(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "exception"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    if-eq p0, p1, :cond_28

    sget-object v0, Lm2/a;->a:Ljava/lang/Integer;

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x13

    if-lt v0, v1, :cond_19

    goto :goto_25

    :cond_19
    sget-object v0, Ll2/a;->a:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_28

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_28

    :cond_25
    :goto_25
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_28
    :goto_28
    return-void
.end method

.method public static final d0(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "method"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "GET"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "HEAD"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    const/4 p0, 0x1

    goto :goto_18

    :cond_17
    const/4 p0, 0x0

    :goto_18
    return p0
.end method

.method public static e0(Lh2/f;Lh2/h;)Lh2/h;
    .registers 3

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->S(Lh2/h;Lh2/h;)Lh2/h;

    move-result-object p0

    return-object p0
.end method

.method public static h(Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v0, :cond_39

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x21

    if-gt v4, v3, :cond_1d

    const/16 v4, 0x7f

    if-ge v3, v4, :cond_1d

    move v1, v2

    goto :goto_b

    :cond_1d
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "Unexpected char %#04x at %d in header name: %s"

    invoke-static {v0, p0}, LF2/b;->i(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_39
    return-void

    :cond_3a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "name is empty"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final h0(Landroidx/room/n;Landroidx/room/r;)Landroid/database/Cursor;
    .registers 3

    const-string v0, "db"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/room/n;->query(Li0/f;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method public static i(I)V
    .registers 6

    const/4 v0, 0x2

    if-gt v0, p0, :cond_8

    const/16 v1, 0x25

    if-ge p0, v1, :cond_8

    return-void

    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "radix "

    const-string v3, " was not in valid range "

    invoke-static {v2, p0, v3}, LA/e;->n(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    new-instance v2, Lu2/c;

    const/4 v3, 0x1

    const/16 v4, 0x24

    invoke-direct {v2, v0, v4, v3}, Lu2/a;-><init>(III)V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static i0(Ljava/nio/MappedByteBuffer;)LV/b;
    .registers 14

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object p0

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    const/16 v1, 0x64

    const-string v2, "Cannot read metadata."

    if-gt v0, v1, :cond_d5

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v1

    add-int/lit8 v1, v1, 0x6

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v1, 0x0

    move v3, v1

    :goto_2b
    const-wide v4, 0xffffffffL

    const-wide/16 v6, -0x1

    if-ge v3, v0, :cond_59

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v8

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v9

    add-int/lit8 v9, v9, 0x4

    invoke-virtual {p0, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v9

    int-to-long v9, v9

    and-long/2addr v9, v4

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v11

    add-int/lit8 v11, v11, 0x4

    invoke-virtual {p0, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const v11, 0x6d657461

    if-ne v11, v8, :cond_56

    goto :goto_5a

    :cond_56
    add-int/lit8 v3, v3, 0x1

    goto :goto_2b

    :cond_59
    move-wide v9, v6

    :goto_5a
    cmp-long v0, v9, v6

    if-eqz v0, :cond_cf

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v0

    int-to-long v6, v0

    sub-long v6, v9, v6

    long-to-int v0, v6

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v3

    add-int/2addr v3, v0

    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0xc

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-long v6, v0

    and-long/2addr v6, v4

    :goto_7d
    int-to-long v11, v1

    cmp-long v0, v11, v6

    if-gez v0, :cond_cf

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    int-to-long v11, v3

    and-long/2addr v11, v4

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    const v3, 0x456d6a69

    if-eq v3, v0, :cond_9d

    const v3, 0x656d6a69

    if-ne v3, v0, :cond_9a

    goto :goto_9d

    :cond_9a
    add-int/lit8 v1, v1, 0x1

    goto :goto_7d

    :cond_9d
    :goto_9d
    add-long/2addr v11, v9

    long-to-int v0, v11

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    new-instance v0, LV/b;

    invoke-direct {v0}, LM/B;-><init>()V

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v1

    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v2

    add-int/2addr v2, v1

    iput-object p0, v0, LM/B;->f:Ljava/lang/Object;

    iput v2, v0, LM/B;->b:I

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p0

    sub-int/2addr v2, p0

    iput v2, v0, LM/B;->d:I

    iget-object p0, v0, LM/B;->f:Ljava/lang/Object;

    check-cast p0, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result p0

    iput p0, v0, LM/B;->e:I

    return-object v0

    :cond_cf
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_d5
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_4b

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x9

    if-eq v3, v4, :cond_49

    const/16 v4, 0x20

    if-gt v4, v3, :cond_1a

    const/16 v4, 0x7f

    if-ge v3, v4, :cond_1a

    goto :goto_49

    :cond_1a
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1, p1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Unexpected char %#04x at %d in %s value"

    invoke-static {v1, v0}, LF2/b;->i(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, LF2/b;->q(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_35

    const-string p0, ""

    goto :goto_3b

    :cond_35
    const-string p1, ": "

    invoke-static {p0, p1}, Lkotlin/jvm/internal/k;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_3b
    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_49
    :goto_49
    move v1, v2

    goto :goto_5

    :cond_4b
    return-void
.end method

.method public static j0(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    if-eqz p0, :cond_1b

    const-string v0, "deleted_lock_macs"

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_1b

    :cond_11
    invoke-static {p0}, LC0/f;->Q(Landroid/content/SharedPreferences;)Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-static {p0, v0}, LC0/f;->p0(Landroid/content/SharedPreferences;Ljava/util/HashSet;)V

    :cond_1b
    :goto_1b
    return-void
.end method

.method public static k0(Landroid/content/Context;I)Landroid/util/TypedValue;
    .registers 4

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p0

    if-eqz p0, :cond_11

    return-object v0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public static l0(Landroid/content/Context;IZ)Z
    .registers 4

    invoke-static {p0, p1}, LC0/f;->k0(Landroid/content/Context;I)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_13

    iget p1, p0, Landroid/util/TypedValue;->type:I

    const/16 v0, 0x12

    if-ne p1, v0, :cond_13

    iget p0, p0, Landroid/util/TypedValue;->data:I

    if-eqz p0, :cond_12

    const/4 p2, 0x1

    goto :goto_13

    :cond_12
    const/4 p2, 0x0

    :cond_13
    :goto_13
    return p2
.end method

.method public static final m(II)V
    .registers 5

    if-gt p0, p1, :cond_3

    return-void

    :cond_3
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "toIndex ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ") is greater than size ("

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static m0(Landroid/content/Context;ILjava/lang/String;)Landroid/util/TypedValue;
    .registers 4

    invoke-static {p0, p1}, LC0/f;->k0(Landroid/content/Context;I)Landroid/util/TypedValue;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p2, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%1$s requires a value for the %2$s attribute to be set in your app theme. You can either set the attribute in your theme or update your theme to inherit from Theme.MaterialComponents (or a descendant)."

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static n0(Ljava/lang/String;)Ljava/lang/String;
    .registers 16

    if-eqz p0, :cond_4c

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_4c

    :cond_9
    :try_start_9
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "originalPassword"

    const-string v2, "oldPassword"

    const-string v3, "newPassword"

    const-string v4, "password"

    const-string v5, "passwordMd5"

    const-string v6, "md5"

    const-string v7, "secret"

    const-string v8, "token"

    const-string v9, "accessToken"

    const-string v10, "refreshToken"

    const-string v11, "apiKey"

    const-string v12, "apikey"

    const-string v13, "authKey"

    const-string v14, "authkey"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_2f
    const/16 v3, 0xe

    if-ge v2, v3, :cond_43

    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_40

    const-string v4, "***"

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_40
    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    :cond_43
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_47
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_47} :catch_48

    return-object p0

    :catch_48
    invoke-static {p0}, LC0/f;->o0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_4c
    :goto_4c
    return-object p0
.end method

.method public static o(I)Landroid/support/v4/media/session/a;
    .registers 2

    if-eqz p0, :cond_11

    const/4 v0, 0x1

    if-eq p0, v0, :cond_b

    new-instance p0, Lf1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_b
    new-instance p0, Lf1/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_11
    new-instance p0, Lf1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0
.end method

.method public static o0(Ljava/lang/String;)Ljava/lang/String;
    .registers 22

    move-object/from16 v0, p0

    if-eqz v0, :cond_b0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    goto/16 :goto_b0

    :cond_c
    const-string v19, "deviceId"

    const-string v20, "userId"

    const-string v2, "password"

    const-string v3, "pwd"

    const-string v4, "pass"

    const-string v5, "md5"

    const-string v6, "hash"

    const-string v7, "secret"

    const-string v8, "token"

    const-string v9, "accessToken"

    const-string v10, "refreshToken"

    const-string v11, "authToken"

    const-string v12, "key"

    const-string v13, "apiKey"

    const-string v14, "apikey"

    const-string v15, "authKey"

    const-string v16, "authkey"

    const-string v17, "mac"

    const-string v18, "address"

    filled-new-array/range {v2 .. v20}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_3c
    const/16 v5, 0x13

    if-ge v4, v5, :cond_b0

    aget-object v6, v1, v4

    invoke-virtual {v2, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_ad

    move-object v4, v0

    move v2, v3

    :goto_4a
    if-ge v2, v5, :cond_83

    aget-object v6, v1, v2

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "(?i)("

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\\s*[=:]\\s*)([^\\s,;}\\]\\)\"\']+)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "$1***"

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "(?i)(\""

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\"\\s*:\\s*\")([^\"]+)(\")"

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "$1***$3"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_4a

    :cond_83
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ac

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x64

    if-le v1, v2, :cond_a9

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x32

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "...[\u5df2\u8131\u654f]"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_a9
    const-string v0, "[\u5df2\u8131\u654f]"

    return-object v0

    :cond_ac
    return-object v4

    :cond_ad
    add-int/lit8 v4, v4, 0x1

    goto :goto_3c

    :cond_b0
    :goto_b0
    return-object v0
.end method

.method public static p0(Landroid/content/SharedPreferences;Ljava/util/HashSet;)V
    .registers 8

    const-string v0, "QueueStorageHelper"

    if-eqz p0, :cond_47

    const-string v1, "deleted_lock_macs"

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_d

    goto :goto_47

    :cond_d
    :try_start_d
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_16
    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_16

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_16

    :catch_2c
    move-exception p0

    goto :goto_41

    :cond_2e
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p1}, Ljava/util/HashSet;->size()I
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_40} :catch_2c

    goto :goto_46

    :goto_41
    const-string p1, "\u4fdd\u5b58\u5b57\u7b26\u4e32\u5217\u8868\u5931\u8d25: key=deleted_lock_macs"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_46
    return-void

    :cond_47
    :goto_47
    const-string p0, "\u4fdd\u5b58\u5b57\u7b26\u4e32\u5217\u8868\u5931\u8d25\uff1a\u53c2\u6570\u65e0\u6548"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static s(Ljava/lang/String;)V
    .registers 1

    invoke-static {p0}, LC0/f;->n0(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public static final t(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Landroidx/room/l;
    .registers 4

    if-eqz p2, :cond_e

    invoke-static {p2}, Lx2/e;->p0(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    new-instance v0, Landroidx/room/l;

    invoke-direct {v0, p0, p1, p2}, Landroidx/room/l;-><init>(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V

    return-object v0

    :cond_e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Cannot build a database with null or empty name. If you are trying to create an in memory database, use Room.inMemoryDatabaseBuilder"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final u(Ljava/lang/String;II)Ljava/net/InetAddress;
    .registers 20

    move-object/from16 v0, p0

    move/from16 v1, p2

    const/16 v2, 0x10

    new-array v3, v2, [B

    const/4 v4, 0x0

    const/4 v5, -0x1

    move/from16 v6, p1

    move v7, v4

    move v8, v5

    move v9, v8

    :goto_f
    const/4 v10, 0x0

    if-ge v6, v1, :cond_d5

    if-ne v7, v2, :cond_15

    return-object v10

    :cond_15
    add-int/lit8 v11, v6, 0x2

    const/16 v12, 0xff

    if-gt v11, v1, :cond_32

    const-string v13, "::"

    invoke-static {v0, v6, v13, v4}, Lx2/m;->g0(Ljava/lang/String;ILjava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_32

    if-eq v8, v5, :cond_26

    return-object v10

    :cond_26
    add-int/lit8 v7, v7, 0x2

    if-ne v11, v1, :cond_2e

    move v0, v2

    move v8, v7

    goto/16 :goto_d6

    :cond_2e
    move v8, v7

    move v9, v11

    goto/16 :goto_a3

    :cond_32
    if-eqz v7, :cond_3e

    const-string v11, ":"

    invoke-static {v0, v6, v11, v4}, Lx2/m;->g0(Ljava/lang/String;ILjava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_41

    add-int/lit8 v6, v6, 0x1

    :cond_3e
    move v9, v6

    goto/16 :goto_a3

    :cond_41
    const-string v11, "."

    invoke-static {v0, v6, v11, v4}, Lx2/m;->g0(Ljava/lang/String;ILjava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_a2

    add-int/lit8 v6, v7, -0x2

    move v11, v6

    :goto_4c
    if-ge v9, v1, :cond_99

    if-ne v11, v2, :cond_51

    goto :goto_a2

    :cond_51
    if-eq v11, v6, :cond_5e

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x2e

    if-eq v13, v14, :cond_5c

    goto :goto_a2

    :cond_5c
    add-int/lit8 v9, v9, 0x1

    :cond_5e
    move v14, v4

    move v13, v9

    :goto_60
    if-ge v13, v1, :cond_89

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v4, 0x30

    invoke-static {v15, v4}, Lkotlin/jvm/internal/k;->f(II)I

    move-result v16

    if-ltz v16, :cond_89

    const/16 v2, 0x39

    invoke-static {v15, v2}, Lkotlin/jvm/internal/k;->f(II)I

    move-result v2

    if-lez v2, :cond_77

    goto :goto_89

    :cond_77
    if-nez v14, :cond_7c

    if-eq v9, v13, :cond_7c

    goto :goto_a2

    :cond_7c
    mul-int/lit8 v14, v14, 0xa

    add-int/2addr v14, v15

    sub-int/2addr v14, v4

    if-le v14, v12, :cond_83

    goto :goto_a2

    :cond_83
    add-int/lit8 v13, v13, 0x1

    const/16 v2, 0x10

    const/4 v4, 0x0

    goto :goto_60

    :cond_89
    :goto_89
    sub-int v2, v13, v9

    if-nez v2, :cond_8e

    goto :goto_a2

    :cond_8e
    add-int/lit8 v2, v11, 0x1

    int-to-byte v4, v14

    aput-byte v4, v3, v11

    move v11, v2

    move v9, v13

    const/16 v2, 0x10

    const/4 v4, 0x0

    goto :goto_4c

    :cond_99
    add-int/lit8 v0, v7, 0x2

    if-ne v11, v0, :cond_a2

    add-int/lit8 v7, v7, 0x2

    const/16 v0, 0x10

    goto :goto_d6

    :cond_a2
    :goto_a2
    return-object v10

    :goto_a3
    move v6, v9

    const/4 v2, 0x0

    :goto_a5
    if-ge v6, v1, :cond_b8

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, LF2/b;->r(C)I

    move-result v4

    if-ne v4, v5, :cond_b2

    goto :goto_b8

    :cond_b2
    shl-int/lit8 v2, v2, 0x4

    add-int/2addr v2, v4

    add-int/lit8 v6, v6, 0x1

    goto :goto_a5

    :cond_b8
    :goto_b8
    sub-int v4, v6, v9

    if-eqz v4, :cond_d4

    const/4 v11, 0x4

    if-le v4, v11, :cond_c0

    goto :goto_d4

    :cond_c0
    add-int/lit8 v4, v7, 0x1

    ushr-int/lit8 v10, v2, 0x8

    and-int/2addr v10, v12

    int-to-byte v10, v10

    aput-byte v10, v3, v7

    add-int/lit8 v7, v7, 0x2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v3, v4

    const/16 v2, 0x10

    const/4 v4, 0x0

    goto/16 :goto_f

    :cond_d4
    :goto_d4
    return-object v10

    :cond_d5
    move v0, v2

    :goto_d6
    if-eq v7, v0, :cond_e9

    if-ne v8, v5, :cond_db

    return-object v10

    :cond_db
    sub-int v1, v7, v8

    rsub-int/lit8 v2, v1, 0x10

    invoke-static {v3, v8, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    rsub-int/lit8 v2, v7, 0x10

    add-int/2addr v2, v8

    const/4 v0, 0x0

    invoke-static {v3, v8, v2, v0}, Ljava/util/Arrays;->fill([BIIB)V

    :cond_e9
    invoke-static {v3}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public static final w(Li0/a;)V
    .registers 5

    const-string v0, "db"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lf2/c;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lf2/c;-><init>(I)V

    const-string v1, "SELECT name FROM sqlite_master WHERE type = \'trigger\'"

    invoke-interface {p0, v1}, Li0/a;->z(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    :goto_12
    :try_start_12
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_23

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lf2/c;->add(Ljava/lang/Object;)Z
    :try_end_20
    .catchall {:try_start_12 .. :try_end_20} :catchall_21

    goto :goto_12

    :catchall_21
    move-exception p0

    goto :goto_56

    :cond_23
    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    invoke-static {v0}, LM2/d;->e(Lf2/c;)Lf2/c;

    move-result-object v0

    invoke-virtual {v0, v3}, Lf2/c;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    :cond_2f
    :goto_2f
    move-object v1, v0

    check-cast v1, Lf2/a;

    invoke-virtual {v1}, Lf2/a;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_55

    invoke-virtual {v1}, Lf2/a;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "triggerName"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/k;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "room_fts_content_sync_"

    invoke-static {v1, v2, v3}, Lx2/m;->h0(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2f

    const-string v2, "DROP TRIGGER IF EXISTS "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Li0/a;->j(Ljava/lang/String;)V

    goto :goto_2f

    :cond_55
    return-void

    :goto_56
    :try_start_56
    throw p0
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_57

    :catchall_57
    move-exception v0

    invoke-static {v1, p0}, Landroid/support/v4/media/session/a;->m(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static w0(Landroid/graphics/Outline;Landroid/graphics/Path;)V
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_a

    invoke-static {p0, p1}, LM/E0;->b(Landroid/graphics/Outline;Landroid/graphics/Path;)V

    goto :goto_1b

    :cond_a
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_12

    :try_start_e
    invoke-virtual {p0, p1}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V
    :try_end_11
    .catch Ljava/lang/IllegalArgumentException; {:try_start_e .. :try_end_11} :catch_1b

    goto :goto_1b

    :cond_12
    invoke-virtual {p1}, Landroid/graphics/Path;->isConvex()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0, p1}, Landroid/graphics/Outline;->setConvexPath(Landroid/graphics/Path;)V

    :catch_1b
    :cond_1b
    :goto_1b
    return-void
.end method

.method public static x(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .registers 9

    const-string v0, "FeedbackApi"

    const-string v1, "\u65e0\u6cd5\u6253\u5f00\u56fe\u7247URI: "

    const/4 v2, 0x0

    :try_start_5
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_d} :catch_24

    if-nez p0, :cond_29

    :try_start_f
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1e
    .catchall {:try_start_f .. :try_end_1e} :catchall_27

    if-eqz p0, :cond_26

    :try_start_20
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_23} :catch_24

    goto :goto_26

    :catch_24
    move-exception p0

    goto :goto_82

    :cond_26
    :goto_26
    return-object v2

    :catchall_27
    move-exception p1

    goto :goto_77

    :cond_29
    :try_start_29
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x4000

    new-array v3, v1, [B

    :goto_32
    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_3e

    invoke-virtual {p1, v3, v4, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_32

    :cond_3e
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    array-length v1, p1

    int-to-long v3, v1

    const-wide/32 v5, 0x500000

    cmp-long v1, v3, v5

    if-lez v1, :cond_6b

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u56fe\u7247\u6587\u4ef6\u8fc7\u5927: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " bytes"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_67
    .catchall {:try_start_29 .. :try_end_67} :catchall_27

    :try_start_67
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_67 .. :try_end_6a} :catch_24

    return-object v2

    :cond_6b
    const/4 v1, 0x2

    :try_start_6c
    invoke-static {p1, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I
    :try_end_73
    .catchall {:try_start_6c .. :try_end_73} :catchall_27

    :try_start_73
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_76} :catch_24

    return-object p1

    :goto_77
    if-eqz p0, :cond_81

    :try_start_79
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_7c
    .catchall {:try_start_79 .. :try_end_7c} :catchall_7d

    goto :goto_81

    :catchall_7d
    move-exception p0

    :try_start_7e
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_81
    :goto_81
    throw p1
    :try_end_82
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_82} :catch_24

    :goto_82
    const-string p1, "\u56fe\u7247\u7f16\u7801\u5931\u8d25"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v2
.end method

.method public static x0(Landroid/view/View;Lf1/g;)V
    .registers 5

    iget-object v0, p1, Lf1/g;->b:Lf1/f;

    iget-object v0, v0, Lf1/f;->b:LW0/a;

    if-eqz v0, :cond_2f

    iget-boolean v0, v0, LW0/a;->a:Z

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    const/4 v0, 0x0

    :goto_f
    instance-of v1, p0, Landroid/view/View;

    if-eqz v1, :cond_22

    move-object v1, p0

    check-cast v1, Landroid/view/View;

    sget-object v2, LM/W;->a:Ljava/util/WeakHashMap;

    invoke-static {v1}, LM/J;->i(Landroid/view/View;)F

    move-result v1

    add-float/2addr v0, v1

    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    goto :goto_f

    :cond_22
    iget-object p0, p1, Lf1/g;->b:Lf1/f;

    iget v1, p0, Lf1/f;->l:F

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_2f

    iput v0, p0, Lf1/f;->l:F

    invoke-virtual {p1}, Lf1/g;->r()V

    :cond_2f
    return-void
.end method

.method public static y(Ljava/lang/String;)[B
    .registers 6

    const-string v0, "UTF-8"

    const/4 v1, 0x0

    if-eqz p0, :cond_3b

    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_c

    goto :goto_3b

    :cond_c
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "Fx4k6AWivOsLE4NI"

    invoke-virtual {v3, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    const-string v4, "AES"

    invoke-direct {v2, v3, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    const-string v3, "AES/ECB/NoPadding"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    array-length v0, p0

    rem-int/lit8 v0, v0, 0x10

    if-nez v0, :cond_2e

    move v0, v1

    goto :goto_30

    :cond_2e
    rsub-int/lit8 v0, v0, 0x10

    :goto_30
    array-length v2, p0

    add-int/2addr v2, v0

    invoke-static {p0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    invoke-virtual {v3, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0

    return-object p0

    :cond_3b
    :goto_3b
    new-array p0, v1, [B
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_3d} :catch_3e

    return-object p0

    :catch_3e
    new-array p0, v1, [B

    return-object p0
.end method

.method public static final z([Ljava/lang/Enum;)Lk2/b;
    .registers 2

    const-string v0, "entries"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lk2/b;

    invoke-direct {v0, p0}, Lk2/b;-><init>([Ljava/lang/Enum;)V

    return-object v0
.end method


# virtual methods
.method public abstract A0(Ljava/lang/String;)V
.end method

.method public B(I[LJ/g;)LJ/g;
    .registers 13

    new-instance v0, LK1/d;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, LK1/d;-><init>(I)V

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_d

    const/16 v0, 0x190

    goto :goto_f

    :cond_d
    const/16 v0, 0x2bc

    :goto_f
    and-int/lit8 p1, p1, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_17

    move p1, v1

    goto :goto_18

    :cond_17
    move p1, v2

    :goto_18
    array-length v3, p2

    const/4 v4, 0x0

    const v5, 0x7fffffff

    move v6, v2

    :goto_1e
    if-ge v6, v3, :cond_3c

    aget-object v7, p2, v6

    iget v8, v7, LJ/g;->c:I

    sub-int/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    mul-int/lit8 v8, v8, 0x2

    iget-boolean v9, v7, LJ/g;->d:Z

    if-ne v9, p1, :cond_31

    move v9, v2

    goto :goto_32

    :cond_31
    move v9, v1

    :goto_32
    add-int/2addr v8, v9

    if-eqz v4, :cond_37

    if-le v5, v8, :cond_39

    :cond_37
    move-object v4, v7

    move v5, v8

    :cond_39
    add-int/lit8 v6, v6, 0x1

    goto :goto_1e

    :cond_3c
    return-object v4
.end method

.method public abstract B0(Ljava/lang/CharSequence;)V
.end method

.method public E0(LC0/t;)Lh/a;
    .registers 2

    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract F()I
.end method

.method public abstract L()Landroid/content/Context;
.end method

.method public N()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public abstract P()Z
.end method

.method public abstract V()V
.end method

.method public W()V
    .registers 1

    return-void
.end method

.method public abstract X(ILandroid/view/KeyEvent;)Z
.end method

.method public Y(Landroid/view/KeyEvent;)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public a0()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public b(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public c()V
    .registers 1

    return-void
.end method

.method public abstract e(Lp/g;Lp/c;Lp/c;)Z
.end method

.method public abstract f(Lp/g;Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public abstract f0(Lp/f;Lp/f;)V
.end method

.method public abstract g(Lp/g;Lp/f;Lp/f;)Z
.end method

.method public abstract g0(Lp/f;Ljava/lang/Thread;)V
.end method

.method public k()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public abstract l()Z
.end method

.method public abstract p(Landroid/content/Context;LC/g;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;
.end method

.method public abstract q(Landroid/content/Context;[LJ/g;I)Landroid/graphics/Typeface;
.end method

.method public abstract q0(Landroid/view/View;Lf/a;)V
.end method

.method public r(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .registers 6

    invoke-static {p1}, LM2/d;->B(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    const/4 p4, 0x0

    if-nez p1, :cond_8

    return-object p4

    :cond_8
    :try_start_8
    invoke-static {p1, p2, p3}, LM2/d;->j(Ljava/io/File;Landroid/content/res/Resources;I)Z

    move-result p2
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_c} :catch_23
    .catchall {:try_start_8 .. :try_end_c} :catchall_1e

    if-nez p2, :cond_12

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p4

    :cond_12
    :try_start_12
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p2
    :try_end_1a
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_1a} :catch_23
    .catchall {:try_start_12 .. :try_end_1a} :catchall_1e

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p2

    :catchall_1e
    move-exception p2

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    throw p2

    :catch_23
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-object p4
.end method

.method public abstract r0(Z)V
.end method

.method public abstract s0(Z)V
.end method

.method public abstract t0()V
.end method

.method public abstract u0()V
.end method

.method public abstract v(Z)V
.end method

.method public abstract v0()V
.end method

.method public abstract y0(Z)V
.end method

.method public abstract z0()V
.end method

