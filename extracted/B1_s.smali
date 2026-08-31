.class public final LB1/s;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lh0/e;)V
    .registers 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LB1/s;->b:Ljava/lang/Object;

    .line 6
    new-instance p1, Lh0/d;

    invoke-direct {p1}, Lh0/d;-><init>()V

    iput-object p1, p0, LB1/s;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-boolean p2, p0, LB1/s;->a:Z

    .line 9
    iput-object p1, p0, LB1/s;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(ZLjava/lang/Integer;Ljava/lang/String;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-boolean p1, p0, LB1/s;->a:Z

    .line 3
    iput-object p2, p0, LB1/s;->c:Ljava/lang/Object;

    if-eqz p3, :cond_a

    goto :goto_c

    .line 4
    :cond_a
    const-string p3, "\u672a\u77e5"

    :goto_c
    iput-object p3, p0, LB1/s;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 5

    iget-object v0, p0, LB1/s;->b:Ljava/lang/Object;

    invoke-interface {v0}, Landroidx/lifecycle/s;->e()Landroidx/lifecycle/u;

    move-result-object v1

    iget-object v2, v1, Landroidx/lifecycle/u;->c:Landroidx/lifecycle/n;

    sget-object v3, Landroidx/lifecycle/n;->d:Landroidx/lifecycle/n;

    if-ne v2, v3, :cond_35

    new-instance v2, Landroidx/savedstate/Recreator;

    invoke-direct {v2, v0}, Landroidx/savedstate/Recreator;-><init>(Lh0/e;)V

    invoke-virtual {v1, v2}, Landroidx/lifecycle/u;->a(Landroidx/lifecycle/r;)V

    iget-object v0, p0, LB1/s;->c:Ljava/lang/Object;

    check-cast v0, Lh0/d;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v2, v0, Lh0/d;->a:Z

    if-nez v2, :cond_2d

    new-instance v2, Lh0/a;

    invoke-direct {v2, v0}, Lh0/a;-><init>(Lh0/d;)V

    invoke-virtual {v1, v2}, Landroidx/lifecycle/u;->a(Landroidx/lifecycle/r;)V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lh0/d;->a:Z

    iput-boolean v1, p0, LB1/s;->a:Z

    return-void

    :cond_2d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SavedStateRegistry was already attached."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_35
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Restarter must be created only during owner\'s initialization stage"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public b(Landroid/os/Bundle;)V
    .registers 5

    iget-boolean v0, p0, LB1/s;->a:Z

    if-nez v0, :cond_7

    invoke-virtual {p0}, LB1/s;->a()V

    :cond_7
    iget-object v0, p0, LB1/s;->b:Ljava/lang/Object;

    invoke-interface {v0}, Landroidx/lifecycle/s;->e()Landroidx/lifecycle/u;

    move-result-object v0

    iget-object v1, v0, Landroidx/lifecycle/u;->c:Landroidx/lifecycle/n;

    sget-object v2, Landroidx/lifecycle/n;->f:Landroidx/lifecycle/n;

    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gez v1, :cond_43

    iget-object v0, p0, LB1/s;->c:Ljava/lang/Object;

    check-cast v0, Lh0/d;

    iget-boolean v1, v0, Lh0/d;->a:Z

    if-eqz v1, :cond_3b

    iget-boolean v1, v0, Lh0/d;->b:Z

    if-nez v1, :cond_33

    if-eqz p1, :cond_2c

    const-string v1, "androidx.lifecycle.BundlableSavedStateRegistry.key"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    goto :goto_2d

    :cond_2c
    const/4 p1, 0x0

    :goto_2d
    iput-object p1, v0, Lh0/d;->e:Landroid/os/Parcelable;

    const/4 p1, 0x1

    iput-boolean p1, v0, Lh0/d;->b:Z

    return-void

    :cond_33
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "SavedStateRegistry was already restored."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "You must call performAttach() before calling performRestore(Bundle)."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_43
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "performRestore cannot be called when owner is "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Landroidx/lifecycle/u;->c:Landroidx/lifecycle/n;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c(Landroid/os/Bundle;)V
    .registers 6

    const-string v0, "outBundle"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/k;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, LB1/s;->c:Ljava/lang/Object;

    check-cast v0, Lh0/d;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iget-object v2, v0, Lh0/d;->e:Landroid/os/Parcelable;

    check-cast v2, Landroid/os/Bundle;

    if-eqz v2, :cond_1a

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_1a
    iget-object v0, v0, Lh0/d;->d:Ljava/lang/Object;

    check-cast v0, Ll/f;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ll/d;

    invoke-direct {v2, v0}, Ll/d;-><init>(Ll/f;)V

    iget-object v0, v0, Ll/f;->e:Ljava/util/WeakHashMap;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v2, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2d
    invoke-virtual {v2}, Ll/d;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-virtual {v2}, Ll/d;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh0/c;

    invoke-interface {v0}, Lh0/c;->a()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_2d

    :cond_4d
    invoke-virtual {v1}, Landroid/os/BaseBundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_58

    const-string v0, "androidx.lifecycle.BundlableSavedStateRegistry.key"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_58
    return-void
.end method

