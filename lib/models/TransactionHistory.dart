class TransactionHistory {
  Data? data;
  Request? request;

  TransactionHistory({this.data, this.request});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if(json["request"] is Map) {
      request = json["request"] == null ? null : Request.fromJson(json["request"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    if(request != null) {
      _data["request"] = request?.toJson();
    }
    return _data;
  }
}

class Request {
  String? requestId;
  String? requestTime;

  Request({this.requestId, this.requestTime});

  Request.fromJson(Map<String, dynamic> json) {
    if(json["requestId"] is String) {
      requestId = json["requestId"];
    }
    if(json["requestTime"] is String) {
      requestTime = json["requestTime"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["requestId"] = requestId;
    _data["requestTime"] = requestTime;
    return _data;
  }
}

class Data {
  String? acctNo;
  String? fromDate;
  String? toDate;

  Data({this.acctNo, this.fromDate, this.toDate});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["acctNo"] is String) {
      acctNo = json["acctNo"];
    }
    if(json["fromDate"] is String) {
      fromDate = json["fromDate"];
    }
    if(json["toDate"] is String) {
      toDate = json["toDate"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["acctNo"] = acctNo;
    _data["fromDate"] = fromDate;
    _data["toDate"] = toDate;
    return _data;
  }
}