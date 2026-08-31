.class public Lcom/macronum/bledemo/ScanActivity;
.super Lf/g;
.source "SourceFile"


# static fields
.field public static final synthetic T:I


# instance fields
.field public A:LD1/f;

.field public B:Ly1/D;

.field public C:Ly1/A;

.field public D:Lb2/y;

.field public E:Lb2/t;

.field public F:LC0/e;

.field public G:LB1/e;

.field public final H:Ljava/util/ArrayList;

.field public final I:Ljava/util/HashMap;

.field public J:Lc2/d;

.field public K:LS1/Y;

.field public L:Ly1/C;

.field public final M:Landroid/os/Handler;

.field public N:Z

.field public O:Z

.field public P:Z

.field public Q:Z

.field public final R:Ly1/X;

.field public S:Landroidx/activity/result/c;

.field public x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public y:Landroidx/recyclerview/widget/RecyclerView;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lf/g;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->H:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->I:Ljava/util/HashMap;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->M:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/macronum/bledemo/ScanActivity;->N:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/ScanActivity;->O:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/ScanActivity;->P:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/ScanActivity;->Q:Z

    new-instance v0, Ly1/X;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ly1/X;-><init>(Lcom/macronum/bledemo/ScanActivity;I)V

    iput-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->R:Ly1/X;

    return-void
.end method


# virtual methods
.method public final A(Landroid/bluetooth/BluetoothDevice;)Z
    .registers 8

    const-string v0, "ScanActivity"

    const-string v1, "\u8bbe\u5907\u4fe1\u53f7\u6781\u5f31\uff0c\u4e0d\u5efa\u8bae\u8fde\u63a5: "

    const-string v2, "\u65e0\u6cd5\u83b7\u53d6\u8bbe\u5907\u4fe1\u53f7\u5f3a\u5ea6\uff0c\u5141\u8bb8\u5c1d\u8bd5\u8fde\u63a5: "

    const/4 v3, 0x1

    :try_start_7
    iget-object v4, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v4}, LD1/f;->e()Z

    move-result v4

    if-nez v4, :cond_18

    const-string p1, "\u84dd\u7259\u4e0d\u53ef\u7528"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :catch_16
    move-exception p1

    goto :goto_56

    :cond_18
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object p1

    iget-object v4, p0, Lcom/macronum/bledemo/ScanActivity;->I:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    if-nez v4, :cond_36

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_36
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v5, -0x5f

    if-ge v2, v5, :cond_55

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", RSSI="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_55} :catch_16

    :cond_55
    return v3

    :goto_56
    const-string v1, "\u84dd\u7259\u8fde\u63a5\u9884\u68c0\u67e5\u5f02\u5e38"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v3
.end method

