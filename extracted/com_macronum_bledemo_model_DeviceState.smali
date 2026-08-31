.class public Lcom/macronum/bledemo/model/DeviceState;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private battery:I

.field private gatewayId:Ljava/lang/String;

.field private hasBlePermission:Z

.field private hasRemotePermission:Z

.field private isBleOnline:Z

.field private isGatewayOnline:Z

.field private isRemoteOnline:Z

.field private lastUpdateTime:J

.field private final lockMac:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/macronum/bledemo/model/DeviceState;)V
    .registers 4

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iget-object v0, p1, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    iput-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    .line 13
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    .line 14
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    .line 15
    iget v0, p1, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    iput v0, p0, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    .line 16
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    .line 17
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    .line 18
    iget-object v0, p1, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    iput-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    .line 19
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    iput-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    .line 20
    iget-wide v0, p1, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    .line 4
    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    .line 5
    iput p1, p0, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    .line 6
    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    .line 7
    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    .line 9
    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p1, 0x1

    return p1

    :cond_4
    if-eqz p1, :cond_1c

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_11

    goto :goto_1c

    :cond_11
    check-cast p1, Lcom/macronum/bledemo/model/DeviceState;

    iget-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    iget-object p1, p1, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1c
    :goto_1c
    const/4 p1, 0x0

    return p1
.end method

.method public getBattery()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    return v0
.end method

.method public getGatewayId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    return-object v0
.end method

.method public getLastUpdateTime()J
    .registers 3

    iget-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-wide v0
.end method

.method public getLockMac()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    return-object v0
.end method

.method public hasBlePermission()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    return v0
.end method

.method public hasRemotePermission()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    return v0
.end method

.method public hashCode()I
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isBleOnline()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    return v0
.end method

.method public isGatewayOnline()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    return v0
.end method

.method public isRemoteOnline()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    return v0
.end method

.method public merge(Lcom/macronum/bledemo/model/DeviceState;)Lcom/macronum/bledemo/model/DeviceState;
    .registers 6

    iget-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    iget-object v1, p1, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_11

    iput-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    :cond_11
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    if-eqz v0, :cond_17

    iput-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    :cond_17
    iget v0, p1, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    if-lez v0, :cond_1d

    iput v0, p0, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    :cond_1d
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    if-eqz v0, :cond_23

    iput-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    :cond_23
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    if-eqz v0, :cond_29

    iput-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    :cond_29
    iget-object v0, p1, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    if-eqz v0, :cond_37

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_37

    iget-object v0, p1, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    iput-object v0, p0, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    :cond_37
    iget-boolean v0, p1, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    if-eqz v0, :cond_3d

    iput-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    :cond_3d
    iget-wide v0, p1, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    iget-wide v2, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    cmp-long p1, v0, v2

    if-lez p1, :cond_47

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    :cond_47
    return-object p0

    :cond_48
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot merge states with different lockMac"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setBattery(I)Lcom/macronum/bledemo/model/DeviceState;
    .registers 4

    iput p1, p0, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

.method public setBleOnline(Z)Lcom/macronum/bledemo/model/DeviceState;
    .registers 4

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

.method public setBlePermission(Z)Lcom/macronum/bledemo/model/DeviceState;
    .registers 4

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

.method public setGatewayId(Ljava/lang/String;)Lcom/macronum/bledemo/model/DeviceState;
    .registers 4

    iput-object p1, p0, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

.method public setGatewayOnline(Z)Lcom/macronum/bledemo/model/DeviceState;
    .registers 4

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

.method public setRemoteOnline(Z)Lcom/macronum/bledemo/model/DeviceState;
    .registers 4

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

.method public setRemotePermission(Z)Lcom/macronum/bledemo/model/DeviceState;
    .registers 4

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DeviceState{lockMac=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/macronum/bledemo/model/DeviceState;->lockMac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', isRemoteOnline="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->isRemoteOnline:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isBleOnline="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->isBleOnline:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", battery="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/macronum/bledemo/model/DeviceState;->battery:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", hasRemotePermission="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasRemotePermission:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", hasBlePermission="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->hasBlePermission:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", gatewayId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/macronum/bledemo/model/DeviceState;->gatewayId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', isGatewayOnline="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/macronum/bledemo/model/DeviceState;->isGatewayOnline:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", lastUpdateTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateTimestamp()Lcom/macronum/bledemo/model/DeviceState;
    .registers 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DeviceState;->lastUpdateTime:J

    return-object p0
.end method

