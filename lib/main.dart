import 'package:banking_application/Pages/LoginPage.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Pages/root_app.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    useInheritedMediaQuery: true,
    locale: DevicePreview.locale(context),
    builder: DevicePreview.appBuilder,
  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
    theme: ThemeData(
        dividerTheme: const DividerThemeData(
          thickness: 0.5,
          color: Colors.white24,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          suffixIconColor: App_color.primaryColor,
        ),
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: App_color.primaryColor
        ),
        primaryColor:  const Color(0xFF5B3D86),
        fontFamily: "OpenSans",
        appBarTheme:
        const AppBarTheme(backgroundColor: App_color.primaryColor)),
    home: const LoginPage(),
  ),));
}
