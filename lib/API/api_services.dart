import 'dart:convert';

import 'package:banking_application/API/api_urls.dart';
import 'package:banking_application/models/ResponseChangePassword.dart';
import 'package:banking_application/models/ResponseLogin.dart';
import 'package:http/http.dart' as http;

import '../app_style/func/CheckValue.dart';
import '../models/ResponseRegister.dart';
import '../models/ResponseTransfer.dart';
import '../models/responsePublicKey.dart';

class ApiServices {
  ApiServices._();

  static final ApiServices intance = ApiServices._();
  static String REFRESH_TOKEN = "";

  Future<ResponseRegister> getResponseRegister(
      {required String username,
      required String pass,
      required String email,
      required String name,
      required String cccd}) async {
    try {
      final response = await http.post(
        ApiUrls.api_register,
        headers: <String, String>{
          'accept': 'application/json',
          'access-token': REFRESH_TOKEN,
          'x-api-key': 'hutech_hackathon@123456',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "username": username,
          "password": pass,
          "email": email,
          "fullName": name,
          "identityNumber": cccd,
          "key":
              "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCDY1DzbqoavP8UVPYARHpy+zPlaFiBdf3imr5m4RdbHCwMueevk+NoWV2dqL/LBnk8oWMqWkgMDnTleXe/jvj6zQEuuCoBVDiZq4k0JXbHdTmXg0/fH7d9YD0BsSkpSJH8A9RBSnjvIzKLNHXKTUyxG1QIIKbU2lhVAB/jK2UtdwIDAQAB",
          "phone": username
        }),
      );
      ResponseRegister res =
          ResponseRegister.fromJson(jsonDecode(response.body));
      print('err: ${res.result?.response?.responseCode}');
      print(
          'kqua ${ResponseRegister.fromJson(jsonDecode(response.body)).result?.response?.responseCode}');
      return res;
    } catch (err) {
      print('lỗi: $err');
    }
    return throw Exception('fail to dang ky');
    // print('Stt code${response.statusCode}');
  }
  Future<ResponseChangePassword> reponseChangePassword({required String credential, required String username, required String password, required String newPass}) async {
    try{
      final ress = await http.post(ApiUrls.api_changePassword,
        body: jsonEncode(
            <String,String>{
              "credential": 'OGRkyAeJZvLuTDC/Rq8lm5bsLmAZdZ9W8xPU3i4+PMk8Y14rwJyDV2MS9OV1zRSUbc8WfJDd18AxYRUxAzM8HIleBs3gQp+nGbhgDTlSSZ8mtwo6h9uU2z9j2ItD6FGJjCCR8+xU8yWBK+lD6L/dZuSrdA4khwY6PPg6eU3cv2s=',
              "userName" : '0234823433',
              "password" : 'Nghiadz@123',
              "newPass" : 'Nghiadz@111'
            }
        )
      );
      ResponseChangePassword ka = ResponseChangePassword.fromJson(jsonDecode(ress.body));
      print('request reset112: ${ka.result?.response?.responseCode}');
      return ka;
    }catch(e){
      print(e);
    }
    return throw Exception('lỗi đổi mật khẩu key');
  }




  Future<String?> getPublicKey() async {
    try{
      final rs = await http.get(ApiUrls.api_getPublicKey,
        headers: <String, String>{
          'accept': 'application/json',
          'access-token': REFRESH_TOKEN,
          'x-api-key': 'hutech_hackathon@123456',
        },
      );
      ResponsePublicKey k = ResponsePublicKey.fromJson(jsonDecode(rs.body));
      print('publickey: ${k.data?.key}');
      return k.data?.key;
    }catch(e){
      print(e);
    }
    return throw Exception('lỗi lấy public key');

  }

  Future<ResponseLogin> getAcccNo(
      {required String username, required String password}) async {
    final res = await http.post(ApiUrls.api_login,
        headers: <String, String>{
          'accept': 'application/json',
          'access-token': REFRESH_TOKEN,
          'x-api-key': 'hutech_hackathon@123456',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({"username": username, "password": password}));
    ResponseLogin r = ResponseLogin.fromJson(jsonDecode(res.body));
    CheckValue.iD = r.result?.data?.accountNo ?? "";
    print('số tài khoản: ${CheckValue.iD}');
    print(
        'login success: ${ResponseLogin.fromJson(jsonDecode(res.body)).result?.response?.responseCode}');
    return ResponseLogin.fromJson(jsonDecode(res.body));
  }

  Future<String> getRefreshToken() async {
    // try {
    //
    // } catch (err) {
    //   print('$err');
    // }
    // return throw Exception('fail to load refresh token');
    try{
      final response = await http.post(ApiUrls.api_getRefreshToken,
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body:
          'client_id=sikcnei4t2h3ntkqj5d49ltvr&grant_type=refresh_token&refresh_token=eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiUlNBLU9BRVAifQ.hrFb-dCdjwrUGgOnYVGqIvWKSbk3n4fX5K87uVYHrJSc-JWYEvHJ1vA-Ws14xuj8sInBVJZl36AIHJCe5Kee1m5zMGAk64b76OODTfYdA3cwgQlKpHTqYZlLj0eLSu9Zob4YKVeHS9eeNU7dmiGzBQOf91jcESPd-g8LSPvcdfjZx-ZYvQO8AErd4w230fEippEIi6rfb8BWQpbL8D8johrvt6GvJ00wqP9-BeutLpMUyj1fOX9ROSvDb0Rp8LHy3sQKVJJbBzNEmQnDvE_TX2nUmS_VtjC8dC-5n4VPWerGtbm2VWLcjLDpmcq01CbcV3OvBj5gN4V7NmX9aMrALQ.VVuP_Y3QjJ9aYM8a.jGhOA00vo9CG_fxH6RmZAANY1yj2-vfQOSKLZVuSMuKKY_zNCbtLvd7tmdJclTBli-0htpX83tAlZpbnpIylvaU2M3dH98oMlGj-133lRU0378WgLLKs8XHVq57tTdscjNRXe2ICSK0YnMzquGmgdCddNUiFKc2ArVK8_kF9Qu0_03ojWeYQ2PYlO-ugTjrBhSCQfZ37jerxfpngND0uHGQq6fWLEqgzZ35OPRyJY-MTtRVPsjdCRZJ0j2umZivOHJiC0WP-mhpe693nUW9z0Gk0qJn1Qon0lgCTDCLAjSxHxZTWcmL50cVsoc0OdiyGjK48bM4S_hRxdJa-hcy6hPjQzBFsUeXRBBs5lgZFIJDrKlUUypOAUEwR4k8p-iFDEE-nAK9Uwqe1LRMZIWLuXfS5jrv8uJb8lwBPsfKtf-vk1FgfOnyAuSNNlTT9uKzwi9PQvcLk0CPUWLop41p14ugNXTwJam9g4f-NbefH8EarQaMVkfNkYRl3KyjotPhxF6-y7wCg70BUwht7SJtqQD5hVe9NNS88n6c6JDNuNH8bUiTMsId3Rm9xWj1fQko0iBbsAQRHnpL9dO4rznDlyPs2u3T7NLoKZQ4OqsfAYJmkLgdb55IxB0biiSkUR1zc9NdYVKRKv8QcnydNH01H2Sahx7Kg951E1blr-dR38acDM1XJcs7ZUPAOQxvUVtwiQX6IL0Q35J2ucvv71BaQfVQVS03moufRyMHFBwsZuln-z9sKNL0kQ5kDyn6GAnNbdF_HUaiPDnbyP7kmcKbQMdF7ABXtQuoCtz0GofbIHLl7WNBw8txnl52Sw2VGlzEDgKff3T4-Gfqqg1-7MGmB9xyWeigQ0PWXxAB7_yiwv1cOJfn3QS2llESR-7wwDRE1lk124vUkDze-zPzAfIlsBgYcqXUKuj9f65sX2V6RWP6D3gb0iyntJERuzZ07pFy2cD0g5f-Rd6nYLWwt4Qf_92gh06W_6KiTk96tz6H_DHttjQBxstvUMKYbC8URApa80q8g2Hxjdy4pQ_NszKCWC0neBAqa82sWEM2mILSjlffDBVKVkV4VbwlAzhGpjFM6l3lpj78bxc0-IhEZeS0ptekC5ONMj4s2_9h1VCBT10X9whk9CJmrRjigqcSTpsc-E19YALouVjOt8whxzn0eTpEbNFojx5LEKfW0v9PE4b4oxEYtRYEC4JbyBln96Kr9XSHdIhtIGsFdmKg-RN1jFkFaqe-1auaq4HPKIu7719lnq_8H4f1sFCSIF1ekcbEfyBiTu9TZd0vSVPQ-Ux0SCFwpTa6QgoLtnGb1PDiau-XS1vhlnTCmxY_yhP-zzIGlAdWqRxUnIQ.iiXAnRUgvmiO77UC3sdLzw');
      REFRESH_TOKEN = jsonDecode(response.body)['id_token'];
      print(response.statusCode);
      return jsonDecode(response.body)['id_token'];
    }catch(err){
      print('lỗi $err');
    }
    return 'lỗi gì đó';

    print(REFRESH_TOKEN);
  }

  Future<RespondTransfer> resultTransfer(
      {required String amount, required String des, required String to}) async {
    final response = await http.post(ApiUrls.api_transfer,
        headers: <String, String>{
          'accept': 'application/json',
          'access-token': ApiServices.REFRESH_TOKEN,
          'x-api-key': 'hutech_hackathon@123456',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          "data": {
            "amount": amount,
            "description": des,
            "fromAcct": CheckValue.iD,
            "toAcct": to
          },
          "request": {
            "requestId": "a7ea23df-7468-439d-9b12-26eb4a760901",
            "requestTime": "1667200102200"
          }
        }));
    // print(
    //     'kq: ${RespondTransfer.fromJson(jsonDecode(response.body)).response?.responseCode}');
    return RespondTransfer.fromJson(jsonDecode(response.body));
    // if (response.statusCode == 201) {
    //   return Response.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('fail transfer');
    // }
  }
}
