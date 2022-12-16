import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:banking_application/API/api_services.dart';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/pkcs1.dart';
import 'package:pointycastle/asymmetric/rsa.dart';

String publicKey = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCDY1DzbqoavP8UVPYARHpy+zPlaFiBdf3imr5m4RdbHCwMueevk+NoWV2dqL/LBnk8oWMqWkgMDnTleXe/jvj6zQEuuCoBVDiZq4k0JXbHdTmXg0/fH7d9YD0BsSkpSJH8A9RBSnjvIzKLNHXKTUyxG1QIIKbU2lhVAB/jK2UtdwIDAQAB';

String accessToken =
    'eyJraWQiOiJXcDRGMndiQVpMa1d2WWgyNDhnYjNtUHBLRzZTdDRNcG85Tmc3U2diZ2E0PSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJiODU1OTgxNS05YmM4LTQ4YjEtOWMxMi0xMWMyMThhNTIyMjYiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLXNvdXRoZWFzdC0xLmFtYXpvbmF3cy5jb21cL2FwLXNvdXRoZWFzdC0xX1FiMVE4VFBzVSIsImNvZ25pdG86dXNlcm5hbWUiOiJiODU1OTgxNS05YmM4LTQ4YjEtOWMxMi0xMWMyMThhNTIyMjYiLCJvcmlnaW5fanRpIjoiMzVkYWEwNmYtMGEwNS00ZWMyLWI2MjEtMzU5YWE1ODJkM2JhIiwiYXVkIjoic2lrY25laTR0MmgzbnRrcWo1ZDQ5bHR2ciIsImV2ZW50X2lkIjoiODk1OTg5MGEtNjE2Yi00MzY1LTkzNDQtZGEzZGFiNTgyZjBkIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE2NzA5OTkzMDEsIm5hbWUiOiJOZ3V54buFbiBWxINuIE5naMSpYSIsImV4cCI6MTY3MTI0NjYxMCwiaWF0IjoxNjcxMTYwMjEwLCJqdGkiOiJiMTNjNjY2Yy1iNzE1LTRlODEtOTdhMS00OTIwYzc1MzhmNGMiLCJlbWFpbCI6InZuZ2hpYXh4QGdtYWlsLmNvbSJ9.edt0dVVgEOsbFNS_lUTcawTq7Cu8h9J8jbr0FLVOsVKh9Jijg2FDZeGH03lSoxq2Vi3jRv5oVzBSG2uRjDXKyyFjL3u4Jiri_BkBIJUU1ChgJ_cgk6_FGs9Y0GzxP1BQ3qE2s3tZtTJnT-47150C4ho8_IKZlcKTmrDqrbN_KUVEdzk8Xj9CPrqdnIJEQNsEdTvI_3mY_O8vTzTi267k4NBZWjwXoflHrQ_F4k6XTbkKb3oHubAkh64e96h5wl7ohkMvwdAxeIxpR2Po_iV4IW7dDOstqrxjJVH2u03Wthp3Hjlm6SXXeZ5kMLHg7V1N_lRDw8ZMhrOMqtYubirtAg';
String parseMoneyToString(String s){
  return s.replaceAll(',', '');
}
String encryptPassword(String password){
  var pass = password;
  var salt =  'UVocjgjgXg8P7zIsC93kKlRU8sPbTBhsAMFLnLUPDRYFIWAk';
  var saltedPassword = salt + password;
  var bytes = utf8.encode(saltedPassword);
  var hash = sha256.convert(bytes);
  return hash.toString();
}
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
String get4NumberDigit(){
  Random random = Random();
  String number = '';
  for(int i = 0; i < 4; i++){
    number = number + random.nextInt(10).toString();
  }
  return number;
}
 String encryptRSA(String plaintext, String publicKey) {
var pem =
'-----BEGIN RSA PUBLIC KEY-----\n$publicKey\n-----END RSA PUBLIC KEY-----';
var public = CryptoUtils.rsaPublicKeyFromPem(pem);
/// Initalizing Cipher
var cipher = PKCS1Encoding(RSAEngine());
cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));
Uint8List output =
cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
var base64EncodedText = base64.encode(output);
return base64EncodedText;
}


class CheckValue{
static String iD = "068704070000489";
static String PublicKey ="";
static String username = "";

}