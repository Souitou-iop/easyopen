.class public Lcom/macronum/bledemo/ui/RemoteUnlockActivity;
.super Lf/g;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Landroid/widget/TextView;

.field public C:Landroid/widget/TextView;

.field public D:Landroid/widget/Button;

.field public E:LA0/d;

.field public x:Lc2/e;

.field public y:Landroid/widget/TextView;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lf/g;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Lf/g;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b002e

    invoke-virtual {p0, p1}, Lf/g;->setContentView(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "device_address"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "device_name"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p1, :cond_19a

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_28

    goto/16 :goto_19a

    :cond_28
    const v2, 0x7f080278

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, v2}, Lf/g;->x(Landroidx/appcompat/widget/Toolbar;)V

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_4b

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object v2

    invoke-virtual {v2, v3}, LC0/f;->s0(Z)V

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object v2

    const-string v4, "\u8fdc\u7a0b\u5f00\u9501"

    invoke-virtual {v2, v4}, LC0/f;->A0(Ljava/lang/String;)V

    :cond_4b
    const v2, 0x7f08028d

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->y:Landroid/widget/TextView;

    const v2, 0x7f08028b

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->z:Landroid/widget/TextView;

    const v2, 0x7f080288

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->A:Landroid/widget/TextView;

    const v2, 0x7f08029c

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->B:Landroid/widget/TextView;

    const v2, 0x7f0802a4

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->C:Landroid/widget/TextView;

    const v2, 0x7f08007b

    invoke-virtual {p0, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->D:Landroid/widget/Button;

    new-instance v4, LS1/v;

    const/4 v5, 0x7

    invoke-direct {v4, v5, p0}, LS1/v;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lb2/t;

    invoke-direct {v2, p0}, Lb2/t;-><init>(Lf/g;)V

    const-class v4, Lc2/e;

    invoke-virtual {v2, v4}, Lb2/t;->p(Ljava/lang/Class;)Landroidx/lifecycle/S;

    move-result-object v2

    check-cast v2, Lc2/e;

    iput-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->x:Lc2/e;

    iget-object v4, v2, Lc2/e;->e:Landroidx/lifecycle/z;

    invoke-virtual {v4, p1}, Landroidx/lifecycle/z;->i(Ljava/lang/Object;)V

    iget-object v4, v2, Lc2/e;->f:Landroidx/lifecycle/z;

    invoke-virtual {v4, v0}, Landroidx/lifecycle/z;->i(Ljava/lang/Object;)V

    invoke-static {}, LN1/f;->k()LN1/f;

    move-result-object v0

    invoke-virtual {v0, p1}, LN1/f;->o(Ljava/lang/String;)LN1/e;

    move-result-object v0

    iget-object v4, v2, Lc2/e;->g:Landroidx/lifecycle/z;

    invoke-virtual {v4, v0}, Landroidx/lifecycle/z;->i(Ljava/lang/Object;)V

    if-eqz v0, :cond_c4

    iget-boolean v4, v0, LN1/e;->e:Z

    if-eqz v4, :cond_c4

    move v4, v3

    goto :goto_c5

    :cond_c4
    move v4, v1

    :goto_c5
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iget-object v6, v2, Lc2/e;->h:Landroidx/lifecycle/z;

    invoke-virtual {v6, v5}, Landroidx/lifecycle/z;->i(Ljava/lang/Object;)V

    :try_start_ce
    invoke-static {}, LY1/f;->h()LY1/f;

    move-result-object v5

    if-eqz v5, :cond_e1

    invoke-static {p1}, LY1/f;->i(Ljava/lang/String;)Z

    move-result p1
    :try_end_d8
    .catch Ljava/lang/Exception; {:try_start_ce .. :try_end_d8} :catch_d9

    goto :goto_e2

    :catch_d9
    move-exception p1

    const-string v5, "RemoteUnlockViewModel"

    const-string v6, "\u83b7\u53d6\u95e8\u9501\u8fdc\u7a0b\u5728\u7ebf\u72b6\u6001\u5931\u8d25"

    invoke-static {v5, v6, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_e1
    move p1, v1

    :goto_e2
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iget-object v6, v2, Lc2/e;->i:Landroidx/lifecycle/z;

    invoke-virtual {v6, v5}, Landroidx/lifecycle/z;->i(Ljava/lang/Object;)V

    if-eqz v4, :cond_f0

    if-eqz p1, :cond_f0

    move v1, v3

    :cond_f0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object v1, v2, Lc2/e;->j:Landroidx/lifecycle/z;

    invoke-virtual {v1, p1}, Landroidx/lifecycle/z;->i(Ljava/lang/Object;)V

    if-nez v0, :cond_102

    iget-object p1, v2, Lc2/e;->k:Landroidx/lifecycle/z;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroidx/lifecycle/z;->i(Ljava/lang/Object;)V

    :cond_102
    new-instance p1, LH1/b;

    iget-object v0, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->y:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->z:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->A:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->B:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->C:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->D:Landroid/widget/Button;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, LH1/b;->a:Ljava/lang/Object;

    iput-object v1, p1, LH1/b;->b:Ljava/lang/Object;

    iput-object v2, p1, LH1/b;->c:Ljava/lang/Object;

    iput-object v3, p1, LH1/b;->d:Ljava/lang/Object;

    iput-object v4, p1, LH1/b;->e:Ljava/lang/Object;

    iput-object v5, p1, LH1/b;->f:Ljava/lang/Object;

    new-instance v0, LS1/J0;

    invoke-direct {v0, p0}, LS1/J0;-><init>(Lf/g;)V

    iput-object v0, p1, LH1/b;->g:Ljava/lang/Object;

    iget-object v0, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->x:Lc2/e;

    iget-object v1, v0, Lc2/e;->f:Landroidx/lifecycle/z;

    new-instance v2, LS1/t1;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, LS1/t1;-><init>(LH1/b;I)V

    invoke-virtual {v1, p0, v2}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    new-instance v1, LS1/t1;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, LS1/t1;-><init>(LH1/b;I)V

    iget-object v2, v0, Lc2/e;->e:Landroidx/lifecycle/z;

    invoke-virtual {v2, p0, v1}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    new-instance v1, LS1/t1;

    const/4 v2, 0x2

    invoke-direct {v1, p1, v2}, LS1/t1;-><init>(LH1/b;I)V

    iget-object v2, v0, Lc2/e;->h:Landroidx/lifecycle/z;

    invoke-virtual {v2, p0, v1}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    new-instance v1, LS1/t1;

    const/4 v2, 0x3

    invoke-direct {v1, p1, v2}, LS1/t1;-><init>(LH1/b;I)V

    iget-object v2, v0, Lc2/e;->i:Landroidx/lifecycle/z;

    invoke-virtual {v2, p0, v1}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    new-instance v1, LS1/t1;

    const/4 v2, 0x4

    invoke-direct {v1, p1, v2}, LS1/t1;-><init>(LH1/b;I)V

    iget-object v2, v0, Lc2/e;->j:Landroidx/lifecycle/z;

    invoke-virtual {v2, p0, v1}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    new-instance v1, LS1/t1;

    const/4 v2, 0x5

    invoke-direct {v1, p1, v2}, LS1/t1;-><init>(LH1/b;I)V

    iget-object v2, v0, Lc2/e;->k:Landroidx/lifecycle/z;

    invoke-virtual {v2, p0, v1}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    new-instance v1, LS1/t1;

    const/4 v2, 0x6

    invoke-direct {v1, p1, v2}, LS1/t1;-><init>(LH1/b;I)V

    iget-object p1, v0, Lc2/e;->l:Landroidx/lifecycle/z;

    invoke-virtual {p1, p0, v1}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    new-instance p1, LA0/d;

    const/4 v0, 0x7

    invoke-direct {p1, v0, p0}, LA0/d;-><init>(ILjava/lang/Object;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->E:LA0/d;

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "com.macronum.bledemo.LOCK_STATUS_UPDATED"

    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_194

    iget-object v0, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->E:LA0/d;

    const/4 v1, 0x4

    invoke-virtual {p0, v0, p1, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_199

    :cond_194
    iget-object v0, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->E:LA0/d;

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :goto_199
    return-void

    :cond_19a
    :goto_19a
    const-string p1, "\u8bbe\u5907\u4fe1\u606f\u9519\u8bef"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lf/g;->onDestroy()V

    iget-object v0, p0, Lcom/macronum/bledemo/ui/RemoteUnlockActivity;->E:LA0/d;

    if-eqz v0, :cond_a

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_a
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

