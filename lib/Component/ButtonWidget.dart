import 'package:flutter/material.dart';

import '../app_style/app_color/App_color.dart';
import 'package:lottie/lottie.dart';

class ButtonWidget extends StatelessWidget {
  final Size size;
  final String text;
  final VoidCallback? onTapp;
  final bool isLoading;
  const ButtonWidget({
    Key? key,
    this.isLoading = false,
    required this.size,
    required this.text,
    required this.onTapp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
          onPressed: onTapp,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 15),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: App_color.primaryColor),
          child: Container(
              alignment: Alignment.center,
              width: size.width - 20,
              child: isLoading? Lottie.asset('assets/images/loadIos.json', width: 30,height: 30): Text(
                text.toUpperCase(),
                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              ))),
    );
  }
}
