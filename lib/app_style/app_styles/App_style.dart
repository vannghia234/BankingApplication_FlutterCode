import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final Color grayColor = Colors.grey.shade300;
const String fontFamily = 'OpenSans';
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

  static TextStyle boldStyle(double size){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

  }
}