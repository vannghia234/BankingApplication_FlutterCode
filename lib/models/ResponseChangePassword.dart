
class ResponseChangePassword {
  Result? result;

  ResponseChangePassword({this.result});

  ResponseChangePassword.fromJson(Map<String, dynamic> json) {
    if(json["result"] is Map) {
      result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(result != null) {
      _data["result"] = result?.toJson();
    }
    return _data;
  }
}

class Result {
  Response? response;

  Result({this.response});

  Result.fromJson(Map<String, dynamic> json) {
    if(json["response"] is Map) {
      response = json["response"] == null ? null : Response.fromJson(json["response"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(response != null) {
      _data["response"] = response?.toJson();
    }
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