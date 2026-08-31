.class public Lcom/macronum/bledemo/model/DetectionCommand;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private commandType:Ljava/lang/String;

.field private deviceMac:Ljava/lang/String;

.field private gatewayMac:Ljava/lang/String;

.field private timestamp:J

.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    const-string v0, "direct_detection"

    iput-object v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->commandType:Ljava/lang/String;

    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->timestamp:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 4
    invoke-direct {p0}, Lcom/macronum/bledemo/model/DetectionCommand;-><init>()V

    .line 5
    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->deviceMac:Ljava/lang/String;

    .line 6
    iput-object p2, p0, Lcom/macronum/bledemo/model/DetectionCommand;->gatewayMac:Ljava/lang/String;

    .line 7
    iput-object p3, p0, Lcom/macronum/bledemo/model/DetectionCommand;->userId:Ljava/lang/String;

    return-void
.end method

.method public static fromJson(Ljava/lang/String;)Lcom/macronum/bledemo/model/DetectionCommand;
    .registers 5

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Lcom/macronum/bledemo/model/DetectionCommand;

    invoke-direct {p0}, Lcom/macronum/bledemo/model/DetectionCommand;-><init>()V

    const-string v1, "commandType"

    const-string v2, "direct_detection"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->commandType:Ljava/lang/String;

    const-string v1, "deviceMac"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->deviceMac:Ljava/lang/String;

    const-string v1, "gatewayMac"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->gatewayMac:Ljava/lang/String;

    const-string v1, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->timestamp:J

    const-string v1, "userId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->userId:Ljava/lang/String;
    :try_end_38
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_38} :catch_39

    return-object p0

    :catch_39
    move-exception p0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Failed to parse DetectionCommand from JSON"

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public getCommandType()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->commandType:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceMac()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->deviceMac:Ljava/lang/String;

    return-object v0
.end method

.method public getGatewayMac()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->gatewayMac:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .registers 3

    iget-wide v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->timestamp:J

    return-wide v0
.end method

.method public getUserId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DetectionCommand;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public setCommandType(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->commandType:Ljava/lang/String;

    return-void
.end method

.method public setDeviceMac(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->deviceMac:Ljava/lang/String;

    return-void
.end method

.method public setGatewayMac(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->gatewayMac:Ljava/lang/String;

    return-void
.end method

.method public setTimestamp(J)V
    .registers 3

    iput-wide p1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->timestamp:J

    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->userId:Ljava/lang/String;

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .registers 5

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "commandType"

    iget-object v2, p0, Lcom/macronum/bledemo/model/DetectionCommand;->commandType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "deviceMac"

    iget-object v2, p0, Lcom/macronum/bledemo/model/DetectionCommand;->deviceMac:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "gatewayMac"

    iget-object v2, p0, Lcom/macronum/bledemo/model/DetectionCommand;->gatewayMac:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "timestamp"

    iget-wide v2, p0, Lcom/macronum/bledemo/model/DetectionCommand;->timestamp:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "userId"

    iget-object v2, p0, Lcom/macronum/bledemo/model/DetectionCommand;->userId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_2c} :catch_2d

    return-object v0

    :catch_2d
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to convert DetectionCommand to JSON"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DetectionCommand{commandType=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->commandType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', deviceMac=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->deviceMac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', gatewayMac=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->gatewayMac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->timestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", userId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/macronum/bledemo/model/DetectionCommand;->userId:Ljava/lang/String;

    const-string v2, "\'}"

    invoke-static {v0, v1, v2}, LA/e;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

