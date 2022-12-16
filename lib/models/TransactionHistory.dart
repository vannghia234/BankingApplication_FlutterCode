
class TransactionHistory {
  Response? response;
  Data? data;

  TransactionHistory({this.response, this.data});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
    if(json["response"] is Map) {
      response = json["response"] == null ? null : Response.fromJson(json["response"]);
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<TransactionHistory> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TransactionHistory.fromJson(map)).toList();
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
  List<TransHis>? transHis;
  Data({this.transHis});
  Data.fromJson(Map<String, dynamic> json) {
    if(json["transHis"] is List) {
      transHis = json["transHis"] == null ? null : (json["transHis"] as List).map((e) => TransHis.fromJson(e)).toList();
    }
  }
  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(transHis != null) {
      _data["transHis"] = transHis?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class TransHis {
  String? transDesc;
  String? transDate;
  String? transAmount;

  TransHis({this.transDesc, this.transDate, this.transAmount});

  TransHis.fromJson(Map<String, dynamic> json) {
    if(json["transDesc"] is String) {
      transDesc = json["transDesc"];
    }
    if(json["transDate"] is String) {
      transDate = json["transDate"];
    }
    if(json["transAmount"] is String) {
      transAmount = json["transAmount"];
    }
  }

  static List<TransHis> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TransHis.fromJson(map)).toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["transDesc"] = transDesc;
    _data["transDate"] = transDate;
    _data["transAmount"] = transAmount;
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

  static List<Response> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Response.fromJson(map)).toList();
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