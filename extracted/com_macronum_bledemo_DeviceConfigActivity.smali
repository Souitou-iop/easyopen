.class public Lcom/macronum/bledemo/DeviceConfigActivity;
.super Lf/g;
.source "SourceFile"


# static fields
.field public static final synthetic d0:I


# instance fields
.field public A:Landroid/widget/EditText;

.field public B:Landroid/widget/EditText;

.field public C:Landroid/widget/EditText;

.field public D:Landroid/widget/EditText;

.field public E:Landroid/widget/TextView;

.field public F:Landroid/widget/Switch;

.field public G:Landroid/widget/Switch;

.field public H:Landroid/widget/LinearLayout;

.field public I:Landroid/widget/TextView;

.field public J:Landroid/widget/TextView;

.field public K:Landroid/widget/TextView;

.field public L:Landroid/widget/TextView;

.field public M:Landroid/widget/Button;

.field public N:Landroid/widget/Button;

.field public O:Landroid/widget/Button;

.field public P:Landroid/widget/Button;

.field public Q:Landroid/widget/Button;

.field public R:Landroid/widget/Button;

.field public S:Landroid/widget/Button;

.field public T:Landroid/widget/Button;

.field public U:Landroid/widget/Button;

.field public V:LD1/f;

.field public W:Ly1/D;

.field public X:Ly1/A;

.field public Y:Lcom/macronum/bledemo/model/BluetoothDevice;

.field public Z:Z

.field public a0:Z

.field public b0:Lc2/d;

.field public c0:Ljava/lang/Integer;

.field public x:Landroid/widget/EditText;

.field public y:Landroid/widget/EditText;

.field public z:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lf/g;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->a0:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->c0:Ljava/lang/Integer;

    return-void
.end method

.method public static A(I)I
    .registers 2

    if-gez p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    const/16 v0, 0x2710

    if-le p0, v0, :cond_9

    return v0

    :cond_9
    return p0
.end method

