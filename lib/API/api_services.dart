import 'dart:convert';

import 'package:banking_application/API/api_urls.dart';
import 'package:banking_application/models/Balance.dart';
import 'package:http/http.dart' as http;

import '../app_style/func/CheckValue.dart';
import '../models/ResponseTransfer.dart';

class ApiServices {
  ApiServices._();

  static final ApiServices intance = ApiServices._();

  Future<RespondTransfer> resultTransfer() async {

    final response = await http.post(ApiUrls.api_transfer,
        headers: <String, String>{
          'accept': 'application/json',
          'access-token': accessToken,
          'x-api-key': 'hutech_hackathon@123456',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          "data": {
            "amount": "50000",
            "description": "test ck",
            "fromAcct": "068704070000489",
            "toAcct": "003704070000276"
          },
          "request": {
            "requestId": "a7ea23df-7468-439d-9b12-26eb4a760901",
            "requestTime": "1667200102200"
          }
        }));

    return RespondTransfer.fromJson(jsonDecode(response.body));
    // if (response.statusCode == 201) {
    //   return Response.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('fail transfer');
    // }
  }
  Future<Balance> getBalance(String acctNo) async {
    final response = await http.post(ApiUrls.api_getBalance,
    headers: <String, String>{
      'accept': 'application/json',
      'access-token': accessToken,
      'x-api-key': 'hutech_hackathon@123456',
      'Content-Type': 'application/json'
    },
      body:  jsonEncode(<String, dynamic>{
        "data": {
          "acctNo": acctNo
        },
        "request": {
          "requestId": "a7ea23df-7468-439d-9b12-26eb4a760901",
          "requestTime": "1667200102200"
        }
      }
      )
    );
      return Balance.fromJson(jsonDecode(response.body));
  }


}
