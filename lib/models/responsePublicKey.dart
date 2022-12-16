
class ResponsePublicKey {
  Response? response;
  Data? data;

  ResponsePublicKey({this.response, this.data});

  ResponsePublicKey.fromJson(Map<String, dynamic> json) {
    if(json["response"] is Map) {
      response = json["response"] == null ? null : Response.fromJson(json["response"]);
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(response != null) {
      _data["response"] = response?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? key;

  Data({this.key});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["key"] is String) {
      key = json["key"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["key"] = key;
    return _data;
  }
}

class Response {
  String? responseId;
  String? responseCode;
  String? responseMessage;
  String? responseTime;

  Response({this.responseId, this.responseCode, this.responseMessage, this.responseTime});

  Response.fromJson(Map<String, dynamic> json) {
    if(json["responseId"] is String) {
      responseId = json["responseId"];
    }
    if(json["responseCode"] is String) {
      responseCode = json["responseCode"];
    }
    if(json["responseMessage"] is String) {
      responseMessage = json["responseMessage"];
    }
    if(json["responseTime"] is String) {
      responseTime = json["responseTime"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["responseId"] = responseId;
    _data["responseCode"] = responseCode;
    _data["responseMessage"] = responseMessage;
    _data["responseTime"] = responseTime;
    return _data;
  }
}