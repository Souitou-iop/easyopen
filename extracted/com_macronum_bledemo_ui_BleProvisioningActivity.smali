.class public Lcom/macronum/bledemo/ui/BleProvisioningActivity;
.super Lf/g;
.source "SourceFile"


# static fields
.field public static final synthetic T:I


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Landroid/widget/TextView;

.field public C:Landroid/widget/ProgressBar;

.field public D:Landroid/widget/Button;

.field public E:Landroid/widget/ImageButton;

.field public F:Lcom/google/android/material/textfield/TextInputLayout;

.field public G:Landroidx/recyclerview/widget/RecyclerView;

.field public H:Z

.field public I:Landroid/net/wifi/WifiManager;

.field public J:Landroid/bluetooth/BluetoothAdapter;

.field public K:Landroid/bluetooth/le/BluetoothLeScanner;

.field public L:LM1/f;

.field public M:Landroidx/activity/result/c;

.field public final N:Ljava/util/ArrayList;

.field public final O:Ljava/util/HashMap;

.field public P:LS1/k;

.field public final Q:Landroid/os/Handler;

.field public R:Z

.field public final S:LD1/b;

.field public x:LB1/e;

.field public y:Landroid/widget/EditText;

.field public z:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lf/g;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->H:Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->N:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->O:Ljava/util/HashMap;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->Q:Landroid/os/Handler;

    iput-boolean v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->R:Z

    new-instance v0, LD1/b;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, LD1/b;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->S:LD1/b;

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 8

    const-string v0, "Invalid SSID obtained: "

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {p0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_e

    move v1, v3

    goto :goto_f

    :cond_e
    move v1, v2

    :goto_f
    const-string v4, "BleProvisioning"

    if-nez v1, :cond_2c

    const-string v0, "Location permission not granted, may not be able to get WiFi SSID"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->x:LB1/e;

    new-instance v1, LS1/c;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, LS1/c;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;I)V

    new-instance v2, LS1/c;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, LS1/c;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;I)V

    const/16 v3, 0x3eb

    invoke-virtual {v0, p0, v3, v1, v2}, LB1/e;->p(Lf/g;ILjava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void

    :cond_2c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1c

    if-lt v1, v5, :cond_41

    const-string v1, "location"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    if-eqz v1, :cond_56

    invoke-static {v1}, LG1/h;->y(Landroid/location/LocationManager;)Z

    move-result v1

    goto :goto_57

    :cond_41
    :try_start_41
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v5, "location_mode"

    invoke-static {v1, v5, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_4b} :catch_50

    if-eqz v1, :cond_4e

    goto :goto_56

    :cond_4e
    move v1, v2

    goto :goto_57

    :catch_50
    move-exception v1

    const-string v5, "Failed to check location mode"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_56
    :goto_56
    move v1, v3

    :goto_57
    if-nez v1, :cond_64

    const-string v0, "Location services not enabled, WiFi SSID access will be restricted"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "Please enable location services to access WiFi information"

    invoke-virtual {p0, v0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E(Ljava/lang/String;)V

    return-void

    :cond_64
    :try_start_64
    invoke-virtual {p0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->y()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d3

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_d3

    const-string v5, "^\"|\"$"

    const-string v6, ""

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_a7

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_85

    goto :goto_a7

    :cond_85
    const-string v5, "unknown"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a7

    const-string v5, "<unknown ssid>"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a7

    const-string v5, "0x"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9e

    goto :goto_a7

    :cond_9e
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    array-length v5, v5

    const/16 v6, 0x20

    if-le v5, v6, :cond_a8

    :cond_a7
    :goto_a7
    move v3, v2

    :cond_a8
    if-eqz v3, :cond_be

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->A:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->A:Landroid/widget/TextView;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e8

    :catch_bc
    move-exception v0

    goto :goto_de

    :cond_be
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "WiFi network information abnormal"

    invoke-virtual {p0, v0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E(Ljava/lang/String;)V

    goto :goto_e8

    :cond_d3
    const-string v0, "\u65e0\u6cd5\u83b7\u53d6WiFi SSID"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "\u65e0\u6cd5\u83b7\u53d6WiFi\u7f51\u7edc\u4fe1\u606f"

    invoke-virtual {p0, v0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E(Ljava/lang/String;)V
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_dd} :catch_bc

    goto :goto_e8

    :goto_de
    const-string v1, "\u83b7\u53d6WiFi\u4fe1\u606f\u5f02\u5e38"

    invoke-static {v4, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v0, "\u83b7\u53d6WiFi\u4fe1\u606f\u5931\u8d25"

    invoke-virtual {p0, v0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E(Ljava/lang/String;)V

    :goto_e8
    return-void
.end method

.method public final B(LS1/m;)V
    .registers 12

    iget-boolean v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->H:Z

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->z:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_21

    :cond_13
    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->A:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_21
    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->y:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_41

    const p1, 0x7f1001ad

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_41
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v3, 0x20

    if-le v1, v3, :cond_53

    const-string p1, "WiFi\u540d\u79f0\u957f\u5ea6\u8d85\u8fc732\u4e2a\u5b57\u7b26"

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_53
    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->B:Landroid/widget/TextView;

    const v3, 0x7f1001fb

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->B:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->C:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :try_start_69
    new-instance v8, LB1/q;

    invoke-static {}, LB1/c;->d()LB1/c;

    move-result-object v1

    invoke-direct {v8, v1}, LB1/q;-><init>(LB1/c;)V

    new-instance v9, Lb2/r;

    const/4 v6, 0x1

    move-object v1, v9

    move-object v2, p0

    move-object v3, p1

    move-object v4, v0

    move-object v5, v7

    invoke-direct/range {v1 .. v6}, Lb2/r;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/lang/Object;I)V

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, LA0/f;

    const/4 v3, 0x3

    invoke-direct {v2, v8, v3, v9}, LA0/f;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_8b} :catch_8c

    goto :goto_9a

    :catch_8c
    iget-object p1, p1, LS1/m;->b:Ljava/lang/String;

    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->L:LM1/f;

    new-instance v2, LK1/e;

    const/16 v3, 0x9

    invoke-direct {v2, v3, p0}, LK1/e;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v1, p1, v0, v7, v2}, LM1/f;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LM1/e;)V

    :goto_9a
    return-void
.end method

.method public final C()V
    .registers 3

    invoke-virtual {p0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->z()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_1b

    const-string v0, "android.permission.BLUETOOTH_SCAN"

    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u4e3a\u4e86\u626b\u63cf\u548c\u8fde\u63a5\u8bbe\u5907\uff0c\u5e94\u7528\u9700\u8981\u83b7\u53d6\u84dd\u7259\u6743\u9650\u3002\n\n\u2022 \u84dd\u7259\u626b\u63cf\uff1a\u7528\u4e8e\u53d1\u73b0\u9644\u8fd1\u7684\u8bbe\u5907\n\u2022 \u84dd\u7259\u8fde\u63a5\uff1a\u7528\u4e8e\u4e0e\u8bbe\u5907\u5efa\u7acb\u901a\u4fe1"

    invoke-virtual {p0, v1, v0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->D(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_26

    :cond_1b
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u4e3a\u4e86\u626b\u63cf\u9644\u8fd1\u7684\u84dd\u7259\u8bbe\u5907\uff0c\u5e94\u7528\u9700\u8981\u83b7\u53d6\u4f4d\u7f6e\u6743\u9650\u3002\n\n\u2022 \u4f4d\u7f6e\u6743\u9650\uff1aAndroid 6.0-11 \u7cfb\u7edf\u8981\u6c42\u5f00\u542f\u4f4d\u7f6e\u6743\u9650\u624d\u80fd\u8fdb\u884c\u84dd\u7259\u626b\u63cf"

    invoke-virtual {p0, v1, v0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->D(Ljava/lang/String;[Ljava/lang/String;)V

    :goto_26
    return-void
.end method

.method public final D(Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5

    const-string v0, "\n\n\u8bf7\u5728\u63a5\u4e0b\u6765\u7684\u7cfb\u7edf\u5f39\u7a97\u4e2d\u70b9\u51fb\u201c\u5141\u8bb8\u201d\u3002"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, LS1/a1;

    const-string v1, "\u6743\u9650\u7533\u8bf7\u8bf4\u660e"

    invoke-direct {v0, p0, v1, p1}, LS1/a1;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, LS1/h;

    const/4 v1, 0x0

    invoke-direct {p1, p0, p2, v1}, LS1/h;-><init>(Ljava/lang/Object;Ljava/io/Serializable;I)V

    const-string p2, "\u540c\u610f"

    iput-object p2, v0, LS1/a1;->e:Ljava/lang/String;

    iput-object p1, v0, LS1/a1;->g:LS1/Z0;

    new-instance p1, LS1/e;

    invoke-direct {p1, p0}, LS1/e;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;)V

    const-string p2, "\u62d2\u7edd"

    iput-object p2, v0, LS1/a1;->f:Ljava/lang/String;

    iput-object p1, v0, LS1/a1;->h:LS1/Y0;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method public final E(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->A:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->A:Landroid/widget/TextView;

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const-string v0, "\uff0c\u8bf7\u624b\u52a8\u8f93\u5165WiFi\u540d\u79f0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public final F()V
    .registers 3

    iget-boolean v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->R:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    :try_start_5
    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->K:Landroid/bluetooth/le/BluetoothLeScanner;

    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->S:LD1/b;

    invoke-virtual {v0, v1}, Landroid/bluetooth/le/BluetoothLeScanner;->stopScan(Landroid/bluetooth/le/ScanCallback;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_c} :catch_c

    :catch_c
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->R:Z

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->C:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->N:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->B:Landroid/widget/TextView;

    const v1, 0x7f10018f

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_37

    :cond_2b
    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->B:Landroid/widget/TextView;

    const v1, 0x7f1001f4

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_37
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Lf/g;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001d

    invoke-virtual {p0, p1}, Lf/g;->setContentView(I)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "wifi"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/wifi/WifiManager;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->I:Landroid/net/wifi/WifiManager;

    const-string p1, "bluetooth"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothManager;

    if-eqz p1, :cond_26

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p1

    goto :goto_27

    :cond_26
    const/4 p1, 0x0

    :goto_27
    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->J:Landroid/bluetooth/BluetoothAdapter;

    new-instance p1, LM1/f;

    invoke-direct {p1, p0}, LM1/f;-><init>(Lf/g;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->L:LM1/f;

    new-instance p1, LB1/e;

    invoke-direct {p1, p0}, LB1/e;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->x:LB1/e;

    const p1, 0x7f080278

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, p1}, Lf/g;->x(Landroidx/appcompat/widget/Toolbar;)V

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_5f

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object v0

    invoke-virtual {v0, v1}, LC0/f;->s0(Z)V

    invoke-virtual {p0}, Lf/g;->m()LC0/f;

    move-result-object v0

    const v2, 0x7f100032

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, LC0/f;->A0(Ljava/lang/String;)V

    :cond_5f
    :try_start_5f
    new-instance v0, LS1/f;

    invoke-direct {v0, p0}, LS1/f;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_67} :catch_67

    :catch_67
    const p1, 0x7f0802ad

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->A:Landroid/widget/TextView;

    const p1, 0x7f0800fe

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->z:Landroid/widget/EditText;

    const p1, 0x7f08026f

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->F:Lcom/google/android/material/textfield/TextInputLayout;

    const p1, 0x7f08006d

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E:Landroid/widget/ImageButton;

    const p1, 0x7f0800fc

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->y:Landroid/widget/EditText;

    const p1, 0x7f0802af

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->B:Landroid/widget/TextView;

    const p1, 0x7f0801da

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->C:Landroid/widget/ProgressBar;

    const p1, 0x7f080075

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->D:Landroid/widget/Button;

    const p1, 0x7f0801e5

    invoke-virtual {p0, p1}, Lf/g;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->G:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(I)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Le0/J;)V

    new-instance p1, LS1/k;

    new-instance v0, LS1/e;

    invoke-direct {v0, p0}, LS1/e;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;)V

    iget-object v2, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->N:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-direct {p1, v2, v0, v3}, LS1/k;-><init>(Ljava/util/ArrayList;Ljava/lang/Object;I)V

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->P:LS1/k;

    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->G:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Le0/C;)V

    iget-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->D:Landroid/widget/Button;

    new-instance v0, LS1/g;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, LS1/g;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->E:Landroid/widget/ImageButton;

    new-instance v0, LS1/g;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, LS1/g;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->A()V

    new-instance p1, Landroidx/fragment/app/z;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroidx/fragment/app/z;-><init>(I)V

    new-instance v0, LS1/e;

    invoke-direct {v0, p0}, LS1/e;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;)V

    invoke-virtual {p0, p1, v0}, Landroidx/activity/g;->k(Landroid/support/v4/media/session/a;Landroidx/activity/result/b;)Landroidx/activity/result/c;

    move-result-object p1

    iput-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->M:Landroidx/activity/result/c;

    iget-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->J:Landroid/bluetooth/BluetoothAdapter;

    if-nez p1, :cond_11e

    const-string p1, "\u8bbe\u5907\u4e0d\u652f\u6301\u84dd\u7259"

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_134

    :cond_11e
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result p1

    if-nez p1, :cond_131

    iget-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->M:Landroidx/activity/result/c;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/activity/result/c;->b0(Ljava/lang/Object;)V

    goto :goto_134

    :cond_131
    invoke-virtual {p0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->C()V

    :goto_134
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lf/g;->onDestroy()V

    :try_start_3
    iget-object v0, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->L:LM1/f;

    invoke-virtual {v0}, LM1/f;->c()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_8} :catch_8

    :catch_8
    invoke-virtual {p0}, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->F()V

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

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 7

    invoke-super {p0, p1, p2, p3}, Lf/g;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    const/16 v0, 0x3eb

    if-ne p1, v0, :cond_18

    iget-object p1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->x:LB1/e;

    new-instance v0, LS1/c;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, LS1/c;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;I)V

    new-instance v1, LS1/c;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, LS1/c;-><init>(Lcom/macronum/bledemo/ui/BleProvisioningActivity;I)V

    invoke-virtual {p1, p2, p3, v0, v1}, LB1/e;->l([Ljava/lang/String;[ILjava/lang/Runnable;Ljava/lang/Runnable;)V

    :cond_18
    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 9

    const-string v0, "BleProvisioning"

    :try_start_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_4
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_4} :catch_46
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4} :catch_44

    const/4 v2, 0x1

    const-string v3, "unknown"

    const-string v4, "<unknown ssid>"

    const/16 v5, 0x1d

    if-lt v1, v5, :cond_49

    :try_start_d
    const-string v6, "connectivity"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/ConnectivityManager;

    if-eqz v6, :cond_49

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v7

    if-eqz v7, :cond_49

    invoke-virtual {v6, v7}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v6

    if-eqz v6, :cond_49

    invoke-virtual {v6, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v6

    if-eqz v6, :cond_49

    iget-object v6, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->I:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v6

    if-eqz v6, :cond_49

    invoke-virtual {v6}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_49

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_49

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_49

    return-object v6

    :catch_44
    move-exception v1

    goto :goto_b0

    :catch_46
    move-exception v1

    goto/16 :goto_b6

    :cond_49
    if-ge v1, v5, :cond_66

    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->I:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    if-eqz v1, :cond_66

    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_66

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_66

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_66

    return-object v1

    :cond_66
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {p0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1
    :try_end_6c
    .catch Ljava/lang/SecurityException; {:try_start_d .. :try_end_6c} :catch_46
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_6c} :catch_44

    if-nez v1, :cond_6f

    goto :goto_70

    :cond_6f
    const/4 v2, 0x0

    :goto_70
    if-eqz v2, :cond_bb

    :try_start_72
    iget-object v1, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->I:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_bb

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_bb

    iget-object v2, p0, Lcom/macronum/bledemo/ui/BleProvisioningActivity;->I:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    if-eqz v2, :cond_bb

    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_90
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_bb

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/ScanResult;

    iget-object v4, v3, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    if-eqz v4, :cond_90

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_90

    iget-object v0, v3, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;
    :try_end_a8
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_a8} :catch_a9

    return-object v0

    :catch_a9
    move-exception v1

    :try_start_aa
    const-string v2, "WiFi scan failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_af
    .catch Ljava/lang/SecurityException; {:try_start_aa .. :try_end_af} :catch_46
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_af} :catch_44

    goto :goto_bb

    :goto_b0
    const-string v2, "\u83b7\u53d6WiFi SSID\u5f02\u5e38"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_bb

    :goto_b6
    const-string v2, "WiFi\u8bbf\u95ee\u88ab\u62d2\u7edd\uff0c\u53ef\u80fd\u662f\u6743\u9650\u95ee\u9898"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_bb
    :goto_bb
    const/4 v0, 0x0

    return-object v0
.end method

.method public final z()Z
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v1, :cond_1a

    const-string v0, "android.permission.BLUETOOTH_SCAN"

    invoke-static {p0, v0}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {p0, v0}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_19

    move v2, v3

    :cond_19
    return v2

    :cond_1a
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v0}, LA/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_23

    move v2, v3

    :cond_23
    return v2
.end method

