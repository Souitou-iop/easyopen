.class public Lcom/macronum/bledemo/MainActivity;
.super Lf/g;
.source "SourceFile"


# static fields
.field public static final synthetic z0:I


# instance fields
.field public A:Landroid/widget/ImageButton;

.field public B:Landroid/widget/ImageButton;

.field public C:Landroid/widget/ImageButton;

.field public D:Landroid/view/View;

.field public E:Ly1/F;

.field public F:Lz1/e;

.field public final G:Ljava/util/ArrayList;

.field public final H:Ljava/util/HashSet;

.field public I:Ly1/A;

.field public J:LD1/f;

.field public K:Ly1/D;

.field public final L:Landroid/os/Handler;

.field public M:LC0/t;

.field public N:LA0/d;

.field public O:J

.field public P:Z

.field public final Q:LD/h;

.field public final R:Landroid/os/Handler;

.field public S:LA1/h;

.field public final T:Ljava/util/HashMap;

.field public final U:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public V:Lc2/d;

.field public W:Lc2/b;

.field public X:Lc2/c;

.field public Y:LS1/J0;

.field public Z:Lb2/t;

.field public a0:LI2/e;

.field public b0:LS1/O0;

.field public c0:LC0/i;

.field public d0:LS1/v1;

.field public e0:LC0/e;

.field public f0:LH1/b;

.field public g0:LI2/e;

.field public h0:LS1/j2;

.field public i0:LS1/Z1;

.field public j0:LS1/B;

.field public k0:LQ1/a;

.field public l0:LS1/b;

.field public m0:Lb2/t;

.field public n0:LF1/d;

.field public o0:Lb2/h;

.field public p0:LC0/c;

.field public q0:LK1/d;

.field public r0:LG1/d;

.field public s0:LG1/d;

.field public t0:LS1/a2;

.field public u0:LQ1/a;

.field public v0:LC1/b;

.field public w0:LN1/a;

.field public x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public x0:LB1/b;

.field public y:Landroidx/recyclerview/widget/RecyclerView;

.field public y0:Lb2/t;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 5

    invoke-direct {p0}, Lf/g;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->H:Ljava/util/HashSet;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->L:Landroid/os/Handler;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/macronum/bledemo/MainActivity;->O:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/macronum/bledemo/MainActivity;->P:Z

    new-instance v1, LD/h;

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, LD/h;-><init>(IZ)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->Q:LD/h;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->R:Landroid/os/Handler;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->T:Ljava/util/HashMap;

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->U:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static y(Lcom/macronum/bledemo/MainActivity;Ljava/lang/String;Z)V
    .registers 3

    iget-object p0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz p0, :cond_a

    if-eqz p1, :cond_a

    invoke-virtual {p0, p1, p2}, Lc2/d;->d(Ljava/lang/String;Z)V

    goto :goto_1a

    :cond_a
    const-string p2, "StatusUpdateHelper"

    if-nez p0, :cond_13

    const-string p0, "\u3010\u72b6\u6001\u66f4\u65b0\u3011mainViewModel\u4e3anull\uff0c\u65e0\u6cd5\u66f4\u65b0\u84dd\u7259\u5728\u7ebf\u72b6\u6001: lockMac="

    invoke-static {p0, p1, p2}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_13
    if-nez p1, :cond_1a

    const-string p0, "\u3010\u72b6\u6001\u66f4\u65b0\u3011lockMac\u4e3anull\uff0c\u65e0\u6cd5\u66f4\u65b0\u84dd\u7259\u5728\u7ebf\u72b6\u6001"

    invoke-static {p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1a
    :goto_1a
    return-void
.end method

.method public static z(Lcom/macronum/bledemo/MainActivity;)V
    .registers 11

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->Y:LS1/J0;

    iget-object p0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_d8

    if-eqz p0, :cond_d8

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "MainUIManager"

    const-string v3, "cache_timestamp"

    iget-object v4, v0, LS1/J0;->a:Lf/g;

    if-eqz v4, :cond_96

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    :try_start_19
    iget-object v0, v0, LS1/J0;->a:Lf/g;

    const-string v6, "remote_online_cache"

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-wide/16 v8, 0x0

    invoke-interface {v0, v3, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_96

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_96

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3e
    :goto_3e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_69

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_57

    goto :goto_3e

    :cond_57
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    instance-of v9, v6, Ljava/lang/Boolean;

    if-eqz v9, :cond_3e

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v1, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    goto :goto_3e

    :catch_67
    move-exception v0

    goto :goto_91

    :cond_69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    const-wide/16 v3, 0x64

    cmp-long v0, v8, v3

    if-lez v0, :cond_96

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u3010\u6027\u80fd\u8b66\u544a\u3011loadCachedRemoteOnlineStatus\u8017\u65f6\u8fc7\u957f: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, "ms, \u95e8\u9501\u6570\u91cf="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_90} :catch_67

    goto :goto_96

    :goto_91
    const-string v3, "\u52a0\u8f7d\u7f13\u5b58\u8fdc\u7a0b\u5728\u7ebf\u72b6\u6001\u5931\u8d25"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_96
    :goto_96
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_df

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v4, p0, Lc2/d;->e:LQ1/a;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, LQ1/a;->e(Ljava/lang/String;)Lcom/macronum/bledemo/model/DeviceState;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/macronum/bledemo/model/DeviceState;->setRemoteOnline(Z)Lcom/macronum/bledemo/model/DeviceState;

    invoke-virtual {v4}, LQ1/a;->f()V

    goto :goto_a4

    :cond_d4
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    goto :goto_df

    :cond_d8
    const-string p0, "CacheHelper"

    const-string v0, "\u3010\u91cd\u6784\u3011uiManager\u6216mainViewModel\u672a\u521d\u59cb\u5316\uff0c\u8df3\u8fc7\u7f13\u5b58\u52a0\u8f7d"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_df
    :goto_df
    return-void
.end method


# virtual methods
.method public final A()V
    .registers 6

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->x0:LB1/b;

    if-nez v0, :cond_b

    new-instance v0, LB1/b;

    invoke-direct {v0, p0}, LB1/b;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->x0:LB1/b;

    :cond_b
    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->x0:LB1/b;

    iget-object v1, v0, LB1/b;->c:Ljava/lang/Object;

    check-cast v1, Lcom/macronum/bledemo/MainActivity;

    const v2, 0x7f080169

    invoke-virtual {v1, v2}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f08015c

    invoke-virtual {v1, v3}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v2, :cond_43

    if-nez v1, :cond_24

    goto :goto_43

    :cond_24
    :try_start_24
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_2a} :catch_43

    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    new-instance v4, LS1/K0;

    invoke-direct {v4, v0, v1, v3}, LS1/K0;-><init>(LB1/b;Landroid/view/View;I)V

    sget-object v1, LM/W;->a:Ljava/util/WeakHashMap;

    invoke-static {v2, v4}, LM/J;->u(Landroid/view/View;LM/t;)V

    invoke-static {v2}, LM/H;->c(Landroid/view/View;)V

    new-instance v1, LA1/m;

    const/16 v3, 0x18

    invoke-direct {v1, v3, v0}, LA1/m;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v2, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :catch_43
    :cond_43
    :goto_43
    return-void
.end method

