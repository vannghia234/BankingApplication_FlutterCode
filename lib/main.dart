import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/material.dart';

import 'Pages/root_app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.black.withOpacity(0.26),
        ),
        primaryColor: const Color(0xFF5B3D86),
        fontFamily: "opensan",
        appBarTheme:
            const AppBarTheme(backgroundColor: App_color.primaryColor)),
    home: const Root_app(),
  ));
}