.method public static E(Landroid/widget/Button;Ljava/lang/Runnable;)V
    .registers 6

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, LB0/a;

    const/16 v2, 0xe

    const/4 v3, 0x0

    invoke-direct {v1, p1, v0, v2, v3}, LB0/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    new-instance v2, LS1/G0;

    const/4 v3, 0x1

    invoke-direct {v2, p1, v3}, LS1/G0;-><init>(Ljava/lang/Runnable;I)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Ly1/e;

    invoke-direct {v2, p1, v0, v1}, Ly1/e;-><init>(Ljava/lang/Runnable;Landroid/os/Handler;LB0/a;)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance p1, Ly1/u;

    invoke-direct {p1, v0, v1}, Ly1/u;-><init>(Landroid/os/Handler;LB0/a;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public static y(Lcom/macronum/bledemo/DeviceConfigActivity;Ljava/lang/String;Ljava/lang/String;IIII)V
    .registers 23

    move-object/from16 v1, p0

    move-object/from16 v4, p1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_198

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v0

    if-nez v0, :cond_22

    goto/16 :goto_198

    :cond_22
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v2

    const-string v3, "DeviceConfigActivity"

    if-nez v2, :cond_31

    const-string v0, "API\u5ba2\u6237\u7aef\u672a\u521d\u59cb\u5316\uff0c\u8df3\u8fc7\u5bc6\u7801\u540c\u6b65\u5230\u670d\u52a1\u5668"

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_198

    :cond_31
    const/4 v0, 0x0

    if-eqz v4, :cond_181

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x6

    if-ne v5, v6, :cond_181

    const-string v5, "^[0-9]{6}$"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_45

    goto/16 :goto_181

    :cond_45
    iget-object v5, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v5}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, LB1/e;->i()LB1/e;

    move-result-object v6

    const-string v7, "syncPasswordToServer"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, LB1/e;->g(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-wide/16 v10, 0xbb8

    invoke-virtual {v6, v10, v11, v7}, LB1/e;->b(JLjava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_79

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "syncPasswordToServer\u8bf7\u6c42\u88ab\u9632\u6296\uff0c\u8df3\u8fc7\u672c\u6b21\u8c03\u7528: lockMac="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\uff08\u53ef\u80fd\u540c\u65f6\u6709\u591a\u4e2a\u540c\u6b65\u8bf7\u6c42\uff09"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_198

    :cond_79
    invoke-virtual {v6, v7}, LB1/e;->q(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_86

    const-string v0, "syncPasswordToServer\u8bf7\u6c42\u5df2\u6709\u76f8\u540c\u8bf7\u6c42\u5728\u8fdb\u884c\uff0c\u8df3\u8fc7\u672c\u6b21\u8c03\u7528: lockMac="

    invoke-static {v0, v5, v3}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_198

    :cond_86
    const/4 v8, 0x0

    :try_start_87
    const-string v10, "MD5"

    invoke-static {v10}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v10

    const-string v11, "UTF-8"

    invoke-virtual {v4, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    array-length v12, v10

    :goto_9d
    if-ge v0, v12, :cond_b7

    aget-byte v13, v10, v0

    const-string v14, "%02x"

    invoke-static {v13}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v13

    invoke-static {v14, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_9d

    :catch_b5
    move-exception v0

    goto :goto_ca

    :cond_b7
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v10

    const/16 v11, 0x18

    if-lt v10, v11, :cond_cf

    const/16 v10, 0x8

    invoke-virtual {v0, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_87 .. :try_end_c9} :catch_b5

    goto :goto_cf

    :goto_ca
    const-string v10, "\u8ba1\u7b97\u5bc6\u7801MD5\u5931\u8d25"

    invoke-static {v3, v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_cf
    :goto_cf
    if-eqz p2, :cond_d4

    move-object/from16 v10, p2

    goto :goto_e7

    :cond_d4
    iget-object v0, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_e4

    iget-object v0, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_e2
    move-object v10, v0

    goto :goto_e7

    :cond_e4
    const-string v0, ""

    goto :goto_e2

    :goto_e7
    if-ltz p6, :cond_ec

    move/from16 v11, p6

    goto :goto_f3

    :cond_ec
    iget-object v0, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAttribute()I

    move-result v0

    move v11, v0

    :goto_f3
    if-lez p3, :cond_f8

    move/from16 v12, p3

    goto :goto_ff

    :cond_f8
    iget-object v0, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOpenTime()I

    move-result v0

    move v12, v0

    :goto_ff
    if-lez p4, :cond_104

    move/from16 v13, p4

    goto :goto_10b

    :cond_104
    iget-object v0, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getWaitTime()I

    move-result v0

    move v13, v0

    :goto_10b
    if-lez p5, :cond_110

    move/from16 v14, p5

    goto :goto_117

    :cond_110
    iget-object v0, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getCloseTime()I

    move-result v0

    move v14, v0

    :goto_117
    iget-object v15, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->c0:Ljava/lang/Integer;

    if-nez v15, :cond_160

    :try_start_11b
    invoke-static {}, LQ1/a;->c()LQ1/a;

    move-result-object v0
    :try_end_11f
    .catch Ljava/lang/Exception; {:try_start_11b .. :try_end_11f} :catch_141

    move-object/from16 p2, v15

    :try_start_121
    iget-object v15, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v15}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v15}, LQ1/a;->b(Ljava/lang/String;)Lcom/macronum/bledemo/model/DeviceState;

    move-result-object v0

    if-eqz v0, :cond_15d

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/DeviceState;->getBattery()I

    move-result v0

    const/4 v15, 0x1

    if-lt v0, v15, :cond_15d

    const/4 v15, 0x5

    if-gt v0, v15, :cond_15d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15
    :try_end_13b
    .catch Ljava/lang/Exception; {:try_start_121 .. :try_end_13b} :catch_145

    :try_start_13b
    iget-object v0, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_140
    .catch Ljava/lang/Exception; {:try_start_13b .. :try_end_140} :catch_141

    goto :goto_162

    :catch_141
    move-exception v0

    move-object/from16 p2, v15

    goto :goto_146

    :catch_145
    move-exception v0

    :goto_146
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v4, "\u83b7\u53d6\u7535\u91cf\u4fe1\u606f\u5931\u8d25: "

    invoke-direct {v15, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v4}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_15d
    move-object/from16 v15, p2

    goto :goto_162

    :cond_160
    move-object/from16 p2, v15

    :goto_162
    new-instance v0, LB1/A;

    invoke-direct {v0, v2}, LB1/A;-><init>(LB1/c;)V

    iget-object v1, v1, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    new-instance v4, LN1/a;

    invoke-direct {v4, v5, v8, v6, v7}, LN1/a;-><init>(Ljava/lang/String;Ljava/lang/String;LB1/e;Ljava/lang/String;)V

    move-object v1, v0

    move-object v3, v10

    move-object v0, v4

    move-object/from16 v4, p1

    move v5, v11

    move v6, v12

    move v7, v13

    move v8, v14

    move-object v10, v15

    move-object v11, v0

    invoke-virtual/range {v1 .. v11}, LB1/A;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;Ljava/lang/Integer;LB1/z;)V

    goto :goto_198

    :cond_181
    :goto_181
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u540c\u6b65\u5bc6\u7801\u5230\u670d\u52a1\u5668\u5931\u8d25: \u5bc6\u7801\u683c\u5f0f\u9519\u8bef, length="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_18e

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v0

    :cond_18e
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_198
    :goto_198
    return-void
.end method


# virtual methods
.method public final B()V
    .registers 8

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->y:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->z:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->A:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->B:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->C:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->D:Landroid/widget/EditText;

    filled-new-array/range {v1 .. v6}, [Landroid/widget/EditText;

    move-result-object v1

    iget-boolean v2, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    if-eqz v2, :cond_52

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v2

    iget-object v2, v2, LZ1/a;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4e

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v3

    invoke-virtual {v3}, LZ1/a;->i()Z

    move-result v3

    if-nez v3, :cond_36

    goto :goto_4e

    :cond_36
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v3

    if-nez v3, :cond_40

    invoke-virtual {p0, v1}, Lcom/macronum/bledemo/DeviceConfigActivity;->C([Landroid/widget/EditText;)V

    goto :goto_9b

    :cond_40
    new-instance v4, LB1/A;

    invoke-direct {v4, v3}, LB1/A;-><init>(LB1/c;)V

    new-instance v3, LK1/b;

    invoke-direct {v3, p0, v0, v1}, LK1/b;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;Ljava/lang/String;[Landroid/widget/EditText;)V

    invoke-virtual {v4, v0, v2, v3}, LB1/A;->b(Ljava/lang/String;Ljava/lang/String;LB1/z;)V

    goto :goto_9b

    :cond_4e
    :goto_4e
    invoke-virtual {p0, v1}, Lcom/macronum/bledemo/DeviceConfigActivity;->C([Landroid/widget/EditText;)V

    goto :goto_9b

    :cond_52
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x6

    if-eqz v2, :cond_73

    move v0, v4

    :goto_65
    if-ge v0, v5, :cond_72

    aget-object v2, v1, v0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_65

    :cond_72
    return-void

    :cond_73
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v2

    if-nez v2, :cond_88

    move v0, v4

    :goto_7a
    if-ge v0, v5, :cond_87

    aget-object v2, v1, v0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7a

    :cond_87
    return-void

    :cond_88
    new-instance v3, LB1/l;

    invoke-direct {v3, v2}, LB1/l;-><init>(LB1/c;)V

    iget-object v2, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ly1/y;

    invoke-direct {v4, p0, v0, v1}, Ly1/y;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;Ljava/lang/String;[Landroid/widget/EditText;)V

    invoke-virtual {v3, v2, v0, v4}, LB1/l;->a(Ljava/lang/String;Ljava/lang/String;LB1/C;)V

    :goto_9b
    return-void
.end method

.method public final C([Landroid/widget/EditText;)V
    .registers 7

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    const/4 v1, 0x0

    if-eqz v0, :cond_5c

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_5c

    :cond_10
    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPassword()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_27

    const-string v2, "[0-9a-fA-F]{32}"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_27

    goto :goto_58

    :cond_27
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x6

    if-ne v2, v3, :cond_58

    :goto_2e
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v1, v2, :cond_58

    array-length v2, p1

    if-ge v1, v2, :cond_55

    :try_start_3b
    aget-object v2, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    aget-object v2, p1, v1

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setSelection(I)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_55} :catch_55

    :catch_55
    :cond_55
    add-int/lit8 v1, v1, 0x1

    goto :goto_2e

    :cond_58
    :goto_58
    invoke-virtual {p0}, Lcom/macronum/bledemo/DeviceConfigActivity;->z()V

    return-void

    :cond_5c
    :goto_5c
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "\u3010\u5f02\u5e38\u3011Owner\u95e8\u9501\u5bc6\u7801\u4e3a\u7a7a: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v2, :cond_6c

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    goto :goto_6e

    :cond_6c
    const-string v2, "null"

    :goto_6e
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\uff0c\u8fd9\u4e0d\u5e94\u8be5\u53d1\u751f\u3002\u53ef\u80fd\u662f\u6570\u636e\u5e93\u8bfb\u53d6\u5f02\u5e38\u6216\u5bc6\u7801\u672a\u6b63\u786e\u4fdd\u5b58\u3002"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "DeviceConfigActivity"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    array-length v0, p1

    :goto_80
    if-ge v1, v0, :cond_8c

    aget-object v2, p1, v1

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_80

    :cond_8c
    invoke-virtual {p0}, Lcom/macronum/bledemo/DeviceConfigActivity;->z()V

    return-void
.end method

.method public final D(Z)V
    .registers 3

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->S:Landroid/widget/Button;

    if-eqz v0, :cond_13

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->S:Landroid/widget/Button;

    if-eqz p1, :cond_e

    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_10

    :cond_e
    const/high16 p1, 0x3f000000    # 0.5f

    :goto_10
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    :cond_13
    return-void
.end method

.method public final F(Ljava/lang/String;Ljava/lang/String;IIII)V
    .registers 23

    move-object/from16 v11, p0

    const-string v0, "\u6b63\u5728\u901a\u8fc7\u672c\u5730\u84dd\u7259\u4fee\u6539\u5bc6\u7801..."

    const/4 v12, 0x0

    invoke-static {v11, v0, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    new-instance v0, LD1/f;

    invoke-direct {v0, v11}, LD1/f;-><init>(Landroid/content/Context;)V

    iput-object v0, v11, Lcom/macronum/bledemo/DeviceConfigActivity;->V:LD1/f;

    new-instance v1, Ly1/D;

    invoke-direct {v1, v0}, Ly1/D;-><init>(LD1/f;)V

    iput-object v1, v11, Lcom/macronum/bledemo/DeviceConfigActivity;->W:Ly1/D;

    const/4 v0, 0x1

    new-array v2, v0, [Z

    aput-boolean v12, v2, v12

    new-instance v13, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v13, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    filled-new-array/range {p1 .. p1}, [Ljava/lang/String;

    move-result-object v5

    filled-new-array/range {p2 .. p2}, [Ljava/lang/String;

    move-result-object v6

    filled-new-array/range {p3 .. p3}, [I

    move-result-object v7

    filled-new-array/range {p4 .. p4}, [I

    move-result-object v8

    filled-new-array/range {p5 .. p5}, [I

    move-result-object v9

    filled-new-array/range {p6 .. p6}, [I

    move-result-object v10

    new-array v14, v0, [Ljava/lang/Runnable;

    const/4 v1, 0x0

    aput-object v1, v14, v12

    new-array v15, v0, [LD1/e;

    aput-object v1, v15, v12

    new-instance v0, LA1/d;

    const/16 v1, 0x14

    invoke-direct {v0, v11, v2, v15, v1}, LA1/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    aput-object v0, v14, v12

    new-instance v4, LW1/a;

    move-object v0, v4

    move-object/from16 v1, p0

    move-object v3, v14

    move-object v11, v4

    move-object v4, v13

    invoke-direct/range {v0 .. v10}, LW1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;[Z[Ljava/lang/Runnable;Landroid/os/Handler;[Ljava/lang/String;[Ljava/lang/String;[I[I[I[I)V

    aput-object v11, v15, v12

    aget-object v0, v14, v12

    const-wide/16 v1, 0x2710

    invoke-virtual {v13, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-object/from16 v0, p0

    move-object v1, v11

    iget-object v2, v0, Lcom/macronum/bledemo/DeviceConfigActivity;->V:LD1/f;

    invoke-virtual {v2, v1}, LD1/f;->a(LD1/e;)V

    iget-object v1, v0, Lcom/macronum/bledemo/DeviceConfigActivity;->W:Ly1/D;

    iget-object v2, v0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v1, v2}, Ly1/D;->b(Lcom/macronum/bledemo/model/BluetoothDevice;)V

    return-void
.end method

.method public final G(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIII)V
    .registers 24

    move-object/from16 v12, p0

    const-string v1, "DeviceConfigActivity"

    iget-object v0, v12, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v2

    iget-object v2, v2, LZ1/a;->d:Ljava/lang/Object;

    move-object v13, v2

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_9e

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v2

    invoke-virtual {v2}, LZ1/a;->i()Z

    move-result v2

    if-nez v2, :cond_26

    goto/16 :goto_9e

    :cond_26
    :try_start_26
    const-string v2, "connectivity"

    invoke-virtual {v12, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    if-nez v2, :cond_32

    goto/16 :goto_94

    :cond_32
    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v4

    if-nez v4, :cond_39

    goto :goto_94

    :cond_39
    invoke-virtual {v2, v4}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v2

    if-nez v2, :cond_40

    goto :goto_94

    :cond_40
    const/16 v4, 0xc

    invoke-virtual {v2, v4}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v4

    const/16 v5, 0x10

    invoke-virtual {v2, v5}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v2
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_4c} :catch_8e

    if-eqz v4, :cond_94

    if-eqz v2, :cond_94

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v2

    if-nez v2, :cond_6d

    const-string v0, "API\u5ba2\u6237\u7aef\u672a\u521d\u59cb\u5316\uff0c\u964d\u7ea7\u5230\u84dd\u7259\u4fee\u6539\u5bc6\u7801"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-virtual/range {v1 .. v7}, Lcom/macronum/bledemo/DeviceConfigActivity;->F(Ljava/lang/String;Ljava/lang/String;IIII)V

    return-void

    :cond_6d
    new-instance v14, LB1/A;

    invoke-direct {v14, v2}, LB1/A;-><init>(LB1/c;)V

    new-instance v15, Ly1/l;

    move-object v1, v15

    move-object/from16 v2, p0

    move-object v3, v0

    move-object v4, v13

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, p6

    move/from16 v11, p7

    invoke-direct/range {v1 .. v11}, Ly1/l;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIII)V

    invoke-virtual {v14, v0, v13, v15}, LB1/A;->b(Ljava/lang/String;Ljava/lang/String;LB1/z;)V

    return-void

    :catch_8e
    move-exception v0

    const-string v2, "\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_94
    :goto_94
    const-string v0, "\u4fee\u6539\u5bc6\u7801\u9700\u8981\u7f51\u7edc\u8fde\u63a5\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8bbe\u7f6e"

    invoke-static {v12, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_9e
    :goto_9e
    const-string v0, "\u8bf7\u5148\u767b\u5f55\u540e\u518d\u4fee\u6539\u5bc6\u7801"

    invoke-static {v12, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/macronum/bledemo/ui/LoginActivity;

    invoke-direct {v0, v12, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v12, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final H(Ljava/lang/String;IIII)V
    .registers 24

    move-object/from16 v7, p0

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_69

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v0

    if-nez v0, :cond_1f

    goto :goto_69

    :cond_1f
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v0

    if-nez v0, :cond_32

    const-string v0, "\u7f51\u7edc\u8fde\u63a5\u5f02\u5e38\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"

    invoke-static {v7, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {v7, v1}, Lcom/macronum/bledemo/DeviceConfigActivity;->D(Z)V

    return-void

    :cond_32
    new-instance v9, LB1/A;

    invoke-direct {v9, v0}, LB1/A;-><init>(LB1/c;)V

    iget-object v0, v7, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    new-instance v17, Le0/i0;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    invoke-direct/range {v0 .. v6}, Le0/i0;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;Ljava/lang/String;IIII)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, LB1/v;

    move-object v8, v1

    move-object/from16 v11, p1

    move/from16 v12, p5

    move/from16 v13, p2

    move/from16 v14, p3

    move/from16 v15, p4

    invoke-direct/range {v8 .. v17}, LB1/v;-><init>(LB1/A;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;Le0/i0;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void

    :cond_69
    :goto_69
    const-string v0, "\u8bf7\u5148\u767b\u5f55\u540e\u518d\u4fee\u6539\u8bbe\u7f6e"

    invoke-static {v7, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {v7, v1}, Lcom/macronum/bledemo/DeviceConfigActivity;->D(Z)V

    return-void
.end method

.method public final I()V
    .registers 16

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-boolean v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    const v1, 0x7f0802b3

    const v2, 0x7f0802a0

    const-string v3, "DeviceConfigActivity"

    const v4, 0x7f0801cf

    const/4 v5, 0x6

    const/16 v6, 0x8

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v0, :cond_c6

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->x:Landroid/widget/EditText;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->y:Landroid/widget/EditText;

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->z:Landroid/widget/EditText;

    iget-object v11, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->A:Landroid/widget/EditText;

    iget-object v12, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->B:Landroid/widget/EditText;

    iget-object v13, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->C:Landroid/widget/EditText;

    iget-object v14, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->D:Landroid/widget/EditText;

    filled-new-array/range {v9 .. v14}, [Landroid/widget/EditText;

    move-result-object v0

    move v9, v8

    :goto_2f
    if-ge v9, v5, :cond_42

    aget-object v10, v0, v9

    invoke-virtual {v10, v8}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v10, v8}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v10, v8}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {v10, v6}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_2f

    :cond_42
    invoke-virtual {p0, v4}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_53

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_53

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_53
    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->F:Landroid/widget/Switch;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->G:Landroid/widget/Switch;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->G:Landroid/widget/Switch;

    invoke-virtual {v0, v7}, Landroid/widget/Switch;->setChecked(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->H:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->M:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->N:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->O:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->P:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Q:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->R:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setEnabled(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "\u3010UI\u66f4\u65b0\u3011\u975eowner\uff0c\u9690\u85cf\u786e\u8ba4\u6309\u94ae\uff01isOwnerFromServer="

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->S:Landroid/widget/Button;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->U:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->U:Landroid/widget/Button;

    const-string v3, "\u5220\u9664\u6211\u7684\u6743\u9650"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_b9

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    const-string v2, "\u60a8\u4e0d\u662f\u95e8\u9501\u7ba1\u7406\u5458\uff0c\u5982\u679c\u9700\u8981\u4fee\u6539\u4fe1\u606f\uff0c\u8bf7\u8054\u7cfb\u95e8\u9501\u7ba1\u7406\u5458"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_b9
    invoke-virtual {p0, v1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_165

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_165

    :cond_c6
    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->x:Landroid/widget/EditText;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->y:Landroid/widget/EditText;

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->z:Landroid/widget/EditText;

    iget-object v11, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->A:Landroid/widget/EditText;

    iget-object v12, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->B:Landroid/widget/EditText;

    iget-object v13, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->C:Landroid/widget/EditText;

    iget-object v14, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->D:Landroid/widget/EditText;

    filled-new-array/range {v9 .. v14}, [Landroid/widget/EditText;

    move-result-object v0

    move v9, v8

    :goto_dc
    if-ge v9, v5, :cond_ef

    aget-object v10, v0, v9

    invoke-virtual {v10, v7}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v10, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v10, v7}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v10, v7}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_dc

    :cond_ef
    invoke-virtual {p0, v4}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_103

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    if-eqz v4, :cond_100

    invoke-virtual {v4, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_100
    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_103
    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->F:Landroid/widget/Switch;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->G:Landroid/widget/Switch;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->M:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->N:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->O:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->P:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Q:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->R:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/view/View;->setEnabled(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "\u3010UI\u66f4\u65b0\u3011\u662fowner\uff0c\u663e\u793a\u786e\u8ba4\u6309\u94ae\uff01isOwnerFromServer="

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->S:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->U:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->U:Landroid/widget/Button;

    const-string v3, "\u5220\u9664\u95e8\u9501"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_15a

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_15a
    invoke-virtual {p0, v1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_165

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_165
    :goto_165
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 15

    const/4 v0, 0x2

    const/4 v1, 0x5

    const/4 v2, 0x3

    const/4 v3, 0x0

    const-string v4, "DeviceConfigActivity"

    const-string v5, "\u3010\u7535\u91cf\u3011\u7535\u91cf\u503c\u65e0\u6548: "

    invoke-super {p0, p1}, Lf/g;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001e

    invoke-virtual {p0, p1}, Lf/g;->setContentView(I)V

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object p1

    const/4 v6, 0x1

    if-eqz p1, :cond_25

    invoke-virtual {p1, v6}, LC0/f;->s0(Z)V

    const v7, 0x7f1000a0

    invoke-virtual {p0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, LC0/f;->A0(Ljava/lang/String;)V

    :cond_25
    const p1, 0x7f080106

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->x:Landroid/widget/EditText;

    const p1, 0x7f080107

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->y:Landroid/widget/EditText;

    const p1, 0x7f080108

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->z:Landroid/widget/EditText;

    const p1, 0x7f080109

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->A:Landroid/widget/EditText;

    const p1, 0x7f08010a

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->B:Landroid/widget/EditText;

    const p1, 0x7f08010b

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->C:Landroid/widget/EditText;

    const p1, 0x7f08010c

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->D:Landroid/widget/EditText;

    const p1, 0x7f0802c3

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->E:Landroid/widget/TextView;

    const p1, 0x7f08024b

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->F:Landroid/widget/Switch;

    const p1, 0x7f08024a

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->G:Landroid/widget/Switch;

    const p1, 0x7f08015a

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->H:Landroid/widget/LinearLayout;

    const p1, 0x7f0802b8

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->I:Landroid/widget/TextView;

    const p1, 0x7f0802b9

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->J:Landroid/widget/TextView;

    const p1, 0x7f0802bb

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->K:Landroid/widget/TextView;

    const p1, 0x7f0802ba

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->L:Landroid/widget/TextView;

    const p1, 0x7f080086

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->M:Landroid/widget/Button;

    const p1, 0x7f080087

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->N:Landroid/widget/Button;

    const p1, 0x7f08008a

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->O:Landroid/widget/Button;

    const p1, 0x7f08008b

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->P:Landroid/widget/Button;

    const p1, 0x7f080088

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Q:Landroid/widget/Button;

    const p1, 0x7f080089

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->R:Landroid/widget/Button;

    const p1, 0x7f080084

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->S:Landroid/widget/Button;

    const p1, 0x7f080083

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->T:Landroid/widget/Button;

    const p1, 0x7f080085

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->U:Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ly1/A;->h(Landroid/content/Context;)Ly1/A;

    move-result-object p1

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->X:Ly1/A;

    const/4 p1, 0x0

    :try_start_138
    new-instance v7, Lb2/t;

    invoke-direct {v7, p0}, Lb2/t;-><init>(Lf/g;)V

    const-class v8, Lc2/d;

    invoke-virtual {v7, v8}, Lb2/t;->p(Ljava/lang/Class;)Landroidx/lifecycle/S;

    move-result-object v7

    check-cast v7, Lc2/d;

    iput-object v7, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->b0:Lc2/d;
    :try_end_147
    .catch Ljava/lang/Exception; {:try_start_138 .. :try_end_147} :catch_148

    goto :goto_150

    :catch_148
    move-exception v7

    const-string v8, "\u83b7\u53d6ViewModel\u5931\u8d25"

    invoke-static {v4, v8, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iput-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->b0:Lc2/d;

    :goto_150
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    if-eqz v7, :cond_161

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    const-string v8, "address"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_162

    :cond_161
    move-object v7, p1

    :goto_162
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_175

    const-string p1, "\u95e8\u9501\u5730\u5740\u65e0\u6548"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_175
    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->X:Ly1/A;

    invoke-virtual {v8, v7}, Ly1/A;->g(Ljava/lang/String;)Lcom/macronum/bledemo/model/BluetoothDevice;

    move-result-object v8

    iput-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    const-string v8, "\u3010\u8c03\u8bd5\u3011\u4ece\u6570\u636e\u5e93\u67e5\u8be2device: address="

    const-string v9, ", device="

    invoke-static {v8, v7, v9}, LA/e;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v9, :cond_1d6

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "\u5b58\u5728, name="

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v10}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ", open="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v10}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOpenTime()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", wait="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v10}, Lcom/macronum/bledemo/model/BluetoothDevice;->getWaitTime()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", close="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v10}, Lcom/macronum/bledemo/model/BluetoothDevice;->getCloseTime()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", attr="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v10}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAttribute()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_1d8

    :cond_1d6
    const-string v9, "null"

    :goto_1d8
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-nez v8, :cond_23f

    const-string p1, "\u3010\u8b66\u544a\u3011\u6570\u636e\u5e93\u4e2d\u6ca1\u6709\u627e\u5230\u8bbe\u5907\uff0c\u5c1d\u8bd5\u4ece\u670d\u52a1\u5668\u83b7\u53d6: "

    invoke-static {p1, v7, v4}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1eb
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object p1

    iget-object p1, p1, LZ1/a;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_208

    const-string p1, "\u8bf7\u5148\u767b\u5f55"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_23e

    :catch_206
    move-exception p1

    goto :goto_22d

    :cond_208
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v0

    if-nez v0, :cond_21b

    const-string p1, "\u7cfb\u7edf\u9519\u8bef\uff1aAPI\u5ba2\u6237\u7aef\u672a\u521d\u59cb\u5316"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_23e

    :cond_21b
    new-instance v1, LB1/A;

    invoke-direct {v1, v0}, LB1/A;-><init>(LB1/c;)V

    new-instance v0, LQ1/a;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, LQ1/a;->d:Ljava/lang/Object;

    iput-object v7, v0, LQ1/a;->b:Ljava/lang/Object;

    invoke-virtual {v1, v7, p1, v0}, LB1/A;->b(Ljava/lang/String;Ljava/lang/String;LB1/z;)V
    :try_end_22c
    .catch Ljava/lang/Exception; {:try_start_1eb .. :try_end_22c} :catch_206

    goto :goto_23e

    :goto_22d
    const-string v0, "\u4ece\u670d\u52a1\u5668\u52a0\u8f7d\u8bbe\u5907\u4fe1\u606f\u5f02\u5e38"

    invoke-static {v4, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string p1, "\u52a0\u8f7d\u8bbe\u5907\u4fe1\u606f\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_23e
    return-void

    :cond_23f
    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->x:Landroid/widget/EditText;

    invoke-virtual {v8}, Lcom/macronum/bledemo/model/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->J:Landroid/widget/TextView;

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v9}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOpenTime()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->K:Landroid/widget/TextView;

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v9}, Lcom/macronum/bledemo/model/BluetoothDevice;->getWaitTime()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->L:Landroid/widget/TextView;

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v9}, Lcom/macronum/bledemo/model/BluetoothDevice;->getCloseTime()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->F:Landroid/widget/Switch;

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v9}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAttribute()I

    move-result v9

    if-ne v9, v6, :cond_281

    move v9, v6

    goto :goto_282

    :cond_281
    move v9, v3

    :goto_282
    invoke-virtual {v8, v9}, Landroid/widget/Switch;->setChecked(Z)V

    if-eqz v7, :cond_28c

    invoke-virtual {v7}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    goto :goto_28d

    :cond_28c
    move-object v7, p1

    :goto_28d
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    if-eqz v8, :cond_2b0

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    const-string v9, "battery"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2b0

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    const/4 v10, -0x1

    invoke-virtual {v8, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    if-lez v8, :cond_2b0

    if-le v8, v1, :cond_2b1

    :cond_2b0
    move-object v9, p1

    :cond_2b1
    if-nez v9, :cond_2ff

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->b0:Lc2/d;

    if-eqz v8, :cond_2ff

    if-eqz v7, :cond_2ff

    :try_start_2b9
    invoke-static {v8}, LC0/f;->D(Lc2/d;)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_312

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;
    :try_end_2c9
    .catch Ljava/lang/Exception; {:try_start_2b9 .. :try_end_2c9} :catch_2f8

    :try_start_2c9
    invoke-interface {v8}, Ljava/util/Map;->size()I

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    if-eqz v10, :cond_2f6

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-lt v8, v6, :cond_2e5

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-le v8, v1, :cond_2f6

    goto :goto_2e5

    :catch_2e2
    move-exception v5

    move-object v9, v10

    goto :goto_2f9

    :cond_2e5
    :goto_2e5
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2f4
    .catch Ljava/lang/Exception; {:try_start_2c9 .. :try_end_2f4} :catch_2e2

    move-object v9, p1

    goto :goto_312

    :cond_2f6
    move-object v9, v10

    goto :goto_312

    :catch_2f8
    move-exception v5

    :goto_2f9
    const-string v8, "\u3010\u7535\u91cf\u3011\u4eceViewModel\u83b7\u53d6\u7535\u91cf\u5931\u8d25"

    invoke-static {v4, v8, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_312

    :cond_2ff
    if-nez v9, :cond_312

    iget-object v5, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->b0:Lc2/d;

    if-nez v5, :cond_30b

    const-string v5, "\u3010\u7535\u91cf\u3011mainViewModel\u4e3anull\uff0c\u65e0\u6cd5\u83b7\u53d6\u7535\u91cf"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_312

    :cond_30b
    if-nez v7, :cond_312

    const-string v5, "\u3010\u7535\u91cf\u3011lockMacUpper\u4e3anull\uff0c\u65e0\u6cd5\u83b7\u53d6\u7535\u91cf"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_312
    :goto_312
    iput-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->c0:Ljava/lang/Integer;

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->I:Landroid/widget/TextView;

    if-eqz v4, :cond_321

    invoke-static {v9}, LM2/l;->g(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->I:Landroid/widget/TextView;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_321
    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->b0:Lc2/d;

    if-eqz v4, :cond_331

    if-eqz v7, :cond_331

    new-instance v5, LS1/h;

    invoke-direct {v5, p0, v7, v2}, LS1/h;-><init>(Ljava/lang/Object;Ljava/io/Serializable;I)V

    iget-object v4, v4, Lc2/d;->i:Landroidx/lifecycle/z;

    invoke-virtual {v4, p0, v5}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    :cond_331
    iget-object v7, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->y:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->z:Landroid/widget/EditText;

    iget-object v9, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->A:Landroid/widget/EditText;

    iget-object v10, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->B:Landroid/widget/EditText;

    iget-object v11, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->C:Landroid/widget/EditText;

    iget-object v12, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->D:Landroid/widget/EditText;

    filled-new-array/range {v7 .. v12}, [Landroid/widget/EditText;

    move-result-object v4

    move v5, v3

    :goto_342
    const/4 v7, 0x6

    if-ge v5, v7, :cond_378

    aget-object v7, v4, v5

    if-ge v5, v1, :cond_34e

    add-int/lit8 v8, v5, 0x1

    aget-object v8, v4, v8

    goto :goto_34f

    :cond_34e
    move-object v8, p1

    :goto_34f
    if-lez v5, :cond_356

    add-int/lit8 v9, v5, -0x1

    aget-object v9, v4, v9

    goto :goto_357

    :cond_356
    move-object v9, p1

    :goto_357
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setSelectAllOnFocus(Z)V

    new-instance v10, Ly1/h;

    invoke-direct {v10, v3}, Ly1/h;-><init>(I)V

    invoke-virtual {v7, v10}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-array v10, v6, [Z

    aput-boolean v3, v10, v3

    new-instance v11, Ly1/s;

    invoke-direct {v11, p0, v10, v8, v7}, Ly1/s;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;[ZLandroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v7, v11}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    new-instance v8, Ly1/i;

    invoke-direct {v8, v9, v10}, Ly1/i;-><init>(Landroid/widget/EditText;[Z)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    add-int/2addr v5, v6

    goto :goto_342

    :cond_378
    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->G:Landroid/widget/Switch;

    new-instance v5, LS0/a;

    invoke-direct {v5, p0, v2}, LS0/a;-><init>(Landroid/view/KeyEvent$Callback;I)V

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->M:Landroid/widget/Button;

    new-instance v5, Ly1/a;

    const/16 v7, 0x8

    invoke-direct {v5, p0, v7}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-static {v4, v5}, Lcom/macronum/bledemo/DeviceConfigActivity;->E(Landroid/widget/Button;Ljava/lang/Runnable;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->N:Landroid/widget/Button;

    new-instance v5, Ly1/a;

    const/16 v7, 0x9

    invoke-direct {v5, p0, v7}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-static {v4, v5}, Lcom/macronum/bledemo/DeviceConfigActivity;->E(Landroid/widget/Button;Ljava/lang/Runnable;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->O:Landroid/widget/Button;

    new-instance v5, Ly1/a;

    const/16 v7, 0xa

    invoke-direct {v5, p0, v7}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-static {v4, v5}, Lcom/macronum/bledemo/DeviceConfigActivity;->E(Landroid/widget/Button;Ljava/lang/Runnable;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->P:Landroid/widget/Button;

    new-instance v5, Ly1/a;

    invoke-direct {v5, p0, v3}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-static {v4, v5}, Lcom/macronum/bledemo/DeviceConfigActivity;->E(Landroid/widget/Button;Ljava/lang/Runnable;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Q:Landroid/widget/Button;

    new-instance v5, Ly1/a;

    invoke-direct {v5, p0, v6}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-static {v4, v5}, Lcom/macronum/bledemo/DeviceConfigActivity;->E(Landroid/widget/Button;Ljava/lang/Runnable;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->R:Landroid/widget/Button;

    new-instance v5, Ly1/a;

    invoke-direct {v5, p0, v0}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-static {v4, v5}, Lcom/macronum/bledemo/DeviceConfigActivity;->E(Landroid/widget/Button;Ljava/lang/Runnable;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->S:Landroid/widget/Button;

    new-instance v5, Ly1/d;

    invoke-direct {v5, p0, v3}, Ly1/d;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->T:Landroid/widget/Button;

    new-instance v5, Ly1/d;

    invoke-direct {v5, p0, v6}, Ly1/d;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->U:Landroid/widget/Button;

    new-instance v5, Ly1/d;

    invoke-direct {v5, p0, v0}, Ly1/d;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-boolean v3, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    invoke-virtual {p0}, Lcom/macronum/bledemo/DeviceConfigActivity;->I()V

    invoke-virtual {p0, v3}, Lcom/macronum/bledemo/DeviceConfigActivity;->D(Z)V

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_410

    iget-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz p1, :cond_403

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result p1

    if-eqz p1, :cond_403

    move v3, v6

    :cond_403
    xor-int/lit8 p1, v3, 0x1

    iput-boolean p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    new-instance p1, Ly1/a;

    invoke-direct {p1, p0, v2}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_465

    :cond_410
    iget-object v2, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v2, :cond_418

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    :cond_418
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_437

    iget-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz p1, :cond_429

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result p1

    if-eqz p1, :cond_429

    move v3, v6

    :cond_429
    xor-int/lit8 p1, v3, 0x1

    iput-boolean p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    new-instance p1, Ly1/a;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_465

    :cond_437
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v2

    if-nez v2, :cond_455

    iget-object p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz p1, :cond_448

    invoke-virtual {p1}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result p1

    if-eqz p1, :cond_448

    move v3, v6

    :cond_448
    xor-int/lit8 p1, v3, 0x1

    iput-boolean p1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    new-instance p1, Ly1/a;

    invoke-direct {p1, p0, v1}, Ly1/a;-><init>(Lcom/macronum/bledemo/DeviceConfigActivity;I)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_465

    :cond_455
    iput-boolean v6, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->a0:Z

    new-instance v1, LB1/l;

    invoke-direct {v1, v2}, LB1/l;-><init>(LB1/c;)V

    new-instance v2, Lb2/w;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v0, v3}, Lb2/w;-><init>(Lf/g;Ljava/lang/Object;I)V

    invoke-virtual {v1, p1, v0, v2}, LB1/l;->a(Ljava/lang/String;Ljava/lang/String;LB1/C;)V

    :goto_465
    invoke-virtual {p0}, Lcom/macronum/bledemo/DeviceConfigActivity;->z()V

    :try_start_468
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object p1

    iget-object p1, p1, LZ1/a;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_477

    goto :goto_4a2

    :cond_477
    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v0, :cond_4a2

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_486

    goto :goto_4a2

    :cond_486
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v0

    if-nez v0, :cond_48d

    goto :goto_4a2

    :cond_48d
    new-instance v1, LB1/A;

    invoke-direct {v1, v0}, LB1/A;-><init>(LB1/c;)V

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Y:Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-virtual {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    new-instance v2, LS1/p;

    const/16 v3, 0x18

    invoke-direct {v2, v3, p0}, LS1/p;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, v0, p1, v2}, LB1/A;->b(Ljava/lang/String;Ljava/lang/String;LB1/z;)V
    :try_end_4a2
    .catch Ljava/lang/Exception; {:try_start_468 .. :try_end_4a2} :catch_4a2

    :catch_4a2
    :cond_4a2
    :goto_4a2
    return-void
.end method

.method public final onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_e

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p1, 0x1

    return p1

    :cond_e
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public final z()V
    .registers 10

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->E:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-boolean v1, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->Z:Z

    const/16 v2, 0x8

    if-nez v1, :cond_f

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_f
    iget-object v3, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->y:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->z:Landroid/widget/EditText;

    iget-object v5, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->A:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->B:Landroid/widget/EditText;

    iget-object v7, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->C:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->D:Landroid/widget/EditText;

    filled-new-array/range {v3 .. v8}, [Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    move v4, v3

    :goto_26
    const/4 v5, 0x6

    if-ge v4, v5, :cond_63

    aget-object v5, v0, v4

    if-eqz v5, :cond_60

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_60

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    if-eqz v6, :cond_46

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    goto :goto_48

    :cond_46
    const-string v5, ""

    :goto_48
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_81

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2a

    if-eq v5, v6, :cond_81

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-nez v6, :cond_5d

    goto :goto_81

    :cond_5d
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_60
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    :cond_63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-ne v0, v5, :cond_81

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "123456"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7b

    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->E:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_86

    :cond_7b
    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->E:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_86

    :cond_81
    :goto_81
    iget-object v0, p0, Lcom/macronum/bledemo/DeviceConfigActivity;->E:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_86
    return-void
.end method