.method public final B(Ljava/util/ArrayList;)Lc2/a;
    .registers 6

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->u0:LQ1/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_55

    iget-object v2, v0, LQ1/a;->b:Ljava/lang/Object;

    check-cast v2, Lc2/b;

    if-eqz v2, :cond_4d

    iget-object v3, v0, LQ1/a;->d:Ljava/lang/Object;

    check-cast v3, Lc2/d;

    if-nez v3, :cond_12

    goto :goto_4d

    :cond_12
    invoke-virtual {v2, p1}, Lc2/b;->f(Ljava/util/ArrayList;)Lc2/a;

    move-result-object v1

    iget-object p1, v0, LQ1/a;->d:Ljava/lang/Object;

    check-cast p1, Lc2/d;

    iget-object v2, v1, Lc2/a;->a:Ljava/util/HashMap;

    invoke-virtual {p1, v2}, Lc2/d;->g(Ljava/util/HashMap;)V

    iget-object p1, v0, LQ1/a;->d:Ljava/lang/Object;

    check-cast p1, Lc2/d;

    iget-object v3, v1, Lc2/a;->b:Ljava/util/HashMap;

    invoke-virtual {p1, v3}, Lc2/d;->e(Ljava/util/HashMap;)V

    iget-object p1, v0, LQ1/a;->d:Ljava/lang/Object;

    check-cast p1, Lc2/d;

    iget-object v3, v1, Lc2/a;->c:Ljava/util/HashMap;

    invoke-virtual {p1, v3}, Lc2/d;->f(Ljava/util/HashMap;)V

    iget-object p1, v0, LQ1/a;->d:Ljava/lang/Object;

    check-cast p1, Lc2/d;

    iget-object v0, v1, Lc2/a;->d:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v0, :cond_49

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iget-object p1, p1, Lc2/d;->m:Landroidx/lifecycle/z;

    invoke-virtual {p1, v3}, Landroidx/lifecycle/z;->g(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    :cond_49
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    goto :goto_54

    :cond_4d
    :goto_4d
    const-string p1, "PermissionMapBuilder"

    const-string v0, "ViewModel\u672a\u521d\u59cb\u5316\uff0c\u8df3\u8fc7\u6743\u9650\u6620\u5c04"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_54
    return-object v1

    :cond_55
    const-string p1, "MainActivity"

    const-string v0, "PermissionMapBuilder\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u5efa\u7acb\u6743\u9650\u6620\u5c04"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1
.end method

.method public final C()Ljava/util/Map;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_15

    iget-object v0, v0, Lc2/d;->h:Landroidx/lifecycle/z;

    invoke-virtual {v0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_f

    goto :goto_1a

    :cond_f
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_1a

    :cond_15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_1a
    return-object v0
.end method

.method public final D()Ljava/util/Map;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_15

    iget-object v0, v0, Lc2/d;->n:Landroidx/lifecycle/z;

    invoke-virtual {v0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_f

    goto :goto_1a

    :cond_f
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_1a

    :cond_15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_1a
    return-object v0
.end method

.method public final E()Ljava/util/Map;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_15

    iget-object v0, v0, Lc2/d;->l:Landroidx/lifecycle/z;

    invoke-virtual {v0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_f

    goto :goto_1a

    :cond_f
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_1a

    :cond_15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_1a
    return-object v0
.end method

.method public final F()Ljava/util/Map;
    .registers 5

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_4b

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iget-object v0, v0, Lc2/d;->e:LQ1/a;

    iget-object v0, v0, LQ1/a;->d:Ljava/lang/Object;

    check-cast v0, Landroidx/lifecycle/z;

    invoke-virtual {v0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_20

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_26

    :cond_20
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    move-object v0, v2

    :goto_26
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/macronum/bledemo/model/DeviceState;

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/DeviceState;->getLockMac()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2e

    :cond_4a
    return-object v1

    :cond_4b
    if-eqz v0, :cond_5e

    iget-object v0, v0, Lc2/d;->g:Landroidx/lifecycle/z;

    invoke-virtual {v0}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_58

    goto :goto_63

    :cond_58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_63

    :cond_5e
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_63
    return-object v0
.end method

.method public final G(Landroid/content/Intent;)V
    .registers 10

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->p0:LC0/c;

    if-eqz v0, :cond_da

    iget-object v1, v0, LC0/c;->e:Ljava/lang/Object;

    check-cast v1, LK1/e;

    if-nez v1, :cond_13

    const-string p1, "AppShortcutManager"

    const-string v0, "ShortcutCallback\u672a\u8bbe\u7f6e\uff0c\u65e0\u6cd5\u5904\u7406\u5feb\u6377\u65b9\u5f0f\u610f\u56fe"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e1

    :cond_13
    if-nez p1, :cond_17

    goto/16 :goto_e1

    :cond_17
    const-string v1, "unlock_all"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    const-string v4, "1"

    const-string v5, "true"

    const/4 v6, 0x1

    if-nez v3, :cond_38

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_38

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_37

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    :cond_37
    move v3, v6

    :cond_38
    const-string v1, "from_shortcut"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    if-nez v7, :cond_53

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_53

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_52

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_53

    :cond_52
    move v7, v6

    :cond_53
    const-string v1, "from_nfc"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    :try_start_5e
    iget-object v5, v0, LC0/c;->e:Ljava/lang/Object;

    check-cast v5, LK1/e;

    iget-object v5, v5, LK1/e;->d:Ljava/lang/Object;

    check-cast v5, Ly1/I;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_69} :catch_77

    :try_start_69
    iget-object v5, v5, Ly1/I;->a:Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getReferrer()Landroid/net/Uri;

    move-result-object v5
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_6f} :catch_70

    goto :goto_71

    :catch_70
    move-object v5, v4

    :goto_71
    if-eqz v5, :cond_77

    :try_start_73
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_77} :catch_77

    :catch_77
    :cond_77
    if-eqz v2, :cond_b7

    const-string v5, "android.nfc.action.NDEF_DISCOVERED"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_84

    :goto_81
    move v1, v6

    move v3, v1

    goto :goto_b7

    :cond_84
    const-string v5, "android.nfc.action.TAG_DISCOVERED"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8d

    goto :goto_81

    :cond_8d
    const-string v5, "android.nfc.action.TECH_DISCOVERED"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_96

    goto :goto_81

    :cond_96
    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_a9

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object p1

    const-string v5, "application/com.macronum.bledemo.unlockall"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a9

    goto :goto_81

    :cond_a9
    const-string p1, "android.intent.action.MAIN"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b7

    const-string p1, "android.intent.action.VIEW"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    :cond_b7
    :goto_b7
    if-eqz v4, :cond_c3

    const-string p1, "android-app://com.android.nfc"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c3

    move v1, v6

    goto :goto_c4

    :cond_c3
    move v6, v3

    :goto_c4
    if-eqz v6, :cond_e1

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {p1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, LS1/W1;

    invoke-direct {v2, v0, v1, v7}, LS1/W1;-><init>(LC0/c;ZZ)V

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_e1

    :cond_da
    const-string p1, "MainActivity"

    const-string v0, "ShortcutManager\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u5904\u7406\u6279\u91cf\u5f00\u9501Intent"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e1
    :goto_e1
    return-void
.end method

.method public final H()V
    .registers 12

    new-instance v0, LC0/t;

    new-instance v1, Ly1/H;

    invoke-direct {v1, p0}, Ly1/H;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/4 v2, 0x4

    invoke-direct {v0, p0, v2, v1}, LC0/t;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    new-instance v1, Lb2/t;

    new-instance v2, LT1/a;

    const/4 v3, 0x2

    invoke-direct {v2, v0, v3}, LT1/a;-><init>(LC0/t;I)V

    invoke-direct {v1, p0, v2}, Lb2/t;-><init>(Lcom/macronum/bledemo/MainActivity;LT1/a;)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->Z:Lb2/t;

    new-instance v1, LS1/A;

    invoke-direct {v1, p0}, LS1/A;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->U:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v3, LT1/b;

    invoke-direct {v3, v0, v2}, LT1/b;-><init>(LC0/t;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    iput-object v3, v1, LS1/A;->d:Ljava/lang/Object;

    new-instance v1, LI2/e;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    iput-boolean v2, v1, LI2/e;->a:Z

    iput-object p0, v1, LI2/e;->b:Ljava/lang/Object;

    new-instance v2, LA0/d;

    const/4 v3, 0x2

    invoke-direct {v2, v3, v1}, LA0/d;-><init>(ILjava/lang/Object;)V

    iput-object v2, v1, LI2/e;->c:Ljava/lang/Object;

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->a0:LI2/e;

    new-instance v2, Lb2/v;

    const/4 v3, 0x6

    invoke-direct {v2, p0, v3}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    iput-object v2, v1, LI2/e;->d:Ljava/lang/Object;

    new-instance v2, Lb2/v;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v3}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    iput-object v2, v1, LI2/e;->e:Ljava/lang/Object;

    new-instance v1, LS1/a2;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x0

    iput-boolean v2, v1, LS1/a2;->f:Z

    iput-boolean v2, v1, LS1/a2;->g:Z

    iput-boolean v2, v1, LS1/a2;->h:Z

    iput-boolean v2, v1, LS1/a2;->i:Z

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->t0:LS1/a2;

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->g0:LI2/e;

    iput-object v3, v1, LS1/a2;->a:LI2/e;

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    iput-object v3, v1, LS1/a2;->b:Lc2/c;

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->d0:LS1/v1;

    iput-object v3, v1, LS1/a2;->c:LS1/v1;

    invoke-virtual {v1}, LS1/a2;->a()V

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->t0:LS1/a2;

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    iput-object v3, v1, LS1/a2;->d:Ljava/util/ArrayList;

    invoke-virtual {v1}, LS1/a2;->a()V

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->t0:LS1/a2;

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->H:Ljava/util/HashSet;

    iput-object v3, v1, LS1/a2;->e:Ljava/util/HashSet;

    new-instance v3, Lb2/t;

    new-instance v5, Ly1/H;

    invoke-direct {v5, p0}, Ly1/H;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    new-instance v6, Lb2/v;

    const/16 v4, 0x8

    invoke-direct {v6, p0, v4}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    new-instance v7, Ly1/G;

    invoke-direct {v7, p0}, Ly1/G;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v8, 0xf

    const/4 v9, 0x0

    move-object v4, v3

    invoke-direct/range {v4 .. v9}, Lb2/t;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IZ)V

    iput-object v3, v1, LS1/a2;->j:Lb2/t;

    invoke-virtual {v1}, LS1/a2;->a()V

    new-instance v1, LS1/O0;

    invoke-direct {v1, p0}, LS1/O0;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->b0:LS1/O0;

    new-instance v1, LK1/b;

    invoke-direct {v1, p0}, LK1/b;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    new-instance v3, LT1/a;

    const/4 v4, 0x1

    invoke-direct {v3, v0, v4}, LT1/a;-><init>(LC0/t;I)V

    iput-object v3, v1, LK1/b;->e:Ljava/lang/Object;

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v3

    new-instance v4, LP/b;

    const/4 v5, 0x2

    invoke-direct {v4, v5, v1}, LP/b;-><init>(ILjava/lang/Object;)V

    iput-object v4, v3, LB1/c;->g:LP/b;

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v1

    invoke-virtual {v1}, LZ1/a;->i()Z

    move-result v3

    if-eqz v3, :cond_d0

    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Ly1/n;

    const/4 v5, 0x5

    invoke-direct {v4, p0, v5, v1}, Ly1/n;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_fb

    :cond_d0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v3, "android_id"

    invoke-static {v1, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_fb

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_fb

    :try_start_e2
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v3

    invoke-virtual {v3, p0}, LB1/c;->g(Landroid/content/Context;)V

    iput-object v1, v3, LB1/c;->e:Ljava/lang/String;

    invoke-static {}, LN1/d;->b()LN1/d;

    move-result-object v3

    invoke-virtual {v3, p0, v1}, LN1/d;->c(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_e2 .. :try_end_f2} :catch_f3

    goto :goto_fb

    :catch_f3
    move-exception v1

    const-string v3, "MainActivity"

    const-string v4, "API\u5ba2\u6237\u7aef\u521d\u59cb\u5316\u5931\u8d25"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_fb
    :goto_fb
    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->v0:LC1/b;

    if-eqz v1, :cond_107

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v1

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->v0:LC1/b;

    iput-object v1, v3, LC1/b;->f:Ljava/lang/Object;

    :cond_107
    new-instance v1, LC0/i;

    invoke-direct {v1, p0}, LC0/i;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->c0:LC0/i;

    new-instance v1, LS1/v1;

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->J:LD1/f;

    new-instance v4, Ly1/E;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Ly1/E;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    new-instance v5, Lb2/v;

    const/4 v6, 0x2

    invoke-direct {v5, p0, v6}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    new-instance v6, Lb2/t;

    const/16 v7, 0xc

    invoke-direct {v6, v0, v5, v4, v7}, Lb2/t;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-direct {v1, v3, v6}, LS1/v1;-><init>(LD1/f;Lb2/t;)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->d0:LS1/v1;

    new-instance v1, LC0/e;

    const/4 v3, 0x4

    invoke-direct {v1, v3}, LC0/e;-><init>(I)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->e0:LC0/e;

    iget-object v1, v0, LC0/t;->d:Ljava/lang/Object;

    check-cast v1, Lcom/macronum/bledemo/MainActivity;

    invoke-static {v1}, LG1/d;->g(Landroid/app/Activity;)LG1/d;

    move-result-object v1

    new-instance v3, LS1/A;

    const/16 v4, 0xe

    invoke-direct {v3, v4, v0}, LS1/A;-><init>(ILjava/lang/Object;)V

    iput-object v3, v1, LG1/d;->i:Ljava/lang/Object;

    new-instance v1, Ly1/F;

    invoke-direct {v1, p0}, Ly1/F;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const-class v3, LN1/a;

    monitor-enter v3

    :try_start_14b
    sget-object v4, LN1/a;->h:LN1/a;

    if-nez v4, :cond_162

    new-instance v4, LN1/a;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, LN1/a;-><init>(I)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v4, LN1/a;->f:Ljava/lang/Object;

    sput-object v4, LN1/a;->h:LN1/a;

    goto :goto_162

    :catchall_15f
    move-exception v0

    goto/16 :goto_3d7

    :cond_162
    :goto_162
    sget-object v4, LN1/a;->h:LN1/a;
    :try_end_164
    .catchall {:try_start_14b .. :try_end_164} :catchall_15f

    monitor-exit v3

    iget-object v3, v0, LC0/t;->d:Ljava/lang/Object;

    check-cast v3, Lcom/macronum/bledemo/MainActivity;

    iget-object v5, v4, LN1/a;->d:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    const-string v6, "DirectDetectionManager"

    if-eqz v5, :cond_177

    const-string v3, "DirectDetectionManager\u5df2\u521d\u59cb\u5316"

    invoke-static {v6, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1b0

    :cond_177
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iput-object v3, v4, LN1/a;->d:Ljava/lang/Object;

    invoke-static {}, LA1/r;->e()LA1/r;

    move-result-object v3

    iput-object v3, v4, LN1/a;->e:Ljava/lang/Object;

    iget-object v3, v4, LN1/a;->d:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    if-nez v3, :cond_18f

    const-string v3, "Context\u4e3anull\uff0c\u65e0\u6cd5\u6ce8\u518c\u5e7f\u64ad\u63a5\u6536\u5668"

    invoke-static {v6, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1b0

    :cond_18f
    new-instance v3, LA0/d;

    const/4 v5, 0x1

    invoke-direct {v3, v5, v4}, LA0/d;-><init>(ILjava/lang/Object;)V

    iput-object v3, v4, LN1/a;->g:Ljava/lang/Object;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v5, "com.macronum.bledemo.LOCK_STATUS_UPDATED"

    invoke-direct {v3, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    :try_start_19e
    iget-object v5, v4, LN1/a;->d:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    iget-object v7, v4, LN1/a;->g:Ljava/lang/Object;

    check-cast v7, LA0/d;

    invoke-virtual {v5, v7, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_1a9
    .catch Ljava/lang/Exception; {:try_start_19e .. :try_end_1a9} :catch_1aa

    goto :goto_1b0

    :catch_1aa
    move-exception v3

    const-string v5, "\u6ce8\u518c\u5e7f\u64ad\u63a5\u6536\u5668\u5931\u8d25"

    invoke-static {v6, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1b0
    new-instance v3, LT1/c;

    invoke-direct {v3, v0, v1}, LT1/c;-><init>(LC0/t;Ly1/F;)V

    iget-object v1, v4, LN1/a;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_1ba
    iget-object v5, v4, LN1/a;->f:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1d2

    iget-object v5, v4, LN1/a;->f:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v3, v4, LN1/a;->f:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    :cond_1d2
    monitor-exit v1
    :try_end_1d3
    .catchall {:try_start_1ba .. :try_end_1d3} :catchall_3d4

    iput-object v4, p0, Lcom/macronum/bledemo/MainActivity;->w0:LN1/a;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->c0:LC0/i;

    new-instance v3, Lb2/v;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v4}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    new-instance v4, Lb2/v;

    const/4 v5, 0x4

    invoke-direct {v4, p0, v5}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    new-instance v5, LS1/b2;

    const/4 v6, 0x5

    invoke-direct {v5, v6, v3}, LS1/b2;-><init>(ILjava/lang/Object;)V

    iput-object v5, v1, LC0/i;->d:Ljava/lang/Object;

    new-instance v3, LT1/a;

    const/4 v5, 0x0

    invoke-direct {v3, v0, v5}, LT1/a;-><init>(LC0/t;I)V

    iput-object v3, v1, LC0/i;->e:Ljava/lang/Object;

    new-instance v3, LS1/Q1;

    const/16 v5, 0x9

    invoke-direct {v3, v0, v5, v4}, LS1/Q1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    iput-object v3, v1, LC0/i;->f:Ljava/lang/Object;

    new-instance v0, Ly1/F;

    invoke-direct {v0, p0}, Ly1/F;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->E:Ly1/F;

    invoke-virtual {p0}, Lcom/macronum/bledemo/MainActivity;->I()V

    new-instance v0, LH1/b;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->H:Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, LH1/b;->f:Ljava/lang/Object;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->f0:LH1/b;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    iput-object v1, v0, LH1/b;->a:Ljava/lang/Object;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->J:LD1/f;

    iput-object v1, v0, LH1/b;->b:Ljava/lang/Object;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->d0:LS1/v1;

    iput-object v1, v0, LH1/b;->c:Ljava/lang/Object;

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v1

    iput-object v1, v0, LH1/b;->d:Ljava/lang/Object;

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->f0:LH1/b;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->I:Ly1/A;

    iput-object v1, v0, LH1/b;->e:Ljava/lang/Object;

    new-instance v1, LS1/p;

    new-instance v3, LU1/a;

    invoke-direct {v3, p0}, LU1/a;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v4, 0xc

    invoke-direct {v1, v4, v3}, LS1/p;-><init>(ILjava/lang/Object;)V

    iput-object v1, v0, LH1/b;->g:Ljava/lang/Object;

    new-instance v0, LI2/e;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v3, 0x0

    iput-boolean v2, v0, LI2/e;->a:Z

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->g0:LI2/e;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    iput-object v1, v0, LI2/e;->b:Ljava/lang/Object;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    iput-object v1, v0, LI2/e;->c:Ljava/lang/Object;

    invoke-static {}, LN1/f;->k()LN1/f;

    move-result-object v1

    iput-object v1, v0, LI2/e;->d:Ljava/lang/Object;

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->g0:LI2/e;

    new-instance v1, LS1/O0;

    invoke-direct {v1, p0}, LS1/O0;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v1, v0, LI2/e;->e:Ljava/lang/Object;

    new-instance v0, LQ1/a;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->k0:LQ1/a;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->g0:LI2/e;

    iput-object v1, v0, LQ1/a;->b:Ljava/lang/Object;

    new-instance v1, Lb2/w;

    iget-object v5, p0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    new-instance v6, Ly1/I;

    invoke-direct {v6, p0}, Ly1/I;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/4 v7, 0x4

    invoke-direct {v1, v5, v7, v6}, Lb2/w;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    iput-object v1, v0, LQ1/a;->d:Ljava/lang/Object;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, LS1/b;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-wide v3, v0, LS1/b;->c:J

    iput-wide v3, v0, LS1/b;->d:J

    iput-object p0, v0, LS1/b;->a:Lcom/macronum/bledemo/MainActivity;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v1, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, v0, LS1/b;->b:Landroid/os/Handler;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->l0:LS1/b;

    new-instance v1, LK1/e;

    new-instance v6, Ly1/J;

    invoke-direct {v6, p0}, Ly1/J;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v7, 0xc

    invoke-direct {v1, v7, v6}, LK1/e;-><init>(ILjava/lang/Object;)V

    iput-object v1, v0, LS1/b;->e:LK1/e;

    new-instance v0, Lb2/t;

    const/16 v1, 0xb

    const/4 v6, 0x0

    invoke-direct {v0, v1, v6}, Lb2/t;-><init>(IZ)V

    iput-object p0, v0, Lb2/t;->d:Ljava/lang/Object;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v1, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, v0, Lb2/t;->e:Ljava/lang/Object;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->m0:Lb2/t;

    new-instance v1, LS1/p;

    new-instance v6, Ly1/H;

    invoke-direct {v6, p0}, Ly1/H;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v7, 0xd

    invoke-direct {v1, v7, v6}, LS1/p;-><init>(ILjava/lang/Object;)V

    iput-object v1, v0, Lb2/t;->f:Ljava/lang/Object;

    new-instance v0, LF1/d;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, LF1/d;->a:Ljava/lang/Object;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->n0:LF1/d;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    iput-object v1, v0, LF1/d;->b:Ljava/lang/Object;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    iput-object v1, v0, LF1/d;->c:Ljava/lang/Object;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    iput-object v1, v0, LF1/d;->d:Ljava/lang/Object;

    new-instance v1, LA1/a;

    new-instance v6, LU1/a;

    invoke-direct {v6, p0}, LU1/a;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/4 v7, 0x5

    invoke-direct {v1, v5, v7, v6}, LA1/a;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    iput-object v1, v0, LF1/d;->e:Ljava/lang/Object;

    new-instance v0, Lb2/h;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-wide v3, v0, Lb2/h;->a:J

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, v0, Lb2/h;->b:Ljava/lang/Object;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->o0:Lb2/h;

    invoke-static {}, LR1/b;->a()LR1/b;

    move-result-object v0

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->o0:Lb2/h;

    iput-object v1, v0, LR1/b;->c:Ljava/lang/Object;

    new-instance v0, LD/h;

    new-instance v5, LS1/O0;

    invoke-direct {v5, p0}, LS1/O0;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v6, 0xc

    invoke-direct {v0, v6, v5}, LD/h;-><init>(ILjava/lang/Object;)V

    iput-object v0, v1, Lb2/h;->c:Ljava/lang/Object;

    new-instance v0, LC0/c;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, LC0/c;-><init>(I)V

    iput-object p0, v0, LC0/c;->d:Ljava/lang/Object;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->p0:LC0/c;

    new-instance v1, LK1/e;

    new-instance v5, Ly1/I;

    invoke-direct {v5, p0}, Ly1/I;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v6, 0xd

    invoke-direct {v1, v6, v5}, LK1/e;-><init>(ILjava/lang/Object;)V

    iput-object v1, v0, LC0/c;->e:Ljava/lang/Object;

    new-instance v0, LS1/Z1;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-boolean v2, v0, LS1/Z1;->g:Z

    iput-boolean v2, v0, LS1/Z1;->h:Z

    iput-wide v3, v0, LS1/Z1;->i:J

    iput-object p0, v0, LS1/Z1;->a:Lcom/macronum/bledemo/MainActivity;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, v0, LS1/Z1;->f:Landroid/os/Handler;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->i0:LS1/Z1;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->d0:LS1/v1;

    iput-object v1, v0, LS1/Z1;->b:LS1/v1;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->f0:LH1/b;

    iput-object v1, v0, LS1/Z1;->c:LH1/b;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    iput-object v1, v0, LS1/Z1;->d:Lc2/c;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->M:LC0/t;

    iput-object v1, v0, LS1/Z1;->e:LC0/t;

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->i0:LS1/Z1;

    new-instance v1, Lb2/t;

    iget-object v6, p0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/macronum/bledemo/MainActivity;->H:Ljava/util/HashSet;

    new-instance v8, LU1/a;

    invoke-direct {v8, p0}, LU1/a;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v9, 0xe

    const/4 v10, 0x0

    move-object v5, v1

    invoke-direct/range {v5 .. v10}, Lb2/t;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IZ)V

    iput-object v1, v0, LS1/Z1;->j:Lb2/t;

    new-instance v0, LS1/B;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-boolean v2, v0, LS1/B;->b:Z

    iput-wide v3, v0, LS1/B;->c:J

    iput-object p0, v0, LS1/B;->a:Lcom/macronum/bledemo/MainActivity;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->j0:LS1/B;

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->j0:LS1/B;

    new-instance v1, LR1/e;

    new-instance v2, LS1/O0;

    invoke-direct {v2, p0}, LS1/O0;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v3, 0xd

    invoke-direct {v1, v3, v2}, LR1/e;-><init>(ILjava/lang/Object;)V

    iput-object v1, v0, LS1/B;->d:LR1/e;

    new-instance v0, LC1/b;

    invoke-direct {v0, p0}, LC1/b;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->v0:LC1/b;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->J:LD1/f;

    iput-object v1, v0, LC1/b;->e:Ljava/lang/Object;

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v0

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->v0:LC1/b;

    iput-object v0, v1, LC1/b;->f:Ljava/lang/Object;

    new-instance v0, LQ1/a;

    new-instance v2, Ly1/H;

    invoke-direct {v2, p0}, Ly1/H;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, LQ1/a;->b:Ljava/lang/Object;

    iput-object v2, v0, LQ1/a;->d:Ljava/lang/Object;

    iput-object v0, v1, LC1/b;->g:Ljava/lang/Object;

    :try_start_3bd
    new-instance v0, LK1/d;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, LK1/d;-><init>(I)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->q0:LK1/d;

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->q0:LK1/d;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_3ca
    .catch Ljava/lang/Exception; {:try_start_3bd .. :try_end_3ca} :catch_3cb

    goto :goto_3d3

    :catch_3cb
    move-exception v0

    const-string v1, "MainActivity"

    const-string v2, "NFC\u7ec4\u4ef6\u521d\u59cb\u5316\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3d3
    return-void

    :catchall_3d4
    move-exception v0

    :try_start_3d5
    monitor-exit v1
    :try_end_3d6
    .catchall {:try_start_3d5 .. :try_end_3d6} :catchall_3d4

    throw v0

    :goto_3d7
    :try_start_3d7
    monitor-exit v3
    :try_end_3d8
    .catchall {:try_start_3d7 .. :try_end_3d8} :catchall_15f

    throw v0
.end method

.method public final I()V
    .registers 12

    new-instance v0, Lb2/t;

    invoke-direct {v0, p0}, Lb2/t;-><init>(Lf/g;)V

    const-class v1, Lc2/d;

    invoke-virtual {v0, v1}, Lb2/t;->p(Ljava/lang/Class;)Landroidx/lifecycle/S;

    move-result-object v1

    check-cast v1, Lc2/d;

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    const-class v1, Lc2/b;

    invoke-virtual {v0, v1}, Lb2/t;->p(Ljava/lang/Class;)Landroidx/lifecycle/S;

    move-result-object v1

    check-cast v1, Lc2/b;

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    const-class v1, Lc2/c;

    invoke-virtual {v0, v1}, Lb2/t;->p(Ljava/lang/Class;)Landroidx/lifecycle/S;

    move-result-object v0

    check-cast v0, Lc2/c;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    if-eqz v0, :cond_2d

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v1, :cond_2d

    :try_start_2b
    iput-object v1, v0, Lz1/e;->o:Lc2/d;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2d} :catch_2d

    :catch_2d
    :cond_2d
    new-instance v0, LG1/d;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, LG1/d;-><init>(I)V

    iput-object p0, v0, LG1/d;->d:Ljava/lang/Object;

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->r0:LG1/d;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    iput-object v1, v0, LG1/d;->e:Ljava/lang/Object;

    iget-object v8, p0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    iput-object v8, v0, LG1/d;->f:Ljava/lang/Object;

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->I:Ly1/A;

    iput-object v2, v0, LG1/d;->g:Ljava/lang/Object;

    iget-object v3, p0, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    iput-object v3, v0, LG1/d;->h:Ljava/lang/Object;

    new-instance v3, Lb2/v;

    const/16 v4, 0xe

    invoke-direct {v3, p0, v4}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    iput-object v3, v0, LG1/d;->i:Ljava/lang/Object;

    const-string v0, "MainActivity"

    if-eqz v2, :cond_57

    iput-object v2, v1, Lc2/b;->h:Ly1/A;

    goto :goto_5c

    :cond_57
    const-string v1, "\u3010\u91cd\u6784\u3011deviceManager\u672a\u521d\u59cb\u5316\uff0c\u7a0d\u540e\u8bbe\u7f6e"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_5c
    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v2

    iput-object v2, v1, Lc2/b;->i:LZ1/a;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v2

    iput-object v2, v1, Lc2/b;->j:LB1/c;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    new-instance v9, LY1/f;

    iget-object v10, p0, Lcom/macronum/bledemo/MainActivity;->H:Ljava/util/HashSet;

    new-instance v6, LU1/a;

    invoke-direct {v6, p0}, LU1/a;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/4 v7, 0x2

    move-object v2, v9

    move-object v3, p0

    move-object v4, v8

    move-object v5, v10

    invoke-direct/range {v2 .. v7}, LY1/f;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    iput-object v9, v1, Lc2/b;->k:LY1/f;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v2

    iput-object v2, v1, Lc2/c;->k:LB1/c;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v2

    iput-object v2, v1, Lc2/c;->l:LZ1/a;

    new-instance v1, LS1/J0;

    invoke-direct {v1, p0}, LS1/J0;-><init>(Lf/g;)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->Y:LS1/J0;

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    iput-object v2, v1, LS1/J0;->b:Lz1/e;

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-object v2, v1, LS1/J0;->c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    new-instance v1, LS1/j2;

    invoke-direct {v1, p0}, LS1/j2;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v1, p0, Lcom/macronum/bledemo/MainActivity;->h0:LS1/j2;

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->I:Ly1/A;

    iput-object v2, v1, LS1/j2;->b:Ly1/A;

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->J:LD1/f;

    iput-object v2, v1, LS1/j2;->c:LD1/f;

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->d0:LS1/v1;

    iput-object v2, v1, LS1/j2;->d:LS1/v1;

    iget-object v2, p0, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    iput-object v2, v1, LS1/j2;->e:Lz1/e;

    new-instance v2, LR1/e;

    new-instance v3, LS1/O0;

    invoke-direct {v3, p0}, LS1/O0;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v4, 0xe

    invoke-direct {v2, v4, v3}, LR1/e;-><init>(ILjava/lang/Object;)V

    iput-object v2, v1, LS1/j2;->v:LR1/e;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->n0:LF1/d;

    if-eqz v1, :cond_14c

    iget-object v0, v1, LF1/d;->e:Ljava/lang/Object;

    check-cast v0, LA1/a;

    const-string v2, "ViewModelObserverManager"

    if-nez v0, :cond_d8

    const-string v0, "ObserverCallback\u672a\u8bbe\u7f6e\uff0c\u65e0\u6cd5\u8bbe\u7f6e\u89c2\u5bdf\u8005"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_151

    :cond_d8
    iget-object v0, v1, LF1/d;->b:Ljava/lang/Object;

    check-cast v0, Lc2/d;

    if-eqz v0, :cond_146

    iget-object v3, v1, LF1/d;->c:Ljava/lang/Object;

    check-cast v3, Lc2/b;

    if-eqz v3, :cond_146

    iget-object v3, v1, LF1/d;->d:Ljava/lang/Object;

    check-cast v3, Lc2/c;

    if-nez v3, :cond_eb

    goto :goto_146

    :cond_eb
    new-instance v2, LS1/n2;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, LS1/n2;-><init>(LF1/d;I)V

    iget-object v3, v1, LF1/d;->a:Ljava/lang/Object;

    check-cast v3, Lcom/macronum/bledemo/MainActivity;

    iget-object v0, v0, Lc2/d;->f:Landroidx/lifecycle/z;

    invoke-virtual {v0, v3, v2}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    iget-object v0, v1, LF1/d;->b:Ljava/lang/Object;

    check-cast v0, Lc2/d;

    iget-object v0, v0, Lc2/d;->g:Landroidx/lifecycle/z;

    new-instance v2, LS1/n2;

    const/4 v4, 0x1

    invoke-direct {v2, v1, v4}, LS1/n2;-><init>(LF1/d;I)V

    invoke-virtual {v0, v3, v2}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    iget-object v0, v1, LF1/d;->b:Ljava/lang/Object;

    check-cast v0, Lc2/d;

    iget-object v0, v0, Lc2/d;->h:Landroidx/lifecycle/z;

    new-instance v2, LS1/n2;

    const/4 v4, 0x2

    invoke-direct {v2, v1, v4}, LS1/n2;-><init>(LF1/d;I)V

    invoke-virtual {v0, v3, v2}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    iget-object v0, v1, LF1/d;->b:Ljava/lang/Object;

    check-cast v0, Lc2/d;

    iget-object v0, v0, Lc2/d;->i:Landroidx/lifecycle/z;

    new-instance v2, LS1/n2;

    const/4 v4, 0x3

    invoke-direct {v2, v1, v4}, LS1/n2;-><init>(LF1/d;I)V

    invoke-virtual {v0, v3, v2}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    iget-object v0, v1, LF1/d;->b:Ljava/lang/Object;

    check-cast v0, Lc2/d;

    iget-object v0, v0, Lc2/d;->j:Landroidx/lifecycle/z;

    new-instance v2, LS1/n2;

    const/4 v4, 0x4

    invoke-direct {v2, v1, v4}, LS1/n2;-><init>(LF1/d;I)V

    invoke-virtual {v0, v3, v2}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    iget-object v0, v1, LF1/d;->b:Ljava/lang/Object;

    check-cast v0, Lc2/d;

    iget-object v0, v0, Lc2/d;->k:Landroidx/lifecycle/z;

    new-instance v2, LS1/n2;

    const/4 v4, 0x5

    invoke-direct {v2, v1, v4}, LS1/n2;-><init>(LF1/d;I)V

    invoke-virtual {v0, v3, v2}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    goto :goto_151

    :cond_146
    :goto_146
    const-string v0, "\u3010\u91cd\u6784\u3011ViewModel\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u8bbe\u7f6e\u89c2\u5bdf\u8005"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_151

    :cond_14c
    const-string v1, "ViewModelObserverManager\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u8bbe\u7f6e\u89c2\u5bdf\u8005"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_151
    new-instance v0, LG1/d;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, LG1/d;-><init>(I)V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->s0:LG1/d;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->d0:LS1/v1;

    iput-object v1, v0, LG1/d;->d:Ljava/lang/Object;

    iput-object v8, v0, LG1/d;->e:Ljava/lang/Object;

    iput-object v10, v0, LG1/d;->f:Ljava/lang/Object;

    new-instance v1, LS1/A;

    new-instance v2, Ly1/I;

    invoke-direct {v2, p0}, Ly1/I;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v3, 0xf

    invoke-direct {v1, v3, v2}, LS1/A;-><init>(ILjava/lang/Object;)V

    iput-object v1, v0, LG1/d;->i:Ljava/lang/Object;

    new-instance v0, LQ1/a;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/macronum/bledemo/MainActivity;->u0:LQ1/a;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    iput-object v1, v0, LQ1/a;->b:Ljava/lang/Object;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    iput-object v1, v0, LQ1/a;->d:Ljava/lang/Object;

    return-void
.end method

.method public final J()Z
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->i0:LS1/Z1;

    if-eqz v0, :cond_a

    iget-boolean v0, v0, LS1/Z1;->g:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public final K(Z)V
    .registers 3

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->r0:LG1/d;

    if-eqz v0, :cond_8

    invoke-virtual {v0, p1}, LG1/d;->k(Z)V

    goto :goto_f

    :cond_8
    const-string p1, "MainActivity"

    const-string v0, "DeviceListManager\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u52a0\u8f7d\u8bbe\u5907"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_f
    return-void
.end method

.method public final L()V
    .registers 3

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->r0:LG1/d;

    if-eqz v0, :cond_9

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, LG1/d;->k(Z)V

    goto :goto_10

    :cond_9
    const-string v0, "MainActivity"

    const-string v1, "DeviceListManager\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u52a0\u8f7d\u8bbe\u5907"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_10
    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 11

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->i0:LS1/Z1;

    if-eqz v0, :cond_80

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "SyncScanManager"

    :try_start_9
    iget-object v2, v0, LS1/Z1;->j:Lb2/t;

    if-nez v2, :cond_24

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": SyncScanCallback\u672a\u8bbe\u7f6e\uff0c\u65e0\u6cd5\u89e6\u53d1\u540c\u6b65"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_87

    :catch_22
    move-exception v2

    goto :goto_68

    :cond_24
    iget-object v2, v2, Lb2/t;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_87

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_31

    goto :goto_87

    :cond_31
    iget-boolean v3, v0, LS1/Z1;->h:Z

    if-eqz v3, :cond_36

    goto :goto_87

    :cond_36
    iget-boolean v3, v0, LS1/Z1;->g:Z

    if-eqz v3, :cond_3b

    goto :goto_87

    :cond_3b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, v0, LS1/Z1;->i:J

    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-lez v7, :cond_50

    sub-long v5, v3, v5

    const-wide/16 v7, 0x1388

    cmp-long v5, v5, v7

    if-gez v5, :cond_50

    goto :goto_87

    :cond_50
    iput-wide v3, v0, LS1/Z1;->i:J

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    iget-object v2, v0, LS1/Z1;->j:Lb2/t;

    iget-object v2, v2, Lb2/t;->f:Ljava/lang/Object;

    check-cast v2, LU1/a;

    iget-object v2, v2, LU1/a;->b:Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v2}, Lcom/macronum/bledemo/MainActivity;->E()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->size()I

    invoke-virtual {v0}, LS1/Z1;->a()V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_67} :catch_22

    goto :goto_87

    :goto_68
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": \u89e6\u53d1\u540c\u6b65\u5931\u8d25"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    iput-boolean p1, v0, LS1/Z1;->g:Z

    goto :goto_87

    :cond_80
    const-string p1, "MainActivity"

    const-string v0, "SyncScanManager\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u89e6\u53d1\u540c\u6b65"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_87
    :goto_87
    return-void
.end method

.method public final N(ILjava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_9

    if-eqz p2, :cond_9

    invoke-virtual {v0, p1, p2}, Lc2/d;->c(ILjava/lang/String;)V

    :cond_9
    return-void
.end method

.method public final O()V
    .registers 8

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->j0:LS1/B;

    if-eqz v0, :cond_44

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-boolean v3, v0, LS1/B;->b:Z

    if-eqz v3, :cond_d

    goto :goto_4b

    :cond_d
    iget-wide v3, v0, LS1/B;->c:J

    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_1e

    sub-long v3, v1, v3

    const-wide/16 v5, 0x1388

    cmp-long v3, v3, v5

    if-gez v3, :cond_1e

    goto :goto_4b

    :cond_1e
    iput-wide v1, v0, LS1/B;->c:J

    const/4 v1, 0x1

    iput-boolean v1, v0, LS1/B;->b:Z

    new-instance v1, Ljava/util/HashMap;

    iget-object v2, v0, LS1/B;->d:LR1/e;

    iget-object v2, v2, LR1/e;->d:Ljava/lang/Object;

    check-cast v2, LS1/O0;

    iget-object v2, v2, LS1/O0;->a:Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v2}, Lcom/macronum/bledemo/MainActivity;->D()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, LA1/m;

    const/16 v3, 0xf

    invoke-direct {v2, v3, v0}, LA1/m;-><init>(ILjava/lang/Object;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_4b

    :cond_44
    const-string v0, "MainActivity"

    const-string v1, "GatewayInfoManager\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u66f4\u65b0\u7f51\u5173\u4fe1\u606f"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4b
    return-void
.end method

.method public final P(Ljava/lang/String;Z)V
    .registers 7

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_37

    if-eqz p1, :cond_37

    iget-object v0, v0, Lc2/d;->e:LQ1/a;

    iget-object v1, v0, LQ1/a;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_14
    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/macronum/bledemo/model/DeviceState;

    invoke-virtual {v2}, Lcom/macronum/bledemo/model/DeviceState;->getGatewayId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-virtual {v2, p2}, Lcom/macronum/bledemo/model/DeviceState;->setGatewayOnline(Z)Lcom/macronum/bledemo/model/DeviceState;

    goto :goto_14

    :cond_34
    invoke-virtual {v0}, LQ1/a;->f()V

    :cond_37
    return-void
.end method

.method public final Q()V
    .registers 7

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_45

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    if-nez v1, :cond_9

    goto :goto_45

    :cond_9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v2, v3, :cond_20

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v1, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(I)V

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->d1(I)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Le0/J;)V

    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_4c

    :cond_20
    const/4 v5, 0x2

    if-ne v2, v5, :cond_32

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v1, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(I)V

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->d1(I)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Le0/J;)V

    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_4c

    :cond_32
    new-instance v2, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-direct {v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>()V

    new-instance v3, LS1/L;

    invoke-direct {v3, v1}, LS1/L;-><init>(Ljava/util/ArrayList;)V

    iput-object v3, v2, Landroidx/recyclerview/widget/GridLayoutManager;->K:Landroidx/fragment/app/f;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Le0/J;)V

    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_4c

    :cond_45
    :goto_45
    const-string v0, "LayoutManagerHelper"

    const-string v1, "\u53c2\u6570\u4e3anull\uff0c\u8df3\u8fc7\u5e03\u5c40\u66f4\u65b0"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4c
    return-void
.end method

.method public final R()V
    .registers 8

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->B:Landroid/widget/ImageButton;

    const-string v1, "LocationPermissionHelper"

    const-string v2, "LocationIndicatorHelper"

    if-nez v0, :cond_f

    const-string v0, "\u53c2\u6570\u4e3anull\uff0c\u8df3\u8fc7\u4f4d\u7f6e\u6307\u793a\u5668\u66f4\u65b0"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7e

    :cond_f
    :try_start_f
    const-string v3, "location"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/LocationManager;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_17} :catch_62

    if-nez v3, :cond_1a

    goto :goto_68

    :cond_1a
    const/4 v4, 0x0

    :try_start_1b
    const-string v5, "gps"

    invoke-virtual {v3, v5}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v5
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_21} :catch_22

    goto :goto_23

    :catch_22
    move v5, v4

    :goto_23
    :try_start_23
    const-string v6, "network"

    invoke-virtual {v3, v6}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v4
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_29} :catch_29

    :catch_29
    if-nez v5, :cond_2d

    if-eqz v4, :cond_68

    :cond_2d
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v3, v4, :cond_34

    goto :goto_44

    :cond_34
    :try_start_34
    const-string v3, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v3}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const-string v4, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v4}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_40} :catch_5b

    if-eqz v3, :cond_44

    if-nez v1, :cond_68

    :cond_44
    :goto_44
    const v1, 0x7f070104

    :try_start_47
    invoke-static {p0, v1}, LA/c;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const v1, 0x7f0502fe

    invoke-static {p0, v1}, LA/d;->a(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_58} :catch_59

    goto :goto_7e

    :catch_59
    move-exception v0

    goto :goto_79

    :catch_5b
    move-exception v3

    const-string v4, "\u68c0\u67e5\u4f4d\u7f6e\u6743\u9650\u65f6\u53d1\u751f\u5f02\u5e38"

    invoke-static {v1, v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_68

    :catch_62
    move-exception v3

    const-string v4, "\u68c0\u67e5\u5b9a\u4f4d\u670d\u52a1\u72b6\u6001\u65f6\u53d1\u751f\u5f02\u5e38"

    invoke-static {v1, v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_68
    :goto_68
    const v1, 0x7f070107

    :try_start_6b
    invoke-static {p0, v1}, LA/c;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_78} :catch_59

    goto :goto_7e

    :goto_79
    const-string v1, "\u66f4\u65b0\u4f4d\u7f6e\u6307\u793a\u5668\u65f6\u53d1\u751f\u5f02\u5e38"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_7e
    return-void
.end method

.method public final S(Ljava/lang/String;Z)V
    .registers 4

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_1a

    if-eqz p1, :cond_1a

    iget-object v0, v0, Lc2/d;->e:LQ1/a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, LQ1/a;->e(Ljava/lang/String;)Lcom/macronum/bledemo/model/DeviceState;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/macronum/bledemo/model/DeviceState;->setRemoteOnline(Z)Lcom/macronum/bledemo/model/DeviceState;

    invoke-virtual {v0}, LQ1/a;->f()V

    goto :goto_23

    :cond_1a
    if-nez v0, :cond_23

    const-string p2, "\u3010\u72b6\u6001\u66f4\u65b0\u3011mainViewModel\u4e3anull\uff0c\u65e0\u6cd5\u66f4\u65b0\u8fdc\u7a0b\u5728\u7ebf\u72b6\u6001: lockMac="

    const-string v0, "StatusUpdateHelper"

    invoke-static {p2, p1, v0}, LA/e;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_23
    :goto_23
    return-void
.end method

.method public final T()V
    .registers 8

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->Y:LS1/J0;

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    if-eqz v0, :cond_8f

    if-eqz v1, :cond_8f

    iget-object v2, v1, Lc2/d;->g:Landroidx/lifecycle/z;

    invoke-virtual {v2}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Ljava/util/Map;

    iget-object v2, v1, Lc2/d;->h:Landroidx/lifecycle/z;

    invoke-virtual {v2}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    iget-object v3, v1, Lc2/d;->i:Landroidx/lifecycle/z;

    invoke-virtual {v3}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    iget-object v4, v1, Lc2/d;->j:Landroidx/lifecycle/z;

    invoke-virtual {v4}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    iget-object v1, v1, Lc2/d;->k:Landroidx/lifecycle/z;

    invoke-virtual {v1}, Landroidx/lifecycle/z;->d()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/util/Map;

    if-eqz v6, :cond_3d

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_3d
    if-eqz v2, :cond_48

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_48

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_48
    if-eqz v6, :cond_5b

    if-eqz v2, :cond_5b

    if-eqz v3, :cond_5b

    if-eqz v4, :cond_5b

    if-eqz v5, :cond_5b

    move-object v1, v6

    invoke-virtual/range {v0 .. v5}, LS1/J0;->b(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    invoke-interface {v6}, Ljava/util/Map;->size()I

    goto/16 :goto_b4

    :cond_5b
    if-eqz v6, :cond_5e

    goto :goto_63

    :cond_5e
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    :goto_63
    if-eqz v2, :cond_66

    goto :goto_6c

    :cond_66
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v2, v1

    :goto_6c
    if-eqz v3, :cond_6f

    goto :goto_75

    :cond_6f
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v3, v1

    :goto_75
    if-eqz v4, :cond_78

    goto :goto_7e

    :cond_78
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v4, v1

    :goto_7e
    if-eqz v5, :cond_81

    goto :goto_87

    :cond_81
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v5, v1

    :goto_87
    move-object v1, v6

    invoke-virtual/range {v0 .. v5}, LS1/J0;->b(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    invoke-interface {v6}, Ljava/util/Map;->size()I

    goto :goto_b4

    :cond_8f
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u3010UI\u66f4\u65b0\u3011uiManager\u6216mainViewModel\u672a\u521d\u59cb\u5316\uff0c\u8df3\u8fc7UI\u66f4\u65b0: uiManager="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_9c

    move v0, v4

    goto :goto_9d

    :cond_9c
    move v0, v3

    :goto_9d
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", mainViewModel="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v1, :cond_a8

    move v3, v4

    :cond_a8
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UIHelper"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_b4
    return-void
.end method

.method public final U(ILjava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    if-eqz v0, :cond_a

    if-eqz p2, :cond_a

    invoke-virtual {v0, p1, p2}, Lc2/c;->e(ILjava/lang/String;)V

    goto :goto_13

    :cond_a
    if-nez v0, :cond_13

    const-string p1, "StatusUpdateHelper"

    const-string p2, "LockStatusViewModel\u672a\u521d\u59cb\u5316\uff0c\u8df3\u8fc7\u7535\u91cf\u4e0a\u4f20"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_13
    :goto_13
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 21

    move-object/from16 v11, p0

    const/16 v13, 0xd

    const/4 v14, 0x4

    const/16 v15, 0xc

    const/16 v10, 0xb

    const/4 v9, 0x0

    const/4 v8, 0x1

    invoke-super/range {p0 .. p1}, Lf/g;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_1c

    invoke-static {v0, v8}, LM/i0;->a(Landroid/view/Window;Z)V

    goto :goto_1f

    :cond_1c
    invoke-static {v0, v8}, LM/h0;->a(Landroid/view/Window;Z)V

    :goto_1f
    new-instance v1, LU1/a;

    invoke-direct {v1, v11}, LU1/a;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    new-instance v2, Ly1/J;

    invoke-direct {v2, v11}, Ly1/J;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const-string v3, "PrivacyPolicyDialog"

    sget v0, LL1/b;->g:I

    :try_start_2d
    const-string v0, "app_config"

    invoke-virtual {v11, v0, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v4, "privacy_policy_accepted"

    invoke-interface {v0, v4, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_39} :catch_3a

    goto :goto_41

    :catch_3a
    move-exception v0

    const-string v4, "\u68c0\u67e5\u9690\u79c1\u653f\u7b56\u540c\u610f\u72b6\u6001\u5931\u8d25"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v0, v9

    :goto_41
    const v4, 0x7f0b0028

    if-nez v0, :cond_6f

    invoke-virtual {v11, v4}, Lf/g;->setContentView(I)V

    new-instance v0, LK1/b;

    invoke-direct {v0, v1, v14, v2}, LK1/b;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_5a

    const-string v0, "Activity\u65e0\u6548\uff0c\u65e0\u6cd5\u663e\u793a\u5bf9\u8bdd\u6846"

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6e

    :cond_5a
    :try_start_5a
    new-instance v1, LL1/b;

    const v2, 0x1030239

    invoke-direct {v1, v11, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v0, v1, LL1/b;->f:LK1/b;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_67} :catch_68

    goto :goto_6e

    :catch_68
    move-exception v0

    const-string v1, "\u663e\u793a\u9690\u79c1\u653f\u7b56\u5bf9\u8bdd\u6846\u5931\u8d25"

    invoke-static {v3, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_6e
    return-void

    :cond_6f
    iget-object v2, v1, LU1/a;->b:Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/macronum/bledemo/YiLaApplication;

    invoke-static {}, LA1/r;->e()LA1/r;

    move-result-object v3

    const-string v5, "InitCoordinator"

    if-eqz v3, :cond_83

    iget-boolean v3, v3, LA1/r;->d:Z

    if-nez v3, :cond_a3

    :cond_83
    const-string v3, "\u3010\u654f\u611f\u529f\u80fd\u68c0\u67e5\u3011MQTT\u672a\u521d\u59cb\u5316\uff0c\u89e6\u53d1\u654f\u611f\u529f\u80fd\u521d\u59cb\u5316"

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_9e

    invoke-virtual {v0}, Lcom/macronum/bledemo/YiLaApplication;->b()V

    invoke-static {}, LA1/r;->e()LA1/r;

    move-result-object v0

    if-eqz v0, :cond_98

    iget-boolean v0, v0, LA1/r;->d:Z

    if-eqz v0, :cond_98

    goto :goto_a3

    :cond_98
    const-string v0, "\u3010\u654f\u611f\u529f\u80fd\u68c0\u67e5\u3011MQTT\u521d\u59cb\u5316\u53ef\u80fd\u4ecd\u5728\u8fdb\u884c\u4e2d\uff0c\u7ee7\u7eed\u6267\u884c"

    invoke-static {v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a3

    :cond_9e
    const-string v0, "\u3010\u654f\u611f\u529f\u80fd\u68c0\u67e5\u3011Application\u4e3anull\uff0c\u65e0\u6cd5\u521d\u59cb\u5316\u654f\u611f\u529f\u80fd"

    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a3
    :goto_a3
    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v3

    if-eqz v3, :cond_d0

    :try_start_a9
    invoke-virtual {v3}, LB1/c;->b()V
    :try_end_ac
    .catch Ljava/lang/IllegalStateException; {:try_start_a9 .. :try_end_ac} :catch_ad

    goto :goto_d5

    :catch_ad
    move-exception v0

    move-object v6, v0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v7, "\u3010\u654f\u611f\u529f\u80fd\u68c0\u67e5\u3011ApiClient\u672a\u521d\u59cb\u5316\uff0c\u5c1d\u8bd5\u521d\u59cb\u5316: "

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_c4
    invoke-virtual {v3, v2}, LB1/c;->g(Landroid/content/Context;)V
    :try_end_c7
    .catch Ljava/lang/Exception; {:try_start_c4 .. :try_end_c7} :catch_c8

    goto :goto_d5

    :catch_c8
    move-exception v0

    move-object v3, v0

    const-string v0, "\u3010\u654f\u611f\u529f\u80fd\u68c0\u67e5\u3011ApiClient\u521d\u59cb\u5316\u5931\u8d25"

    invoke-static {v5, v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_d5

    :cond_d0
    const-string v0, "\u3010\u654f\u611f\u529f\u80fd\u68c0\u67e5\u3011ApiClient\u5b9e\u4f8b\u4e3anull"

    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_d5
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v0

    if-nez v0, :cond_f3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/macronum/bledemo/ui/LoginActivity;

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    return-void

    :cond_f3
    invoke-virtual {v11, v4}, Lf/g;->setContentView(I)V

    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->A()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v2, LS1/b2;

    const/16 v3, 0x8

    invoke-direct {v2, v3, v1}, LS1/b2;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v0, LC0/t;

    invoke-direct {v0}, LC0/t;-><init>()V

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->M:LC0/t;

    new-instance v1, Ly1/J;

    invoke-direct {v1, v11}, Ly1/J;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v1, v0, LC0/t;->e:Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lb2/v;

    invoke-direct {v1, v11, v10}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    new-instance v0, LD1/f;

    invoke-direct {v0, v11}, LD1/f;-><init>(Landroid/content/Context;)V

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->J:LD1/f;

    new-instance v1, Ly1/D;

    invoke-direct {v1, v0}, Ly1/D;-><init>(LD1/f;)V

    iput-object v1, v11, Lcom/macronum/bledemo/MainActivity;->K:Ly1/D;

    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->H()V

    new-instance v0, LS1/A;

    invoke-direct {v0, v15, v11}, LS1/A;-><init>(ILjava/lang/Object;)V

    new-instance v1, Lb2/v;

    invoke-direct {v1, v11, v15}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    invoke-virtual {v0, v1}, LS1/A;->A(Ljava/lang/Runnable;)V

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ly1/A;->h(Landroid/content/Context;)Ly1/A;

    move-result-object v0

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->I:Ly1/A;

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    if-eqz v1, :cond_156

    if-eqz v0, :cond_156

    iput-object v0, v1, Lc2/b;->h:Ly1/A;

    :cond_156
    const v0, 0x7f0802ca

    invoke-virtual {v11, v0}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->z:Landroid/widget/TextView;

    const v0, 0x7f08007f

    invoke-virtual {v11, v0}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->A:Landroid/widget/ImageButton;

    const v0, 0x7f08008f

    invoke-virtual {v11, v0}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->B:Landroid/widget/ImageButton;

    const v0, 0x7f080093

    invoke-virtual {v11, v0}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->C:Landroid/widget/ImageButton;

    const v0, 0x7f0802d4

    invoke-virtual {v11, v0}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->D:Landroid/view/View;

    const v0, 0x7f08024e

    invoke-virtual {v11, v0}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const v0, 0x7f0801ea

    invoke-virtual {v11, v0}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Lz1/e;

    iget-object v7, v11, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    invoke-direct {v0, v7, v11}, Lz1/e;-><init>(Ljava/util/ArrayList;Landroid/content/Context;)V

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->Q()V

    :try_start_1ad
    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v8}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V
    :try_end_1b2
    .catch Ljava/lang/Exception; {:try_start_1ad .. :try_end_1b2} :catch_1b2

    :catch_1b2
    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Le0/C;)V

    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->I()V

    :try_start_1bc
    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    if-eqz v0, :cond_1dd

    iget-object v0, v0, Lc2/b;->l:Landroidx/lifecycle/z;

    new-instance v1, LU1/a;

    invoke-direct {v1, v11}, LU1/a;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    invoke-virtual {v0, v11, v1}, Landroidx/lifecycle/z;->e(Landroidx/lifecycle/s;Landroidx/lifecycle/A;)V

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    invoke-static {v1}, LC0/f;->J(Lc2/d;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, v11, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    invoke-virtual {v2, v1, v0}, Lc2/b;->h(Ljava/util/Map;Ljava/lang/String;)V
    :try_end_1dd
    .catch Ljava/lang/Exception; {:try_start_1bc .. :try_end_1dd} :catch_1dd

    :catch_1dd
    :cond_1dd
    :try_start_1dd
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v1

    invoke-virtual {v1}, LZ1/a;->i()Z

    move-result v1

    if-eqz v1, :cond_204

    if-eqz v0, :cond_204

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_204

    invoke-static {}, LR1/a;->d()LR1/a;

    move-result-object v1

    invoke-virtual {v1, v11}, LR1/a;->e(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, LR1/a;->g(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, LR1/a;->f(Ljava/lang/String;)V
    :try_end_204
    .catch Ljava/lang/Exception; {:try_start_1dd .. :try_end_204} :catch_204

    :catch_204
    :cond_204
    new-instance v0, LA0/d;

    invoke-direct {v0, v10, v11}, LA0/d;-><init>(ILjava/lang/Object;)V

    iput-object v0, v11, Lcom/macronum/bledemo/MainActivity;->N:LA0/d;

    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iget-object v2, v11, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    iget-object v3, v11, Lcom/macronum/bledemo/MainActivity;->I:Ly1/A;

    new-instance v4, LS1/I0;

    invoke-direct {v4, v2, v1, v0, v3}, LS1/I0;-><init>(Lz1/e;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroidx/recyclerview/widget/RecyclerView;Ly1/A;)V

    new-instance v1, Le0/s;

    invoke-direct {v1, v4}, Le0/s;-><init>(LS1/I0;)V

    iget-object v3, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v6, 0x0

    if-ne v3, v0, :cond_224

    goto/16 :goto_2df

    :cond_224
    iget-object v4, v1, Le0/s;->z:Le0/o;

    if-eqz v3, :cond_281

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView;->b0(Le0/H;)V

    iget-object v3, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v3, Landroidx/recyclerview/widget/RecyclerView;->s:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v5, v3, Landroidx/recyclerview/widget/RecyclerView;->t:Le0/M;

    if-ne v5, v4, :cond_238

    iput-object v6, v3, Landroidx/recyclerview/widget/RecyclerView;->t:Le0/M;

    :cond_238
    iget-object v3, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->E:Ljava/util/ArrayList;

    if-nez v3, :cond_23f

    goto :goto_242

    :cond_23f
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_242
    iget-object v3, v1, Le0/s;->p:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v8

    :goto_249
    if-ltz v5, :cond_265

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v10, v16

    check-cast v10, Le0/p;

    iget-object v14, v10, Le0/p;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {v14}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object v10, v10, Le0/p;->e:Le0/a0;

    iget-object v14, v1, Le0/s;->m:LS1/I0;

    invoke-virtual {v14, v10}, LS1/I0;->e(Le0/a0;)V

    add-int/lit8 v5, v5, -0x1

    const/16 v10, 0xb

    const/4 v14, 0x4

    goto :goto_249

    :cond_265
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    iput-object v6, v1, Le0/s;->w:Landroid/view/View;

    iget-object v3, v1, Le0/s;->t:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_273

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v6, v1, Le0/s;->t:Landroid/view/VelocityTracker;

    :cond_273
    iget-object v3, v1, Le0/s;->y:Le0/r;

    if-eqz v3, :cond_27b

    iput-boolean v9, v3, Le0/r;->a:Z

    iput-object v6, v1, Le0/s;->y:Le0/r;

    :cond_27b
    iget-object v3, v1, Le0/s;->x:LS1/A;

    if-eqz v3, :cond_281

    iput-object v6, v1, Le0/s;->x:LS1/A;

    :cond_281
    iput-object v0, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_2df

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f06009c

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    iput v3, v1, Le0/s;->f:F

    const v3, 0x7f06009b

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, v1, Le0/s;->g:F

    iget-object v0, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, v1, Le0/s;->q:I

    iget-object v0, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->g(Le0/H;)V

    iget-object v0, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->E:Ljava/util/ArrayList;

    if-nez v3, :cond_2c4

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Landroidx/recyclerview/widget/RecyclerView;->E:Ljava/util/ArrayList;

    :cond_2c4
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->E:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Le0/r;

    invoke-direct {v0, v1}, Le0/r;-><init>(Le0/s;)V

    iput-object v0, v1, Le0/s;->y:Le0/r;

    new-instance v0, LS1/A;

    iget-object v3, v1, Le0/s;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v1, Le0/s;->y:Le0/r;

    invoke-direct {v0, v3, v4}, LS1/A;-><init>(Landroid/content/Context;Le0/r;)V

    iput-object v0, v1, Le0/s;->x:LS1/A;

    :cond_2df
    :goto_2df
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->B:Landroid/widget/ImageButton;

    if-nez v0, :cond_2e7

    goto :goto_2ef

    :cond_2e7
    new-instance v1, LS1/F0;

    invoke-direct {v1, v11, v9}, LS1/F0;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_2ef
    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->C:Landroid/widget/ImageButton;

    if-nez v0, :cond_2f4

    goto :goto_2fc

    :cond_2f4
    new-instance v1, LS1/F0;

    invoke-direct {v1, v11, v8}, LS1/F0;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_2fc
    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->R()V

    new-instance v14, LU1/e;

    invoke-direct {v14, v11}, LU1/e;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->v0:LC1/b;

    iget-object v2, v11, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    iget-object v3, v11, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    iget-object v4, v11, Lcom/macronum/bledemo/MainActivity;->g0:LI2/e;

    iget-object v5, v11, Lcom/macronum/bledemo/MainActivity;->w0:LN1/a;

    iput-object v0, v14, LU1/e;->c:Ljava/lang/Object;

    iput-object v1, v14, LU1/e;->d:Ljava/lang/Object;

    iput-object v2, v14, LU1/e;->e:Ljava/lang/Object;

    iput-object v3, v14, LU1/e;->f:Ljava/lang/Object;

    iput-object v4, v14, LU1/e;->g:Ljava/lang/Object;

    iput-object v5, v14, LU1/e;->h:Ljava/lang/Object;

    new-instance v0, Lb2/v;

    invoke-direct {v0, v11, v13}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    iget-object v1, v14, LU1/e;->b:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Landroid/os/Handler;

    const-wide/16 v2, 0x1f4

    const-string v1, "StartupDataLoader"

    if-eqz v4, :cond_331

    :try_start_32c
    iput-boolean v9, v4, LI2/e;->a:Z

    goto :goto_331

    :catch_32f
    move-exception v0

    goto :goto_358

    :cond_331
    :goto_331
    iget-object v4, v11, Lcom/macronum/bledemo/MainActivity;->r0:LG1/d;

    if-eqz v4, :cond_33d

    invoke-virtual {v4}, LG1/d;->l()V

    iget-object v4, v11, Lcom/macronum/bledemo/MainActivity;->r0:LG1/d;

    invoke-virtual {v4, v9}, LG1/d;->k(Z)V

    :cond_33d
    iget-object v4, v14, LU1/e;->d:Ljava/lang/Object;

    check-cast v4, LC1/b;

    if-nez v4, :cond_349

    const-string v4, "\u3010\u7535\u91cf\u7ba1\u7406\u3011batteryManagerIntegration\u4e3anull\uff0c\u65e0\u6cd5\u52a0\u8f7d\u7535\u91cf\u4fe1\u606f"

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_351

    :cond_349
    new-instance v4, LB0/d;

    invoke-direct {v4, v14, v7}, LB0/d;-><init>(LU1/e;Ljava/util/ArrayList;)V

    invoke-virtual {v10, v4, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_351
    invoke-virtual {v14, v7, v0}, LU1/e;->c(Ljava/util/ArrayList;Lb2/v;)V

    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->O()V
    :try_end_357
    .catch Ljava/lang/Exception; {:try_start_32c .. :try_end_357} :catch_32f

    goto :goto_35d

    :goto_358
    const-string v4, "\u3010onCreate\u3011\u89e6\u53d1\u9996\u5c4f\u6570\u636e\u52a0\u8f7d\u65f6\u53d1\u751f\u5f02\u5e38"

    invoke-static {v1, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_35d
    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->J:LD1/f;

    new-instance v5, LW1/a;

    iget-object v4, v11, Lcom/macronum/bledemo/MainActivity;->V:Lc2/d;

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->X:Lc2/c;

    iget-object v6, v11, Lcom/macronum/bledemo/MainActivity;->v0:LC1/b;

    iget-object v8, v11, Lcom/macronum/bledemo/MainActivity;->Y:LS1/J0;

    iget-object v9, v11, Lcom/macronum/bledemo/MainActivity;->d0:LS1/v1;

    iget-object v13, v11, Lcom/macronum/bledemo/MainActivity;->H:Ljava/util/HashSet;

    new-instance v12, LS1/O0;

    invoke-direct {v12, v11}, LS1/O0;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    move-object/from16 v17, v1

    move-object v1, v5

    move-object/from16 v2, p0

    move-object v3, v4

    move-object/from16 v4, v17

    move-object v15, v5

    move-object v5, v6

    move-object/from16 v18, v14

    const/4 v14, 0x0

    move-object v6, v8

    move-object/from16 p1, v7

    move-object v7, v9

    const/4 v9, 0x1

    move-object/from16 v8, p1

    move v14, v9

    move-object v9, v13

    move-object v13, v10

    move-object v10, v12

    invoke-direct/range {v1 .. v10}, LW1/a;-><init>(Lcom/macronum/bledemo/MainActivity;Lc2/d;Lc2/c;LC1/b;LS1/J0;LS1/v1;Ljava/util/ArrayList;Ljava/util/HashSet;LS1/O0;)V

    invoke-virtual {v0, v15}, LD1/f;->a(LD1/e;)V

    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->F:Lz1/e;

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->I:Ly1/A;

    new-instance v2, Ly1/I;

    invoke-direct {v2, v11}, Ly1/I;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    new-instance v3, LS1/b0;

    invoke-direct {v3, v11, v14}, LS1/b0;-><init>(Lf/g;I)V

    iget-object v4, v11, Lcom/macronum/bledemo/MainActivity;->Q:LD/h;

    if-nez v0, :cond_3a3

    goto :goto_3ba

    :cond_3a3
    new-instance v5, LH1/b;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-object v2, v5, LH1/b;->a:Ljava/lang/Object;

    iput-object v11, v5, LH1/b;->b:Ljava/lang/Object;

    move-object/from16 v2, p1

    iput-object v2, v5, LH1/b;->c:Ljava/lang/Object;

    iput-object v0, v5, LH1/b;->d:Ljava/lang/Object;

    iput-object v1, v5, LH1/b;->e:Ljava/lang/Object;

    iput-object v4, v5, LH1/b;->f:Ljava/lang/Object;

    iput-object v3, v5, LH1/b;->g:Ljava/lang/Object;

    iput-object v5, v0, Lz1/e;->e:LH1/b;

    :goto_3ba
    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->y:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_3cd

    if-eqz v0, :cond_3cd

    if-nez v4, :cond_3c3

    goto :goto_3cd

    :cond_3c3
    new-instance v2, LS1/H0;

    invoke-direct {v2, v4, v0}, LS1/H0;-><init>(LD/h;Lz1/e;)V

    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->s:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3cd
    :goto_3cd
    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->x:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    new-instance v1, LP/b;

    const/16 v2, 0xc

    invoke-direct {v1, v2, v11}, LP/b;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Ln0/j;)V

    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->A:Landroid/widget/ImageButton;

    new-instance v1, Ly1/E;

    invoke-direct {v1, v11, v14}, Ly1/E;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    if-eqz v0, :cond_3ea

    new-instance v2, LS1/j;

    invoke-direct {v2, v11, v14, v1}, LS1/j;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3ea
    iget-object v0, v11, Lcom/macronum/bledemo/MainActivity;->Z:Lb2/t;

    if-eqz v0, :cond_4ac

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v2, v0, Lb2/t;->d:Ljava/lang/Object;

    check-cast v2, Lcom/macronum/bledemo/MainActivity;

    iget-object v3, v0, Lb2/t;->e:Ljava/lang/Object;

    check-cast v3, LB1/e;

    const-string v4, "\u6682\u4e0d\u6388\u6743"

    const-string v5, "\u540c\u610f\u5e76\u7ee7\u7eed"

    const/16 v6, 0x1f

    if-lt v1, v6, :cond_457

    const-string v1, "android.permission.BLUETOOTH_SCAN"

    const-string v6, "android.permission.BLUETOOTH_CONNECT"

    filled-new-array {v1, v6}, [Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    const/4 v9, 0x0

    :goto_40a
    if-ge v9, v8, :cond_4ac

    aget-object v8, v7, v9

    invoke-static {v2, v8}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_454

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, LB1/e;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, v3, LB1/e;->e:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences;

    const/4 v8, 0x0

    invoke-interface {v3, v1, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_44c

    invoke-static {v6}, LB1/e;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v1, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_431

    goto :goto_44c

    :cond_431
    new-instance v1, LS1/a1;

    const-string v3, "\u6743\u9650\u7533\u8bf7\u8bf4\u660e"

    const-string v6, "\u4e3a\u4e86\u8fde\u63a5\u548c\u63a7\u5236\u667a\u80fd\u95e8\u9501\uff0c\u5e94\u7528\u9700\u8981\u83b7\u53d6\u84dd\u7259\u6743\u9650\u3002\n\n\u2022 \u84dd\u7259\u626b\u63cf\uff1a\u7528\u4e8e\u53d1\u73b0\u9644\u8fd1\u7684\u95e8\u9501\u8bbe\u5907\n\u2022 \u84dd\u7259\u8fde\u63a5\uff1a\u7528\u4e8e\u4e0e\u95e8\u9501\u5efa\u7acb\u901a\u4fe1\n\n\u8bf7\u5728\u63a5\u4e0b\u6765\u7684\u7cfb\u7edf\u5f39\u7a97\u4e2d\u70b9\u51fb\u201c\u5141\u8bb8\u201d\u3002"

    invoke-direct {v1, v2, v3, v6}, LS1/a1;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, LS1/h;

    invoke-direct {v2, v0, v7, v14}, LS1/h;-><init>(Ljava/lang/Object;Ljava/io/Serializable;I)V

    iput-object v5, v1, LS1/a1;->e:Ljava/lang/String;

    iput-object v2, v1, LS1/a1;->g:LS1/Z0;

    iput-object v4, v1, LS1/a1;->f:Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, v1, LS1/a1;->h:LS1/Y0;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    goto :goto_4ac

    :cond_44c
    :goto_44c
    const-string v0, "PermissionResultHandler"

    const-string v1, "\u84dd\u7259\u6743\u9650\u5df2\u88ab\u6c38\u4e45\u62d2\u7edd\uff0c\u4e0d\u518d\u81ea\u52a8\u8bf7\u6c42"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4ac

    :cond_454
    add-int/2addr v9, v14

    const/4 v8, 0x2

    goto :goto_40a

    :cond_457
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {v3, v0}, LB1/e;->m(Ljava/lang/String;)Z

    move-result v7

    const-string v8, "android.permission.ACCESS_COARSE_LOCATION"

    if-nez v7, :cond_4a6

    invoke-virtual {v3, v8}, LB1/e;->m(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_468

    goto :goto_4a6

    :cond_468
    if-lt v1, v6, :cond_46b

    goto :goto_4ac

    :cond_46b
    invoke-static {v0}, LB1/e;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v3, LB1/e;->e:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences;

    const/4 v3, 0x0

    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_484

    const-string v0, "\u9700\u8981\u4f4d\u7f6e\u6743\u9650\u624d\u80fd\u626b\u63cf\u84dd\u7259\u8bbe\u5907"

    invoke-static {v2, v0, v14}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_4ac

    :cond_484
    new-instance v0, Lb2/v;

    invoke-direct {v0, v2, v3}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    new-instance v1, LS1/a1;

    const-string v3, "\u4f4d\u7f6e\u6743\u9650\u7533\u8bf7\u8bf4\u660e"

    const-string v6, "\u4e3a\u4e86\u8fde\u63a5\u548c\u63a7\u5236\u667a\u80fd\u95e8\u9501\uff0c\u5e94\u7528\u9700\u8981\u83b7\u53d6\u4f4d\u7f6e\u6743\u9650\u3002\n\n\u2022 \u4f4d\u7f6e\u6743\u9650\uff1aAndroid 6.0-11 \u7cfb\u7edf\u8981\u6c42\u5f00\u542f\u4f4d\u7f6e\u6743\u9650\u624d\u80fd\u626b\u63cf\u84dd\u7259\u8bbe\u5907\n\u2022 Android 12+ \u7cfb\u7edf\u65e0\u9700\u6b64\u6743\u9650\n\n\u6743\u9650\u7528\u9014\uff1a\u4ec5\u7528\u4e8e\u84dd\u7259\u8bbe\u5907\u626b\u63cf\uff0c\u4e0d\u4f1a\u6536\u96c6\u60a8\u7684\u4f4d\u7f6e\u4fe1\u606f\u3002"

    invoke-direct {v1, v2, v3, v6}, LS1/a1;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, LR1/e;

    const/16 v3, 0x12

    invoke-direct {v2, v3, v0}, LR1/e;-><init>(ILjava/lang/Object;)V

    iput-object v5, v1, LS1/a1;->e:Ljava/lang/String;

    iput-object v2, v1, LS1/a1;->g:LS1/Z0;

    iput-object v4, v1, LS1/a1;->f:Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, v1, LS1/a1;->h:LS1/Y0;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    goto :goto_4ac

    :cond_4a6
    :goto_4a6
    invoke-virtual {v3, v0}, LB1/e;->d(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, LB1/e;->d(Ljava/lang/String;)V

    :cond_4ac
    :goto_4ac
    :try_start_4ac
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.macronum.bledemo.ACTION_DEVICES_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.macronum.bledemo.LOCK_STATUS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.macronum.bledemo.GATEWAY_STATUS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.macronum.bledemo.LOCK_SYNCED_TO_SERVER"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.macronum.bledemo.LOCK_DELETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.macronum.bledemo.GATEWAY_DELETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.macronum.bledemo.PERMISSION_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_4e8

    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->N:LA0/d;

    const/4 v2, 0x4

    invoke-virtual {v11, v1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_4f5

    :catch_4e6
    move-exception v0

    goto :goto_4ee

    :cond_4e8
    iget-object v1, v11, Lcom/macronum/bledemo/MainActivity;->N:LA0/d;

    invoke-virtual {v11, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_4ed
    .catch Ljava/lang/Exception; {:try_start_4ac .. :try_end_4ed} :catch_4e6

    goto :goto_4f5

    :goto_4ee
    const-string v1, "MainActivity"

    const-string v2, "\u3010\u5e7f\u64ad\u6ce8\u518c\u3011\u6ce8\u518cdevicesUpdatedReceiver\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4f5
    invoke-static/range {p0 .. p0}, Lb2/r;->e(Landroid/app/Activity;)Lb2/r;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_4fc
    iget-object v1, v0, Lb2/r;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, v0, Lb2/r;->f:Ljava/lang/Object;

    if-nez v1, :cond_50d

    goto :goto_531

    :cond_50d
    new-instance v1, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v1}, Landroid/net/NetworkRequest$Builder;-><init>()V

    new-instance v2, LA0/i;

    invoke-direct {v2, v14, v0}, LA0/i;-><init>(ILjava/lang/Object;)V

    iput-object v2, v0, Lb2/r;->g:Ljava/lang/Object;

    iget-object v2, v0, Lb2/r;->f:Ljava/lang/Object;

    check-cast v2, Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v1

    iget-object v0, v0, Lb2/r;->g:Ljava/lang/Object;

    check-cast v0, LA0/i;

    invoke-virtual {v2, v1, v0}, Landroid/net/ConnectivityManager;->registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_528
    .catch Ljava/lang/Exception; {:try_start_4fc .. :try_end_528} :catch_529

    goto :goto_531

    :catch_529
    move-exception v0

    const-string v1, "NetworkEventManager"

    const-string v2, "\u6ce8\u518c\u7f51\u7edc\u72b6\u6001\u76d1\u542c\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_531
    new-instance v0, Ly1/J;

    invoke-direct {v0, v11}, Ly1/J;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    new-instance v1, LU1/b;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, LU1/b;-><init>(Ly1/J;I)V

    new-instance v2, LA0/f;

    move-object/from16 v3, v18

    iget-object v4, v3, LU1/e;->a:Ljava/lang/Object;

    check-cast v4, Lcom/macronum/bledemo/MainActivity;

    const/16 v5, 0xb

    invoke-direct {v2, v4, v5, v1}, LA0/f;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    sget-object v1, LS1/o;->a:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->L()V

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v1

    if-eqz v1, :cond_58c

    invoke-virtual {v1}, LZ1/a;->i()Z

    move-result v1

    if-eqz v1, :cond_58c

    invoke-static/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->z(Lcom/macronum/bledemo/MainActivity;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    new-instance v4, LU1/d;

    invoke-direct {v4, v3, v1, v2, v0}, LU1/d;-><init>(LU1/e;JLy1/J;)V

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, LA1/m;

    const/4 v5, 0x5

    invoke-direct {v2, v5, v4}, LA1/m;-><init>(ILjava/lang/Object;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    invoke-static {}, LB1/g;->a()LB1/g;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, LU1/b;

    invoke-direct {v2, v0, v14}, LU1/b;-><init>(Ly1/J;I)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_58f

    :cond_58c
    invoke-virtual/range {p0 .. p0}, Lcom/macronum/bledemo/MainActivity;->O()V

    :goto_58f
    new-instance v1, LU1/b;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, LU1/b;-><init>(Ly1/J;I)V

    const-wide/16 v4, 0x1f4

    invoke-virtual {v13, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v1, LU1/b;

    const/4 v2, 0x3

    invoke-direct {v1, v0, v2}, LU1/b;-><init>(Ly1/J;I)V

    const-wide/16 v4, 0x3e8

    invoke-virtual {v13, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v1, LS1/Q1;

    const/16 v2, 0xd

    invoke-direct {v1, v3, v2, v0}, LS1/Q1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v13, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final onDestroy()V
    .registers 5

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->Y:LS1/J0;

    if-eqz v0, :cond_12

    iget-object v1, v0, LS1/J0;->d:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v2, v0, LS1/J0;->a:Lf/g;

    iput-object v2, v0, LS1/J0;->b:Lz1/e;

    iput-object v2, v0, LS1/J0;->c:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    iput-object v2, p0, Lcom/macronum/bledemo/MainActivity;->Y:LS1/J0;

    :cond_12
    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->c0:LC0/i;

    if-eqz v0, :cond_4f

    invoke-static {}, LR1/e;->n()LR1/e;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_1d
    iget-object v1, v0, LC0/i;->b:Ljava/lang/Object;

    check-cast v1, Lcom/macronum/bledemo/MainActivity;

    invoke-static {v1}, Lb2/r;->e(Landroid/app/Activity;)Lb2/r;

    move-result-object v1

    iget-object v2, v1, Lb2/r;->f:Ljava/lang/Object;

    check-cast v2, Landroid/net/ConnectivityManager;

    if-eqz v2, :cond_46

    iget-object v1, v1, Lb2/r;->g:Ljava/lang/Object;

    check-cast v1, LA0/i;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_2f} :catch_3e

    if-eqz v1, :cond_46

    :try_start_31
    invoke-virtual {v2, v1}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_35

    goto :goto_46

    :catch_35
    move-exception v1

    :try_start_36
    const-string v2, "NetworkEventManager"

    const-string v3, "\u53d6\u6d88\u6ce8\u518c\u7f51\u7edc\u72b6\u6001\u76d1\u542c\u5931\u8d25"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_3d} :catch_3e

    goto :goto_46

    :catch_3e
    move-exception v1

    const-string v2, "LifecycleManager"

    const-string v3, "\u505c\u6b62\u7f51\u7edc\u4e8b\u4ef6\u7ba1\u7406\u5668\u5931\u8d25"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_46
    :goto_46
    iget-object v0, v0, LC0/i;->f:Ljava/lang/Object;

    check-cast v0, LS1/Q1;

    if-eqz v0, :cond_4f

    invoke-virtual {v0}, LS1/Q1;->run()V

    :cond_4f
    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->a0:LI2/e;

    if-eqz v0, :cond_56

    invoke-virtual {v0}, LI2/e;->j()V

    :cond_56
    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->h0:LS1/j2;

    if-eqz v0, :cond_5d

    invoke-virtual {v0}, LS1/j2;->a()V

    :cond_5d
    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->w0:LN1/a;

    if-eqz v0, :cond_8a

    iget-object v1, v0, LN1/a;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    if-eqz v1, :cond_79

    iget-object v2, v0, LN1/a;->g:Ljava/lang/Object;

    check-cast v2, LA0/d;

    if-eqz v2, :cond_79

    :try_start_6d
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_70} :catch_71

    goto :goto_79

    :catch_71
    move-exception v1

    const-string v2, "DirectDetectionManager"

    const-string v3, "\u6ce8\u9500\u5e7f\u64ad\u63a5\u6536\u5668\u5931\u8d25"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_79
    :goto_79
    iget-object v1, v0, LN1/a;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_7e
    iget-object v0, v0, LN1/a;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v1

    goto :goto_8a

    :catchall_87
    move-exception v0

    monitor-exit v1
    :try_end_89
    .catchall {:try_start_7e .. :try_end_89} :catchall_87

    throw v0

    :cond_8a
    :goto_8a
    invoke-super {p0}, Lf/g;->onDestroy()V

    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .registers 6

    invoke-super {p0, p1}, Lf/g;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    invoke-virtual {p0}, Landroid/app/Activity;->hasWindowFocus()Z

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_1b

    :cond_19
    const-string v0, "null"

    :goto_1b
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    if-eqz p1, :cond_71

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    if-eqz v0, :cond_6a

    const-string v1, "android.nfc.action."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6a

    new-instance v0, Lb2/v;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lb2/v;-><init>(Lcom/macronum/bledemo/MainActivity;I)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Landroid/app/Activity;->hasWindowFocus()Z

    move-result v0

    if-nez v0, :cond_63

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Ly1/n;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2, p1}, Ly1/n;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_78

    :cond_63
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Lcom/macronum/bledemo/MainActivity;->G(Landroid/content/Intent;)V

    goto :goto_78

    :cond_6a
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Lcom/macronum/bledemo/MainActivity;->G(Landroid/content/Intent;)V

    goto :goto_78

    :cond_71
    const-string p1, "MainActivity"

    const-string v0, "onNewIntent\u6536\u5230\u7a7aIntent"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_78
    return-void
.end method

.method public final onPause()V
    .registers 4

    invoke-super {p0}, Lf/g;->onPause()V

    invoke-static {}, LA1/r;->e()LA1/r;

    move-result-object v0

    iget-object v1, p0, Lcom/macronum/bledemo/MainActivity;->E:Ly1/F;

    iget-object v2, v0, LA1/r;->y:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_c
    iget-object v0, v0, LA1/r;->y:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_2e

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->c0:LC0/i;

    if-eqz v0, :cond_26

    invoke-static {}, LR1/e;->n()LR1/e;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, LC0/i;->e:Ljava/lang/Object;

    check-cast v0, LT1/a;

    if-eqz v0, :cond_26

    invoke-virtual {v0}, LT1/a;->run()V

    :cond_26
    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->a0:LI2/e;

    if-eqz v0, :cond_2d

    invoke-virtual {v0}, LI2/e;->j()V

    :cond_2d
    return-void

    :catchall_2e
    move-exception v0

    :try_start_2f
    monitor-exit v2
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 8

    invoke-super {p0, p1, p2, p3}, Lf/g;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    iget-object v0, p0, Lcom/macronum/bledemo/MainActivity;->Z:Lb2/t;

    if-eqz v0, :cond_1a

    new-instance v1, LS1/b1;

    const/4 v2, 0x0

    invoke-direct {v1, v0, p1, v2}, LS1/b1;-><init>(Lb2/t;II)V

    new-instance v2, LS1/b1;

    const/4 v3, 0x1

    invoke-direct {v2, v0, p1, v3}, LS1/b1;-><init>(Lb2/t;II)V

    iget-object p1, v0, Lb2/t;->e:Ljava/lang/Object;

    check-cast p1, LB1/e;

    invoke-virtual {p1, p2, p3, v1, v2}, LB1/e;->l([Ljava/lang/String;[ILjava/lang/Runnable;Ljava/lang/Runnable;)V

    :cond_1a
    return-void
.end method

.method public final onResume()V
    .registers 20

    move-object/from16 v7, p0

    invoke-super/range {p0 .. p0}, Lf/g;->onResume()V

    invoke-static {}, LA1/r;->e()LA1/r;

    move-result-object v0

    iget-object v1, v7, Lcom/macronum/bledemo/MainActivity;->E:Ly1/F;

    iget-object v2, v0, LA1/r;->y:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_e
    iget-object v3, v0, LA1/r;->y:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_34

    iget-object v3, v0, LA1/r;->y:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, LA1/r;->l()Z

    move-result v0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v1, Ly1/F;->a:Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, LA1/e;

    const/4 v4, 0x3

    invoke-direct {v3, v1, v0, v4}, LA1/e;-><init>(Ljava/lang/Object;ZI)V

    invoke-virtual {v1, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_34

    :catchall_31
    move-exception v0

    goto/16 :goto_32b

    :cond_34
    :goto_34
    monitor-exit v2
    :try_end_35
    .catchall {:try_start_e .. :try_end_35} :catchall_31

    iget-object v0, v7, Lcom/macronum/bledemo/MainActivity;->y0:Lb2/t;

    if-nez v0, :cond_4d

    new-instance v0, Lb2/t;

    iget-object v3, v7, Lcom/macronum/bledemo/MainActivity;->L:Landroid/os/Handler;

    new-instance v4, Ly1/H;

    invoke-direct {v4, v7}, Ly1/H;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    const/16 v5, 0xd

    const/4 v6, 0x0

    move-object v1, v0

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v6}, Lb2/t;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IZ)V

    iput-object v0, v7, Lcom/macronum/bledemo/MainActivity;->y0:Lb2/t;

    :cond_4d
    iget-object v1, v7, Lcom/macronum/bledemo/MainActivity;->y0:Lb2/t;

    iget-object v0, v1, Lb2/t;->f:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ly1/H;

    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v3, v0, Lcom/macronum/bledemo/MainActivity;->x0:LB1/b;

    if-nez v3, :cond_61

    new-instance v3, LB1/b;

    invoke-direct {v3, v0}, LB1/b;-><init>(Lcom/macronum/bledemo/MainActivity;)V

    iput-object v3, v0, Lcom/macronum/bledemo/MainActivity;->x0:LB1/b;

    :cond_61
    iget-object v3, v0, Lcom/macronum/bledemo/MainActivity;->x0:LB1/b;

    iget-boolean v3, v3, LB1/b;->b:Z

    if-eqz v3, :cond_6a

    invoke-virtual {v0}, Lcom/macronum/bledemo/MainActivity;->A()V

    :cond_6a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v3, v1, Lb2/t;->d:Ljava/lang/Object;

    check-cast v3, Lcom/macronum/bledemo/MainActivity;

    const-string v4, "MainResumeCoordinator"

    const/4 v5, 0x1

    const/16 v6, 0x21

    if-lt v0, v6, :cond_9b

    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-boolean v0, v0, Lcom/macronum/bledemo/MainActivity;->P:Z

    if-eqz v0, :cond_7e

    goto :goto_9b

    :cond_7e
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    invoke-static {v3, v0}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    iget-object v9, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    if-eqz v8, :cond_99

    const-string v8, "\u3010\u6743\u9650\u68c0\u67e5\u3011\u901a\u77e5\u6743\u9650\u672a\u6388\u4e88\uff0c\u8bf7\u6c42\u6743\u9650\uff08\u4ec5\u9996\u6b21\uff09"

    invoke-static {v4, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v5, v9, Lcom/macronum/bledemo/MainActivity;->P:Z

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/16 v8, 0x65

    invoke-static {v3, v0, v8}, Lz/d;->d(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_9b

    :cond_99
    iput-boolean v5, v9, Lcom/macronum/bledemo/MainActivity;->P:Z

    :cond_9b
    :goto_9b
    const-string v0, "package:"

    :try_start_9d
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "power"

    invoke-virtual {v3, v9}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    if-eqz v3, :cond_da

    invoke-virtual {v3, v8}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_da

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    const-string v9, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v0, "\u5efa\u8bae\u7528\u6237\u624b\u52a8\u5f00\u542f\u5ffd\u7565\u7535\u6c60\u4f18\u5316\u4ee5\u4fdd\u6301\u957f\u8fde\u63a5"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_9d .. :try_end_d3} :catch_d4

    goto :goto_da

    :catch_d4
    move-exception v0

    const-string v3, "\u68c0\u67e5\u7535\u6c60\u4f18\u5316\u6743\u9650\u5931\u8d25"

    invoke-static {v4, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_da
    :goto_da
    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v3, v0, Lcom/macronum/bledemo/MainActivity;->i0:LS1/Z1;

    const/4 v8, 0x0

    if-eqz v3, :cond_e3

    iput-boolean v8, v3, LS1/Z1;->h:Z

    :cond_e3
    invoke-virtual {v0}, Lcom/macronum/bledemo/MainActivity;->R()V

    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v3, v0, Lcom/macronum/bledemo/MainActivity;->g0:LI2/e;

    if-eqz v3, :cond_ee

    iput-boolean v8, v3, LI2/e;->a:Z

    :cond_ee
    iget-object v0, v0, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    if-eqz v0, :cond_10d

    :try_start_f2
    invoke-virtual {v0}, Lc2/b;->g()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_107

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    iget-object v3, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v3, v0}, Lcom/macronum/bledemo/MainActivity;->B(Ljava/util/ArrayList;)Lc2/a;

    goto :goto_118

    :catch_105
    move-exception v0

    goto :goto_113

    :cond_107
    const-string v0, "\u3010onResume\u3011\u672c\u5730\u8bbe\u5907\u4e3a\u7a7a\uff0c\u6682\u4e0d\u5efa\u7acb\u6743\u9650\u6620\u5c04"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_118

    :cond_10d
    const-string v0, "\u3010onResume\u3011deviceSyncViewModel\u672a\u521d\u59cb\u5316\uff0c\u8df3\u8fc7\u5feb\u901f\u6743\u9650\u6620\u5c04"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_112
    .catch Ljava/lang/Exception; {:try_start_f2 .. :try_end_112} :catch_105

    goto :goto_118

    :goto_113
    const-string v3, "\u3010onResume\u3011\u5feb\u901f\u5efa\u7acb\u6743\u9650\u6620\u5c04\u5f02\u5e38"

    invoke-static {v4, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_118
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    iget-object v3, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v3, v3, Lcom/macronum/bledemo/MainActivity;->W:Lc2/b;

    if-eqz v0, :cond_1fd

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v9

    if-eqz v9, :cond_1fd

    iget-object v0, v0, LZ1/a;->d:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ljava/lang/String;

    if-eqz v9, :cond_1fd

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1fd

    if-eqz v3, :cond_1fd

    const-string v10, "DeviceSyncViewModel"

    :try_start_139
    iget-object v0, v3, Lc2/b;->h:Ly1/A;

    if-eqz v0, :cond_1f2

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_145

    goto/16 :goto_1f2

    :cond_145
    iget-object v0, v3, Lc2/b;->h:Ly1/A;

    invoke-virtual {v0}, Ly1/A;->f()Ljava/util/ArrayList;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_153

    goto/16 :goto_1fd

    :cond_153
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    const-wide/16 v13, 0x3e8

    div-long/2addr v11, v13

    invoke-interface {v0}, Ljava/util/List;->size()I

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_161
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1fd

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Lcom/macronum/bledemo/model/BluetoothDevice;

    if-eqz v14, :cond_1ed

    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_17c

    goto/16 :goto_1ed

    :cond_17c
    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->isShared()Z

    move-result v0

    if-nez v0, :cond_184

    goto/16 :goto_1ed

    :cond_184
    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getOwnerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_1ed

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_195

    goto :goto_1ed

    :cond_195
    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPermissionExpiresAt()J

    move-result-wide v15

    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getPermissionStatus()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v17, 0x0

    cmp-long v17, v15, v17

    if-lez v17, :cond_1a9

    cmp-long v15, v11, v15

    if-ltz v15, :cond_1a9

    move v15, v5

    goto :goto_1aa

    :cond_1a9
    move v15, v8

    :goto_1aa
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-nez v16, :cond_1bc

    const-string v5, "ACTIVE"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1bc

    const/4 v0, 0x1

    goto :goto_1bd

    :catch_1ba
    move-exception v0

    goto :goto_1f8

    :cond_1bc
    move v0, v8

    :goto_1bd
    if-nez v15, :cond_1c1

    if-eqz v0, :cond_1ed

    :cond_1c1
    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_1c4
    .catch Ljava/lang/Exception; {:try_start_139 .. :try_end_1c4} :catch_1ba

    :try_start_1c4
    iget-object v0, v3, Lc2/b;->h:Ly1/A;

    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    const-string v15, "permission_expired"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6, v8, v15}, Ly1/A;->e(Ljava/lang/String;Ly1/z;ZLjava/lang/String;)Z

    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;
    :try_end_1d3
    .catch Ljava/lang/Exception; {:try_start_1c4 .. :try_end_1d3} :catch_1d4

    goto :goto_1ed

    :catch_1d4
    move-exception v0

    :try_start_1d5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u3010\u6743\u9650\u68c0\u67e5\u3011\u5220\u9664\u8fc7\u671f\u8bbe\u5907\u5931\u8d25: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Lcom/macronum/bledemo/model/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v10, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1ed
    :goto_1ed
    const/4 v5, 0x1

    const/16 v6, 0x21

    goto/16 :goto_161

    :cond_1f2
    :goto_1f2
    const-string v0, "checkAndRemoveExpiredPermissions: deviceManager\u6216userId\u4e3a\u7a7a"

    invoke-static {v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f7
    .catch Ljava/lang/Exception; {:try_start_1d5 .. :try_end_1f7} :catch_1ba

    goto :goto_1fd

    :goto_1f8
    const-string v3, "\u3010\u6743\u9650\u68c0\u67e5\u3011\u68c0\u67e5\u8fc7\u671f\u6743\u9650\u5931\u8d25"

    invoke-static {v10, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1fd
    :goto_1fd
    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v0, v0, Lcom/macronum/bledemo/MainActivity;->r0:LG1/d;

    if-eqz v0, :cond_207

    invoke-virtual {v0}, LG1/d;->l()V

    goto :goto_20e

    :cond_207
    const-string v0, "MainActivity"

    const-string v3, "DeviceListManager\u672a\u521d\u59cb\u5316\uff0c\u65e0\u6cd5\u52a0\u8f7d\u8bbe\u5907"

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_20e
    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v0, v8}, Lcom/macronum/bledemo/MainActivity;->K(Z)V

    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v3, v0, Lcom/macronum/bledemo/MainActivity;->v0:LC1/b;

    iget-object v0, v0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    iget-object v5, v1, Lb2/t;->e:Ljava/lang/Object;

    check-cast v5, Landroid/os/Handler;

    const-wide/16 v8, 0xc8

    if-eqz v3, :cond_233

    if-eqz v0, :cond_233

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_233

    new-instance v6, LS1/Q1;

    const/16 v10, 0xb

    invoke-direct {v6, v3, v10, v0}, LS1/Q1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_233
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    if-eqz v0, :cond_274

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v0

    if-nez v0, :cond_240

    goto :goto_274

    :cond_240
    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    invoke-static {v0}, Lcom/macronum/bledemo/MainActivity;->z(Lcom/macronum/bledemo/MainActivity;)V

    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v3, v0, Lcom/macronum/bledemo/MainActivity;->g0:LI2/e;

    if-eqz v3, :cond_254

    new-instance v6, LS1/d1;

    const/4 v10, 0x1

    invoke-direct {v6, v3, v10}, LS1/d1;-><init>(LI2/e;I)V

    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_254
    iget-object v3, v0, Lcom/macronum/bledemo/MainActivity;->w0:LN1/a;

    iget-object v0, v0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    if-eqz v3, :cond_26f

    if-eqz v0, :cond_26f

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_26f

    new-instance v4, LS1/Q1;

    const/16 v6, 0xc

    invoke-direct {v4, v0, v6, v3}, LS1/Q1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    const-wide/16 v10, 0xfa

    invoke-virtual {v5, v4, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_274

    :cond_26f
    const-string v0, "\u3010\u4efb\u52a17-onResume\u3011DirectDetectionManager\u6216\u8bbe\u5907\u5217\u8868\u4e3a\u7a7a\uff0c\u8df3\u8fc7\u63a2\u6d4b"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_274
    :goto_274
    :try_start_274
    iget-object v0, v2, Ly1/H;->a:Lcom/macronum/bledemo/MainActivity;

    iget-object v0, v0, Lcom/macronum/bledemo/MainActivity;->G:Ljava/util/ArrayList;

    if-eqz v0, :cond_28a

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_28a

    new-instance v0, LS1/b2;

    const/16 v2, 0x9

    invoke-direct {v0, v2, v1}, LS1/b2;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v5, v0, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_28a
    .catch Ljava/lang/Exception; {:try_start_274 .. :try_end_28a} :catch_28a

    :catch_28a
    :cond_28a
    iget-object v0, v7, Lcom/macronum/bledemo/MainActivity;->a0:LI2/e;

    if-eqz v0, :cond_2d0

    iget-boolean v1, v0, LI2/e;->a:Z

    if-nez v1, :cond_2d0

    iget-object v1, v0, LI2/e;->c:Ljava/lang/Object;

    check-cast v1, LA0/d;

    if-nez v1, :cond_299

    goto :goto_2d0

    :cond_299
    :try_start_299
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    const-string v2, "com.macronum.bledemo.ACTION_REMOTE_DATA_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v2, "com.macronum.bledemo.MQTT_CONNECTED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_2aa
    .catch Ljava/lang/Exception; {:try_start_299 .. :try_end_2aa} :catch_2bc

    iget-object v3, v0, LI2/e;->b:Ljava/lang/Object;

    check-cast v3, Lcom/macronum/bledemo/MainActivity;

    const/16 v4, 0x21

    if-lt v2, v4, :cond_2be

    :try_start_2b2
    iget-object v2, v0, LI2/e;->c:Ljava/lang/Object;

    check-cast v2, LA0/d;

    const/4 v4, 0x4

    invoke-virtual {v3, v2, v1, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    :goto_2ba
    const/4 v1, 0x1

    goto :goto_2c6

    :catch_2bc
    move-exception v0

    goto :goto_2c9

    :cond_2be
    iget-object v2, v0, LI2/e;->c:Ljava/lang/Object;

    check-cast v2, LA0/d;

    invoke-virtual {v3, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_2ba

    :goto_2c6
    iput-boolean v1, v0, LI2/e;->a:Z
    :try_end_2c8
    .catch Ljava/lang/Exception; {:try_start_2b2 .. :try_end_2c8} :catch_2bc

    goto :goto_2d0

    :goto_2c9
    const-string v1, "BroadcastReceiverManager"

    const-string v2, "\u6ce8\u518c\u5e7f\u64ad\u63a5\u6536\u5668\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2d0
    :goto_2d0
    iget-object v1, v7, Lcom/macronum/bledemo/MainActivity;->c0:LC0/i;

    if-eqz v1, :cond_2fe

    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    if-eqz v0, :cond_32a

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v0

    if-eqz v0, :cond_32a

    :try_start_2e0
    invoke-static {}, LR1/b;->a()LR1/b;

    move-result-object v0

    iget-object v2, v1, LC0/i;->b:Ljava/lang/Object;

    check-cast v2, Lcom/macronum/bledemo/MainActivity;

    invoke-virtual {v0, v2}, LR1/b;->d(Landroid/app/Activity;)V
    :try_end_2eb
    .catch Ljava/lang/Exception; {:try_start_2e0 .. :try_end_2eb} :catch_2ec

    goto :goto_2f4

    :catch_2ec
    move-exception v0

    const-string v2, "LifecycleManager"

    const-string v3, "\u5f3a\u5236\u540c\u6b65\u5931\u8d25"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2f4
    iget-object v0, v1, LC0/i;->d:Ljava/lang/Object;

    check-cast v0, LS1/b2;

    if-eqz v0, :cond_32a

    invoke-virtual {v0}, LS1/b2;->run()V

    goto :goto_32a

    :cond_2fe
    invoke-static {}, LZ1/a;->f()LZ1/a;

    move-result-object v0

    if-eqz v0, :cond_323

    invoke-virtual {v0}, LZ1/a;->i()Z

    move-result v0

    if-eqz v0, :cond_323

    iget-object v0, v7, Lcom/macronum/bledemo/MainActivity;->e0:LC0/e;

    if-eqz v0, :cond_32a

    invoke-virtual {v0}, LC0/e;->n()V

    new-instance v1, LA1/h;

    const/4 v2, 0x5

    invoke-direct {v1, v2, v0}, LA1/h;-><init>(ILjava/lang/Object;)V

    iput-object v1, v0, LC0/e;->e:Ljava/lang/Object;

    iget-object v0, v0, LC0/e;->d:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_32a

    :cond_323
    iget-object v0, v7, Lcom/macronum/bledemo/MainActivity;->e0:LC0/e;

    if-eqz v0, :cond_32a

    invoke-virtual {v0}, LC0/e;->n()V

    :cond_32a
    :goto_32a
    return-void

    :goto_32b
    :try_start_32b
    monitor-exit v2
    :try_end_32c
    .catchall {:try_start_32b .. :try_end_32c} :catchall_31

    throw v0
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lcom/macronum/bledemo/MainActivity;->A()V

    :cond_8
    return-void
.end method

