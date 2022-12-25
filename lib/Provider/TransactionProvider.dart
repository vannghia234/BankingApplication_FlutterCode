import 'dart:convert';
import 'package:banking_application/API/api_services.dart';
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
            'access-token': ApiServices.REFRESH_TOKEN,
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
      print("số dư ${sodu.data?.amount}");
      _currentMoney = double.tryParse(sodu.data?.amount ?? "");
      notifyListeners();
      return sodu;
    } catch (err){
      print('$err');
    }
    return throw Exception('fail get balance');
  }
  // Future<String> getRefreshToken() async {
  //   try{
  //     final response = await http.post(ApiUrls.api_getRefreshToken,
  //         headers: {
  //           'accept': 'application/json',
  //           'Content-Type': 'application/x-www-form-urlencoded'
  //         },
  //         body: 'client_id=sikcnei4t2h3ntkqj5d49ltvr&grant_type=refresh_token&refresh_token=eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiUlNBLU9BRVAifQ.hrFb-dCdjwrUGgOnYVGqIvWKSbk3n4fX5K87uVYHrJSc-JWYEvHJ1vA-Ws14xuj8sInBVJZl36AIHJCe5Kee1m5zMGAk64b76OODTfYdA3cwgQlKpHTqYZlLj0eLSu9Zob4YKVeHS9eeNU7dmiGzBQOf91jcESPd-g8LSPvcdfjZx-ZYvQO8AErd4w230fEippEIi6rfb8BWQpbL8D8johrvt6GvJ00wqP9-BeutLpMUyj1fOX9ROSvDb0Rp8LHy3sQKVJJbBzNEmQnDvE_TX2nUmS_VtjC8dC-5n4VPWerGtbm2VWLcjLDpmcq01CbcV3OvBj5gN4V7NmX9aMrALQ.VVuP_Y3QjJ9aYM8a.jGhOA00vo9CG_fxH6RmZAANY1yj2-vfQOSKLZVuSMuKKY_zNCbtLvd7tmdJclTBli-0htpX83tAlZpbnpIylvaU2M3dH98oMlGj-133lRU0378WgLLKs8XHVq57tTdscjNRXe2ICSK0YnMzquGmgdCddNUiFKc2ArVK8_kF9Qu0_03ojWeYQ2PYlO-ugTjrBhSCQfZ37jerxfpngND0uHGQq6fWLEqgzZ35OPRyJY-MTtRVPsjdCRZJ0j2umZivOHJiC0WP-mhpe693nUW9z0Gk0qJn1Qon0lgCTDCLAjSxHxZTWcmL50cVsoc0OdiyGjK48bM4S_hRxdJa-hcy6hPjQzBFsUeXRBBs5lgZFIJDrKlUUypOAUEwR4k8p-iFDEE-nAK9Uwqe1LRMZIWLuXfS5jrv8uJb8lwBPsfKtf-vk1FgfOnyAuSNNlTT9uKzwi9PQvcLk0CPUWLop41p14ugNXTwJam9g4f-NbefH8EarQaMVkfNkYRl3KyjotPhxF6-y7wCg70BUwht7SJtqQD5hVe9NNS88n6c6JDNuNH8bUiTMsId3Rm9xWj1fQko0iBbsAQRHnpL9dO4rznDlyPs2u3T7NLoKZQ4OqsfAYJmkLgdb55IxB0biiSkUR1zc9NdYVKRKv8QcnydNH01H2Sahx7Kg951E1blr-dR38acDM1XJcs7ZUPAOQxvUVtwiQX6IL0Q35J2ucvv71BaQfVQVS03moufRyMHFBwsZuln-z9sKNL0kQ5kDyn6GAnNbdF_HUaiPDnbyP7kmcKbQMdF7ABXtQuoCtz0GofbIHLl7WNBw8txnl52Sw2VGlzEDgKff3T4-Gfqqg1-7MGmB9xyWeigQ0PWXxAB7_yiwv1cOJfn3QS2llESR-7wwDRE1lk124vUkDze-zPzAfIlsBgYcqXUKuj9f65sX2V6RWP6D3gb0iyntJERuzZ07pFy2cD0g5f-Rd6nYLWwt4Qf_92gh06W_6KiTk96tz6H_DHttjQBxstvUMKYbC8URApa80q8g2Hxjdy4pQ_NszKCWC0neBAqa82sWEM2mILSjlffDBVKVkV4VbwlAzhGpjFM6l3lpj78bxc0-IhEZeS0ptekC5ONMj4s2_9h1VCBT10X9whk9CJmrRjigqcSTpsc-E19YALouVjOt8whxzn0eTpEbNFojx5LEKfW0v9PE4b4oxEYtRYEC4JbyBln96Kr9XSHdIhtIGsFdmKg-RN1jFkFaqe-1auaq4HPKIu7719lnq_8H4f1sFCSIF1ekcbEfyBiTu9TZd0vSVPQ-Ux0SCFwpTa6QgoLtnGb1PDiau-XS1vhlnTCmxY_yhP-zzIGlAdWqRxUnIQ.iiXAnRUgvmiO77UC3sdLzw'
  //     );
  //     print(jsonDecode(response.body)['access_token']);
  //     return jsonDecode(response.body)['access_token'];
  //   }catch (err){
  //     print('$err');
  //   }
  //   return throw Exception('fail to load refresh token');
  // }
}
