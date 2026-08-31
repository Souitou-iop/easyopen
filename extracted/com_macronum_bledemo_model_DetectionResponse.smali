.class public Lcom/macronum/bledemo/model/DetectionResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private deviceMac:Ljava/lang/String;

.field private gatewayMac:Ljava/lang/String;

.field private isOnline:Z

.field private rssi:I

.field private timestamp:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->timestamp:J

    const/16 v0, -0x64

    .line 3
    iput v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->rssi:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZILjava/lang/String;)V
    .registers 5

    .line 4
    invoke-direct {p0}, Lcom/macronum/bledemo/model/DetectionResponse;-><init>()V

    .line 5
    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->deviceMac:Ljava/lang/String;

    .line 6
    iput-boolean p2, p0, Lcom/macronum/bledemo/model/DetectionResponse;->isOnline:Z

    .line 7
    iput p3, p0, Lcom/macronum/bledemo/model/DetectionResponse;->rssi:I

    .line 8
    iput-object p4, p0, Lcom/macronum/bledemo/model/DetectionResponse;->gatewayMac:Ljava/lang/String;

    return-void
.end method

.method public static fromJson(Ljava/lang/String;)Lcom/macronum/bledemo/model/DetectionResponse;
    .registers 5

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Lcom/macronum/bledemo/model/DetectionResponse;

    invoke-direct {p0}, Lcom/macronum/bledemo/model/DetectionResponse;-><init>()V

    const-string v1, "deviceMac"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->deviceMac:Ljava/lang/String;

    const-string v1, "isOnline"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->isOnline:Z

    const-string v1, "rssi"

    const/16 v2, -0x64

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->rssi:I

    const-string v1, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->timestamp:J

    const-string v1, "gatewayMac"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->gatewayMac:Ljava/lang/String;
    :try_end_39
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_39} :catch_3a

    return-object p0

    :catch_3a
    move-exception p0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Failed to parse DetectionResponse from JSON"

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public getDeviceMac()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->deviceMac:Ljava/lang/String;

    return-object v0
.end method

.method public getGatewayMac()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->gatewayMac:Ljava/lang/String;

    return-object v0
.end method

.method public getRssi()I
    .registers 2

    iget v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->rssi:I

    return v0
.end method

.method public getTimestamp()J
    .registers 3

    iget-wide v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->timestamp:J

    return-wide v0
.end method

.method public isOnline()Z
    .registers 2

    iget-boolean v0, p0, Lcom/macronum/bledemo/model/DetectionResponse;->isOnline:Z

    return v0
.end method

.method public setDeviceMac(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->deviceMac:Ljava/lang/String;

    return-void
.end method

.method public setGatewayMac(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->gatewayMac:Ljava/lang/String;

    return-void
.end method

.method public setOnline(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->isOnline:Z

    return-void
.end method

.method public setRssi(I)V
    .registers 2

    iput p1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->rssi:I

    return-void
.end method

.method public setTimestamp(J)V
    .registers 3

    iput-wide p1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->timestamp:J

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .registers 5

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "deviceMac"

    iget-object v2, p0, Lcom/macronum/bledemo/model/DetectionResponse;->deviceMac:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "isOnline"

    iget-boolean v2, p0, Lcom/macronum/bledemo/model/DetectionResponse;->isOnline:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v1, "rssi"

    iget v2, p0, Lcom/macronum/bledemo/model/DetectionResponse;->rssi:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "timestamp"

    iget-wide v2, p0, Lcom/macronum/bledemo/model/DetectionResponse;->timestamp:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "gatewayMac"

    iget-object v2, p0, Lcom/macronum/bledemo/model/DetectionResponse;->gatewayMac:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_2c} :catch_2d

    return-object v0

    :catch_2d
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to convert DetectionResponse to JSON"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DetectionResponse{deviceMac=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->deviceMac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', isOnline="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->isOnline:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", rssi="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->rssi:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->timestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", gatewayMac=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/macronum/bledemo/model/DetectionResponse;->gatewayMac:Ljava/lang/String;

    const-string v2, "\'}"

    invoke-static {v0, v1, v2}, LA/e;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

