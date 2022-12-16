import 'package:flutter/material.dart';
class InfoAccountProvider extends ChangeNotifier{
  String? _sdt;
  String? _hoVaTen;
  String? _email;
  String? _soCccd;
  String? _password;

  String? get sdt => _sdt;
  set sdt(String? value) {
    _sdt = value;
    notifyListeners();
  }

  String? get hoVaTen => _hoVaTen;

  set hoVaTen(String? value){
    _hoVaTen = value;
    notifyListeners();
  }

  String? get email => _email;
  set email(String? value) {
    _email = value;
    notifyListeners();
  }
  String? get soCccd => _soCccd;

  set soCccd(String? value) {
    _soCccd = value;
    notifyListeners();

  }

  String? get password => _password;

  set password(String? value) {
    _password = value;
    notifyListeners();
  }
}