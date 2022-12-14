class RespondTransfer {
  Response? response;
  RespondTransfer({this.response});
  RespondTransfer.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? responseId;
  String? responseCode;
  String? responseMessage;
  String? responseTime;

  Response(
      {this.responseId,
        this.responseCode,
        this.responseMessage,
        this.responseTime});

  Response.fromJson(Map<String, dynamic> json) {
    responseId = json['responseId'];
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    responseTime = json['responseTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseId'] = this.responseId;
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    data['responseTime'] = this.responseTime;
    return data;
  }
}