.method public final B(Landroid/bluetooth/BluetoothDevice;Lcom/macronum/bledemo/model/BluetoothDevice;Ljava/lang/String;)V
    .registers 23

    move-object/from16 v12, p0

    move-object/from16 v0, p1

    move-object/from16 v13, p3

    if-eqz v0, :cond_b

    invoke-virtual/range {p1 .. p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    :cond_b
    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v1

    const-string v2, "\u5f00\u59cb\u663e\u793a\u5bc6\u7801\u8f93\u5165\u5bf9\u8bdd\u6846"

    invoke-virtual {v1, v13, v2}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_14
    iget-object v1, v12, Lcom/macronum/bledemo/ScanActivity;->K:LS1/Y;

    invoke-virtual/range {p1 .. p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f1001e9

    invoke-virtual {v12, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, LS1/Y;->k(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_24} :catch_24

    :catch_24
    invoke-static/range {p0 .. p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0b0049

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f080110

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Landroid/widget/EditText;

    const v2, 0x7f080111

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroid/widget/EditText;

    const v2, 0x7f080112

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Landroid/widget/EditText;

    const v2, 0x7f080113

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Landroid/widget/EditText;

    const v2, 0x7f080114

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Landroid/widget/EditText;

    const v2, 0x7f080115

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Landroid/widget/EditText;

    move-object v4, v10

    move-object v5, v11

    move-object v6, v14

    move-object v7, v15

    move-object/from16 v8, v16

    move-object/from16 v9, v17

    filled-new-array/range {v4 .. v9}, [Landroid/widget/EditText;

    move-result-object v18

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v12}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f1001fc

    invoke-virtual {v12, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f10004c

    invoke-virtual {v12, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v4, LS1/d;

    const/4 v5, 0x4

    invoke-direct {v4, v12, v0, v5}, LS1/d;-><init>(Lf/g;Ljava/lang/Object;I)V

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f100194

    invoke-virtual {v12, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    const/4 v9, 0x1

    iput-boolean v9, v12, Lcom/macronum/bledemo/ScanActivity;->O:Z

    new-instance v1, Ly1/S;

    invoke-direct {v1, v12}, Ly1/S;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {v0, v9}, Landroid/app/Dialog;->setCancelable(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    new-instance v8, Ly1/T;

    move-object v1, v8

    move-object/from16 v2, p0

    move-object v3, v10

    move-object v4, v11

    move-object v5, v14

    move-object v6, v15

    move-object/from16 v7, v16

    move-object v14, v8

    move-object/from16 v8, v17

    move v15, v9

    move-object v9, v0

    move-object/from16 v10, v18

    move-object/from16 v11, p2

    invoke-direct/range {v1 .. v11}, Ly1/T;-><init>(Lcom/macronum/bledemo/ScanActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/AlertDialog;[Landroid/widget/EditText;Lcom/macronum/bledemo/model/BluetoothDevice;)V

    invoke-virtual {v0, v14}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    :try_start_da
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v0

    const-string v1, "\u5bc6\u7801\u8f93\u5165\u5bf9\u8bdd\u6846\u663e\u793a\u5b8c\u6210"

    invoke-virtual {v0, v13, v1}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_e6
    .catch Ljava/lang/Exception; {:try_start_da .. :try_end_e6} :catch_e7

    goto :goto_10f

    :catch_e7
    move-exception v0

    const-string v1, "ScanActivity"

    const-string v2, "\u663e\u793a\u5bc6\u7801\u8f93\u5165\u5bf9\u8bdd\u6846\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v0

    const-string v1, "\u5bc6\u7801\u8f93\u5165\u5bf9\u8bdd\u6846\u663e\u793a\u5931\u8d25"

    invoke-virtual {v0, v13, v1}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v0

    const-string v1, "\u6dfb\u52a0\u95e8\u9501\u6d41\u7a0b"

    invoke-virtual {v0, v13, v1}, Lb2/t;->m(Ljava/lang/String;Ljava/lang/String;)V

    const v0, 0x7f100198

    invoke-virtual {v12, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v0, v15}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_10f
    return-void
.end method

.method public final C(Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5

    const-string v0, "\n\n\u8bf7\u5728\u63a5\u4e0b\u6765\u7684\u7cfb\u7edf\u5f39\u7a97\u4e2d\u70b9\u51fb\u201c\u5141\u8bb8\u201d\u3002"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, LS1/a1;

    const-string v1, "\u6743\u9650\u7533\u8bf7\u8bf4\u660e"

    invoke-direct {v0, p0, v1, p1}, LS1/a1;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, LS1/h;

    const/4 v1, 0x4

    invoke-direct {p1, p0, p2, v1}, LS1/h;-><init>(Ljava/lang/Object;Ljava/io/Serializable;I)V

    const-string p2, "\u540c\u610f\u5e76\u7ee7\u7eed"

    iput-object p2, v0, LS1/a1;->e:Ljava/lang/String;

    iput-object p1, v0, LS1/a1;->g:LS1/Z0;

    new-instance p1, Ly1/K;

    invoke-direct {p1, p0}, Ly1/K;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    const-string p2, "\u6682\u4e0d\u6388\u6743"

    iput-object p2, v0, LS1/a1;->f:Ljava/lang/String;

    iput-object p1, v0, LS1/a1;->h:LS1/Y0;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method public final D()V
    .registers 5

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->z:Landroid/widget/TextView;

    const v1, 0x7f10003c

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    const/4 v1, 0x0

    const-string v2, "ScanActivity"

    if-nez v0, :cond_30

    const-string v0, "\u84dd\u7259\u7ba1\u7406\u5668\u4e3anull\uff0c\u65e0\u6cd5\u542f\u52a8\u626b\u63cf"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->z:Landroid/widget/TextView;

    const v2, 0x7f100034

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void

    :cond_30
    :try_start_30
    invoke-virtual {v0}, LD1/f;->g()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->H:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->I:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->K:LS1/Y;

    invoke-virtual {v0}, Le0/C;->c()V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_42} :catch_43

    goto :goto_5a

    :catch_43
    move-exception v0

    const-string v3, "\u542f\u52a8\u626b\u63cf\u5f02\u5e38"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->z:Landroid/widget/TextView;

    const v2, 0x7f1001eb

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    :goto_5a
    return-void
.end method

.method public final E()V
    .registers 3

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v0}, LD1/f;->h()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->z:Landroid/widget/TextView;

    const v1, 0x7f1001e2

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Lf/g;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b002f

    invoke-virtual {p0, p1}, Lf/g;->setContentView(I)V

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_1d

    invoke-virtual {p1, v0}, LC0/f;->s0(Z)V

    const v1, 0x7f1001ef

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, LC0/f;->A0(Ljava/lang/String;)V

    :cond_1d
    const p1, 0x7f0802c8

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->z:Landroid/widget/TextView;

    const p1, 0x7f08024f

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const p1, 0x7f0801e8

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, LD1/f;

    invoke-direct {p1, p0}, LD1/f;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    new-instance v1, Ly1/D;

    invoke-direct {v1, p1}, Ly1/D;-><init>(LD1/f;)V

    iput-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->B:Ly1/D;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ly1/A;->h(Landroid/content/Context;)Ly1/A;

    move-result-object p1

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->C:Ly1/A;

    new-instance p1, Lb2/y;

    invoke-direct {p1, p0}, Lb2/y;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->D:Lb2/y;

    new-instance p1, Lb2/t;

    invoke-direct {p1, p0}, Lb2/t;-><init>(Lf/g;)V

    const-class v1, Lc2/d;

    invoke-virtual {p1, v1}, Lb2/t;->p(Ljava/lang/Class;)Landroidx/lifecycle/S;

    move-result-object p1

    check-cast p1, Lc2/d;

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->J:Lc2/d;

    new-instance p1, Lb2/t;

    invoke-direct {p1, p0}, Lb2/t;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->E:Lb2/t;

    new-instance p1, LC0/e;

    invoke-direct {p1, p0}, LC0/e;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->F:LC0/e;

    new-instance p1, LB1/e;

    invoke-direct {p1, p0}, LB1/e;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->G:LB1/e;

    new-instance p1, Landroidx/fragment/app/z;

    const/4 v1, 0x3

    invoke-direct {p1, v1}, Landroidx/fragment/app/z;-><init>(I)V

    new-instance v1, Ly1/K;

    invoke-direct {v1, p0}, Ly1/K;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    invoke-virtual {p0, p1, v1}, Landroidx/activity/g;->k(Landroid/support/v4/media/session/a;Landroidx/activity/result/b;)Landroidx/activity/result/c;

    move-result-object p1

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->S:Landroidx/activity/result/c;

    new-instance p1, LS1/Y;

    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->H:Ljava/util/ArrayList;

    new-instance v2, Ly1/K;

    invoke-direct {v2, p0}, Ly1/K;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    invoke-direct {p1, v1, v2, p0}, LS1/Y;-><init>(Ljava/util/ArrayList;Ly1/K;Lcom/macronum/bledemo/ScanActivity;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->K:LS1/Y;

    iget-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(I)V

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Le0/J;)V

    const/4 p1, 0x0

    :try_start_ab
    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_ab .. :try_end_b0} :catch_b0

    :catch_b0
    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lcom/macronum/bledemo/ScanActivity;->K:LS1/Y;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Le0/C;)V

    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    new-instance v2, Ly1/K;

    invoke-direct {v2, p0}, Ly1/K;-><init>(Lcom/macronum/bledemo/ScanActivity;)V

    invoke-virtual {v1, v2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Ln0/j;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const-string v2, "android.permission.ACCESS_FINE_LOCATION"

    const-string v3, "android.permission.BLUETOOTH_CONNECT"

    const-string v4, "android.permission.BLUETOOTH_SCAN"

    const/16 v5, 0x1f

    if-lt v1, v5, :cond_da

    invoke-static {p0, v4}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_e1

    invoke-static {p0, v3}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_e1

    goto :goto_13f

    :cond_da
    invoke-static {p0, v2}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_e1

    goto :goto_13f

    :cond_e1
    if-lt v1, v5, :cond_136

    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->G:LB1/e;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, LB1/e;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, LB1/e;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_114

    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->G:LB1/e;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, LB1/e;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, LB1/e;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_10a

    goto :goto_114

    :cond_10a
    filled-new-array {v4, v3}, [Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u4e3a\u4e86\u626b\u63cf\u548c\u8fde\u63a5\u9644\u8fd1\u7684\u95e8\u9501\u8bbe\u5907\uff0c\u5e94\u7528\u9700\u8981\u83b7\u53d6\u84dd\u7259\u6743\u9650\u3002\n\n\u2022 \u84dd\u7259\u626b\u63cf\uff1a\u7528\u4e8e\u53d1\u73b0\u9644\u8fd1\u7684\u95e8\u9501\n\u2022 \u84dd\u7259\u8fde\u63a5\uff1a\u7528\u4e8e\u4e0e\u95e8\u9501\u5efa\u7acb\u901a\u4fe1"

    invoke-virtual {p0, v0, p1}, Lcom/macronum/bledemo/ScanActivity;->C(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_13f

    :cond_114
    :goto_114
    const-string p1, "ScanActivity"

    const-string v1, "\u84dd\u7259\u6743\u9650\u5df2\u88ab\u6c38\u4e45\u62d2\u7edd\uff0c\u4e0d\u518d\u81ea\u52a8\u5f39\u7a97"

    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const p1, 0x7f100037

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    iget-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->z:Landroid/widget/TextView;

    const v0, 0x7f1001a8

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_13f

    :cond_136
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u4e3a\u4e86\u626b\u63cf\u9644\u8fd1\u7684\u84dd\u7259\u8bbe\u5907\uff0c\u5e94\u7528\u9700\u8981\u83b7\u53d6\u4f4d\u7f6e\u6743\u9650\u3002\n\n\u2022 \u4f4d\u7f6e\u6743\u9650\uff1aAndroid 6.0-11 \u7cfb\u7edf\u8981\u6c42\u5f00\u542f\u4f4d\u7f6e\u6743\u9650\u624d\u80fd\u8fdb\u884c\u84dd\u7259\u626b\u63cf"

    invoke-virtual {p0, v0, p1}, Lcom/macronum/bledemo/ScanActivity;->C(Ljava/lang/String;[Ljava/lang/String;)V

    :goto_13f
    new-instance p1, Ly1/C;

    const/4 v0, 0x1

    invoke-direct {p1, v0, p0}, Ly1/C;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->L:Ly1/C;

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v0, p1}, LD1/f;->a(LD1/e;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 4

    invoke-super {p0}, Lf/g;->onDestroy()V

    :try_start_3
    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v0}, LD1/f;->c()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v0}, LD1/f;->h()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->L:Ly1/C;

    invoke-virtual {v0, v1}, LD1/f;->f(LD1/e;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_14} :catch_15

    goto :goto_1d

    :catch_15
    move-exception v0

    const-string v1, "ScanActivity"

    const-string v2, "\u6e05\u7406\u8d44\u6e90\u5f02\u5e38"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1d
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

.method public final onPause()V
    .registers 4

    invoke-super {p0}, Lf/g;->onPause()V

    :try_start_3
    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v0}, LD1/f;->h()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->M:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_e} :catch_f

    goto :goto_17

    :catch_f
    move-exception v0

    const-string v1, "ScanActivity"

    const-string v2, "onPause \u505c\u6b62\u626b\u63cf\u5f02\u5e38"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_17
    return-void
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 6

    invoke-super {p0, p1, p2, p3}, Lf/g;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    const/16 p2, 0x65

    if-ne p1, p2, :cond_37

    array-length p1, p3

    const/4 p2, 0x0

    move v0, p2

    :goto_a
    if-ge v0, p1, :cond_34

    aget v1, p3, v0

    if-eqz v1, :cond_31

    const p1, 0x7f10018a

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 p3, 0x1

    invoke-static {p0, p1, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    iget-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->z:Landroid/widget/TextView;

    const p3, 0x7f1001a8

    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/macronum/bledemo/ScanActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {p1, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    goto :goto_37

    :cond_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_34
    invoke-virtual {p0}, Lcom/macronum/bledemo/ScanActivity;->D()V

    :cond_37
    :goto_37
    return-void
.end method

.method public final onResume()V
    .registers 5

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->M:Landroid/os/Handler;

    invoke-super {p0}, Lf/g;->onResume()V

    :try_start_5
    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->L:Ly1/C;

    if-eqz v1, :cond_18

    iget-object v2, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v2, v1}, LD1/f;->f(LD1/e;)V

    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    iget-object v2, p0, Lcom/macronum/bledemo/ScanActivity;->L:Ly1/C;

    invoke-virtual {v1, v2}, LD1/f;->a(LD1/e;)V

    goto :goto_18

    :catch_16
    move-exception v1

    goto :goto_29

    :cond_18
    :goto_18
    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v1}, LD1/f;->h()V

    new-instance v1, Ly1/X;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Ly1/X;-><init>(Lcom/macronum/bledemo/ScanActivity;I)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_28} :catch_16

    goto :goto_3b

    :goto_29
    const-string v2, "ScanActivity"

    const-string v3, "onResume \u5904\u7406\u5f02\u5e38"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v1, Ly1/X;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Ly1/X;-><init>(Lcom/macronum/bledemo/ScanActivity;I)V

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_3b
    return-void
.end method

.method public final onStop()V
    .registers 4

    invoke-super {p0}, Lf/g;->onStop()V

    :try_start_3
    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->A:LD1/f;

    invoke-virtual {v0}, LD1/f;->h()V

    iget-object v0, p0, Lcom/macronum/bledemo/ScanActivity;->M:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_e} :catch_f

    goto :goto_17

    :catch_f
    move-exception v0

    const-string v1, "ScanActivity"

    const-string v2, "onStop \u505c\u6b62\u626b\u63cf\u5f02\u5e38"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_17
    return-void
.end method

.method public final y(Landroid/bluetooth/BluetoothDevice;)V
    .registers 15

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    :cond_7
    const-string v0, "unknown"

    :goto_9
    const-string v1, "add_device_"

    const-string v2, "_"

    invoke-static {v1, v0, v2}, LA/e;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v1

    const-string v2, "\u6dfb\u52a0\u95e8\u9501\u6d41\u7a0b"

    invoke-virtual {v1, v10, v2}, Lb2/t;->S(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v1

    const-string v3, "\u5f00\u59cb\u68c0\u67e5\u8bbe\u5907\u6743\u9650"

    invoke-virtual {v1, v10, v3}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "\u8bbe\u5907: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    filled-new-array {v2, v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    const-string v3, "\ud83d\ude80 \u5f00\u59cb: %s - %s [%d]"

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p0}, Lcom/macronum/bledemo/ScanActivity;->z()Z

    move-result v1

    const/4 v3, 0x0

    const v4, 0x7f100194

    const v5, 0x7f10004f

    const-string v6, "ScanActivity"

    if-nez v1, :cond_96

    const-string p1, "\u7f51\u7edc\u4e0d\u53ef\u7528\uff0c\u65e0\u6cd5\u6dfb\u52a0\u95e8\u9501"

    invoke-static {v6, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object p1

    const-string v1, "\u7f51\u7edc\u68c0\u67e5\u5931\u8d25"

    invoke-virtual {p1, v10, v1}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object p1

    invoke-virtual {p1, v10, v2}, Lb2/t;->m(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v1, 0x7f10004e

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Ly1/M;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Ly1/M;-><init>(Lcom/macronum/bledemo/ScanActivity;Ljava/lang/String;I)V

    invoke-virtual {p1, v4, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    :cond_96
    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v1

    const-string v7, "\u7f51\u7edc\u68c0\u67e5\u901a\u8fc7"

    invoke-virtual {v1, v10, v7}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/macronum/bledemo/model/BluetoothDevice;->createNewDevice()Lcom/macronum/bledemo/model/BluetoothDevice;

    move-result-object v9

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->setAddress(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_c1

    const-string v7, "YILA"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_bd

    goto :goto_c1

    :cond_bd
    invoke-virtual {v9, v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->setName(Ljava/lang/String;)V

    goto :goto_cb

    :cond_c1
    :goto_c1
    const v1, 0x7f10007d

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/macronum/bledemo/model/BluetoothDevice;->setName(Ljava/lang/String;)V

    :goto_cb
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v1

    invoke-virtual {v1}, LZ1/a;->i()Z

    move-result v7

    if-nez v7, :cond_10c

    const-string p1, "\u7528\u6237\u672a\u767b\u5f55\uff0c\u65e0\u6cd5\u6dfb\u52a0\u95e8\u9501"

    invoke-static {v6, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object p1

    const-string v1, "\u7528\u6237\u672a\u767b\u5f55\u68c0\u67e5\u5931\u8d25"

    invoke-virtual {p1, v10, v1}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object p1

    invoke-virtual {p1, v10, v2}, Lb2/t;->m(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v1, 0x7f10004d

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Ly1/M;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Ly1/M;-><init>(Lcom/macronum/bledemo/ScanActivity;Ljava/lang/String;I)V

    invoke-virtual {p1, v4, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    :cond_10c
    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v7

    const-string v8, "\u767b\u5f55\u72b6\u6001\u68c0\u67e5\u901a\u8fc7"

    invoke-virtual {v7, v10, v8}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v1, LZ1/a;->d:Ljava/lang/Object;

    move-object v8, v1

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_157

    const-string p1, "\u7528\u6237ID\u4e3a\u7a7a\uff0c\u65e0\u6cd5\u6dfb\u52a0\u95e8\u9501"

    invoke-static {v6, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object p1

    const-string v1, "\u7528\u6237ID\u68c0\u67e5\u5931\u8d25"

    invoke-virtual {p1, v10, v1}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object p1

    invoke-virtual {p1, v10, v2}, Lb2/t;->m(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v1, 0x7f100050

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Ly1/M;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v0, v2}, Ly1/M;-><init>(Lcom/macronum/bledemo/ScanActivity;Ljava/lang/String;I)V

    invoke-virtual {p1, v4, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    :cond_157
    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v1

    const-string v2, "\u7528\u6237ID\u68c0\u67e5\u901a\u8fc7"

    invoke-virtual {v1, v10, v2}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v5

    if-eqz v5, :cond_1b7

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1b7

    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v1

    const-string v2, "\u5f00\u59cb\u5e76\u884c\u9a8c\u8bc1\u6d41\u7a0b"

    invoke-virtual {v1, v10, v2}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_175
    iget-object v1, p0, Lcom/macronum/bledemo/ScanActivity;->K:LS1/Y;

    const v2, 0x7f1001ea

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, LS1/Y;->k(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_181
    .catch Ljava/lang/Exception; {:try_start_175 .. :try_end_181} :catch_181

    :catch_181
    new-instance v11, Ly1/N;

    move-object v1, v11

    move-object v2, p0

    move-object v3, v10

    move-object v4, v0

    move-object v6, v9

    move-object v7, v8

    invoke-direct/range {v1 .. v7}, Ly1/N;-><init>(Lcom/macronum/bledemo/ScanActivity;Ljava/lang/String;Ljava/lang/String;LB1/c;Lcom/macronum/bledemo/model/BluetoothDevice;Ljava/lang/String;)V

    invoke-static {v11}, Ljava/util/concurrent/CompletableFuture;->supplyAsync(Ljava/util/function/Supplier;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v3

    new-instance v1, Ly1/O;

    invoke-direct {v1, p1, p0, v10, v0}, Ly1/O;-><init>(Landroid/bluetooth/BluetoothDevice;Lcom/macronum/bledemo/ScanActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/util/concurrent/CompletableFuture;->supplyAsync(Ljava/util/function/Supplier;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/util/concurrent/CompletableFuture;

    move-result-object v1

    invoke-static {v1}, Ljava/util/concurrent/CompletableFuture;->allOf([Ljava/util/concurrent/CompletableFuture;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v11

    new-instance v12, Ly1/P;

    move-object v1, v12

    move-object v5, v10

    move-object v6, v0

    move-object v8, p1

    invoke-direct/range {v1 .. v9}, Ly1/P;-><init>(Lcom/macronum/bledemo/ScanActivity;Ljava/util/concurrent/CompletableFuture;Ljava/util/concurrent/CompletableFuture;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;Lcom/macronum/bledemo/model/BluetoothDevice;)V

    invoke-virtual {v11, v12}, Ljava/util/concurrent/CompletableFuture;->thenAcceptAsync(Ljava/util/function/Consumer;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v1

    new-instance v2, Ly1/Q;

    invoke-direct {v2, p1, p0, v10, v0}, Ly1/Q;-><init>(Landroid/bluetooth/BluetoothDevice;Lcom/macronum/bledemo/ScanActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/concurrent/CompletableFuture;->exceptionally(Ljava/util/function/Function;)Ljava/util/concurrent/CompletableFuture;

    goto :goto_1c3

    :cond_1b7
    invoke-static {}, Lb2/t;->A()Lb2/t;

    move-result-object v0

    const-string v1, "API\u672a\u521d\u59cb\u5316\uff0c\u76f4\u63a5\u5141\u8bb8\u6dfb\u52a0"

    invoke-virtual {v0, v10, v1}, Lb2/t;->L(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v9, v10}, Lcom/macronum/bledemo/ScanActivity;->B(Landroid/bluetooth/BluetoothDevice;Lcom/macronum/bledemo/model/BluetoothDevice;Ljava/lang/String;)V

    :goto_1c3
    return-void
.end method

.method public final z()Z
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    if-nez v1, :cond_c

    return v0

    :cond_c
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v2

    if-nez v2, :cond_13

    return v0

    :cond_13
    invoke-virtual {v1, v2}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v1

    if-nez v1, :cond_1a

    return v0

    :cond_1a
    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v2

    const/16 v3, 0x10

    invoke-virtual {v1, v3}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v1
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_26} :catch_2c

    if-eqz v2, :cond_2b

    if-eqz v1, :cond_2b

    const/4 v0, 0x1

    :cond_2b
    return v0

    :catch_2c
    move-exception v1

    const-string v2, "ScanActivity"

    const-string v3, "\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u5931\u8d25"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

