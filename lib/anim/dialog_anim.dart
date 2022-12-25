import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
Future showDialogIn(BuildContext context){
  return showDialog(context: context, builder: (context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Center(
        child: Lottie.asset('assets/images/hamter.json', width: 70, height: 70),
      ),
    );
  },);
}