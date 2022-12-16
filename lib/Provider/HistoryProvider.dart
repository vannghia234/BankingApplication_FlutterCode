import 'dart:convert';
import 'dart:core';
import 'package:banking_application/API/api_services.dart';
import 'package:banking_application/API/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../app_style/func/CheckValue.dart';
import '../models/TransactionHistory.dart';
import 'package:provider/provider.dart';
class HistoryProvider extends ChangeNotifier {
  List<TransHis>? lists = [];
  List<TransHis>? get getListHistory => lists;
  int get list_length => list_length;
  Future<TransactionHistory> transHistory() async {
    try {
      final res = await http.post(ApiUrls.api_transferHistory,
          headers: <String, String>{
            'accept': 'application/json',
            'access-token': ApiServices.REFRESH_TOKEN,
            'x-api-key': 'hutech_hackathon@123456',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "data": {
              "acctNo": iD,
              "fromDate": "23012021",
              "toDate": "30012021"
            },
            "request": {
              "requestId": "a7ea23df-7468-439d-9b12-26eb4a760901",
              "requestTime": "1667200102200"
            }
          }));
      TransactionHistory trans =
          TransactionHistory.fromJson(jsonDecode(res.body));
      lists = trans.data?.transHis;
      notifyListeners();
      return trans;
    } catch (err) {
      print('lỗi $err');
    }
    // lists = TransHis.fromJson();
    return throw Exception('fail to load history');
  }
}
