import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Pages/history_page.dart';
import '../../Pages/home_page.dart';
import '../../Pages/lifeStyle_page.dart';
final Color grayColor = Colors.grey.shade300;
const String fontFamily = 'OpenSans';
String hint8(int kitu){
  String rs = "";
  for(int i = 0; i < kitu; i++){
    rs += '*';
  }
  return rs;
}
String convertObscure(String content){
  int counter = content.length;
  String result = "";
  int temp = 0;
  if(counter > 15){
    temp = content.substring(0, counter - 13).length;
    result = hint8(temp) + content.substring(counter -13);
  }else{
    temp = content.substring(0, counter-4).length;
    result = hint8(temp) + content.substring(counter -4);
  }

  return result;
}
class App_Style {
  static  TextStyle regularStyle(double size){
    return TextStyle(
      fontSize: size,
      color: Colors.black,
    );
  }
  static  TextStyle openSanGoogle(double size){
    return GoogleFonts.openSans(
      fontSize: size,
    );
  }
  static TextStyle primaryStyle(){
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.4));
  }

  static TextStyle boldStyle(double size){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

  }
}