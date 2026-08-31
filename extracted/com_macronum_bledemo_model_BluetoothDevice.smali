.class public Lcom/macronum/bledemo/model/BluetoothDevice;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private address:Ljava/lang/String;

.field private attribute:I

.field private batteryLevel:I

.field private bleEnabled:Z

.field private closeTime:I

.field private gatewayId:Ljava/lang/String;

.field private isOnline:Z

.field private lastSeen:J

.field private name:Ljava/lang/String;

.field private openTime:I

.field private ownerId:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private permissionBleAllowed:Z

.field private permissionExpiresAt:J

.field private permissionStartsAt:J

.field private permissionStatus:Ljava/lang/String;

.field private remoteEnabled:Z

.field private sensitiveSynced:Z

.field private shared:Z

.field private sortOrder:I

.field private waitTime:I


# direct methods
.method public constructor <init>()V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionStartsAt:J

    iput-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionExpiresAt:J

    const-string v2, "ACTIVE"

    iput-object v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionStatus:Ljava/lang/String;

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionBleAllowed:Z

    const/4 v3, -0x1

    iput v3, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->batteryLevel:I

    iput-boolean v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->isOnline:Z

    iput-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->lastSeen:J

    iput v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->openTime:I

    iput v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->waitTime:I

    iput v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->closeTime:I

    iput v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->attribute:I

    iput v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->sortOrder:I

    iput-boolean v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->shared:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->ownerId:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->remoteEnabled:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->bleEnabled:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->sensitiveSynced:Z

    return-void
.end method

.method public static createNewDevice()Lcom/macronum/bledemo/model/BluetoothDevice;
    .registers 2

    new-instance v0, Lcom/macronum/bledemo/model/BluetoothDevice;

    invoke-direct {v0}, Lcom/macronum/bledemo/model/BluetoothDevice;-><init>()V

    const/16 v1, 0x28a

    iput v1, v0, Lcom/macronum/bledemo/model/BluetoothDevice;->openTime:I

    const/16 v1, 0x7d0

    iput v1, v0, Lcom/macronum/bledemo/model/BluetoothDevice;->waitTime:I

    const/16 v1, 0x258

    iput v1, v0, Lcom/macronum/bledemo/model/BluetoothDevice;->closeTime:I

    const/4 v1, 0x0

    iput v1, v0, Lcom/macronum/bledemo/model/BluetoothDevice;->attribute:I

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_29

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_12

    goto :goto_29

    :cond_12
    check-cast p1, Lcom/macronum/bledemo/model/BluetoothDevice;

    iget-object v2, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->address:Ljava/lang/String;

    if-nez v2, :cond_1d

    iget-object v3, p1, Lcom/macronum/bledemo/model/BluetoothDevice;->address:Ljava/lang/String;

    if-nez v3, :cond_1d

    return v0

    :cond_1d
    if-eqz v2, :cond_29

    iget-object p1, p1, Lcom/macronum/bledemo/model/BluetoothDevice;->address:Ljava/lang/String;

    if-nez p1, :cond_24

    goto :goto_29

    :cond_24
    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_29
    :goto_29
    return v1
.end method

.method public getAddress()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getAttribute()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->attribute:I

    return v0
.end method

.method public getBatteryLevel()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->batteryLevel:I

    return v0
.end method

.method public getCloseTime()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->closeTime:I

    return v0
.end method

.method public getGatewayId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->gatewayId:Ljava/lang/String;

    return-object v0
.end method

.method public getLastSeen()J
    .registers 3

    iget-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->lastSeen:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOpenTime()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->openTime:I

    return v0
.end method

.method public getOwnerId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->ownerId:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissionExpiresAt()J
    .registers 3

    iget-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionExpiresAt:J

    return-wide v0
.end method

.method public getPermissionStartsAt()J
    .registers 3

    iget-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionStartsAt:J

    return-wide v0
.end method

.method public getPermissionStatus()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getSortOrder()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->sortOrder:I

    return v0
.end method

.method public getWaitTime()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->waitTime:I

    return v0
.end method

.method public hashCode()I
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->address:Ljava/lang/String;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    :cond_6
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isBleEnabled()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->bleEnabled:Z

    return v0
.end method

.method public isOnline()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->isOnline:Z

    return v0
.end method

.method public isPermissionBleAllowed()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionBleAllowed:Z

    return v0
.end method

.method public isPermissionExpired(J)Z
    .registers 11

    iget-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionStartsAt:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const/4 v5, 0x1

    if-lez v4, :cond_11

    const-wide/16 v6, 0x1

    sub-long/2addr v0, v6

    cmp-long v0, p1, v0

    if-gez v0, :cond_11

    return v5

    :cond_11
    iget-wide v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionExpiresAt:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_1c

    cmp-long p1, p1, v0

    if-ltz p1, :cond_1c

    return v5

    :cond_1c
    const/4 p1, 0x0

    return p1
.end method

.method public isRemoteEnabled()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->remoteEnabled:Z

    return v0
.end method

.method public isSensitiveSynced()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->sensitiveSynced:Z

    return v0
.end method

.method public isShared()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->shared:Z

    return v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->address:Ljava/lang/String;

    return-void
.end method

.method public setAttribute(I)V
    .registers 2

    iput p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->attribute:I

    return-void
.end method

.method public setBatteryLevel(I)V
    .registers 2

    iput p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->batteryLevel:I

    return-void
.end method

.method public setBleEnabled(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->bleEnabled:Z

    return-void
.end method

.method public setCloseTime(I)V
    .registers 2

    iput p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->closeTime:I

    return-void
.end method

.method public setGatewayId(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->gatewayId:Ljava/lang/String;

    return-void
.end method

.method public setLastSeen(J)V
    .registers 3

    iput-wide p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->lastSeen:J

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->name:Ljava/lang/String;

    return-void
.end method

.method public setOnline(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->isOnline:Z

    return-void
.end method

.method public setOpenTime(I)V
    .registers 2

    iput p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->openTime:I

    return-void
.end method

.method public setOwnerId(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->ownerId:Ljava/lang/String;

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->password:Ljava/lang/String;

    return-void
.end method

.method public setPermissionBleAllowed(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionBleAllowed:Z

    return-void
.end method

.method public setPermissionExpiresAt(J)V
    .registers 3

    iput-wide p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionExpiresAt:J

    return-void
.end method

.method public setPermissionStartsAt(J)V
    .registers 3

    iput-wide p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionStartsAt:J

    return-void
.end method

.method public setPermissionStatus(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->permissionStatus:Ljava/lang/String;

    return-void
.end method

.method public setRemoteEnabled(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->remoteEnabled:Z

    return-void
.end method

.method public setSensitiveSynced(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->sensitiveSynced:Z

    return-void
.end method

.method public setShared(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->shared:Z

    return-void
.end method

.method public setSortOrder(I)V
    .registers 2

    iput p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->sortOrder:I

    return-void
.end method

.method public setWaitTime(I)V
    .registers 2

    iput p1, p0, Lcom/macronum/bledemo/model/BluetoothDevice;->waitTime:I

    return-void
.end method

