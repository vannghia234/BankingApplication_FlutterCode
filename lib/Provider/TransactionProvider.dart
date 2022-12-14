import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:money_formatter/money_formatter.dart';
import '../API/api_urls.dart';
import '../app_style/func/CheckValue.dart';
import '../models/Balance.dart';

class TransactionProvider extends ChangeNotifier {
  double? _currentMoney = 0;
  double? get currentMoney => _currentMoney;
  String get currentMoneyString => MoneyFormatter(amount: _currentMoney!).output.withoutFractionDigits;
  // String get currentMoneyString => MoneyFormatter(amount: _currentMoney! ).output.withoutFractionDigits;
  set setCurrentMoney(double value) {
    _currentMoney = value;
    notifyListeners();
  }


  Future<Balance> getBalance(String acctNo) async {
    try{
      final response = await http.post(ApiUrls.api_getBalance,
          headers: <String, String>{
            'accept': 'application/json',
            'access-token': accessToken,
            'x-api-key': 'hutech_hackathon@123456',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(<String, dynamic>{
            "data": {"acctNo": acctNo},
            "request": {
              "requestId": "a7ea23df-7468-439d-9b12-26eb4a760901",
              "requestTime": "1667200102200"
            }
          }));
      Balance sodu = Balance.fromJson(jsonDecode(response.body));
      _currentMoney = double.tryParse(sodu.data?.amount ?? "");
      notifyListeners();
      return sodu;
    } catch (err){
      print('$err');
    }
    return throw Exception('fail get balance');
  }
}
