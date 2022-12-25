import 'dart:async';

import 'package:banking_application/Pages/root_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimationPage extends StatefulWidget {
  const LoadingAnimationPage({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationPage> createState() => _LoadingAnimationPageState();
}

class _LoadingAnimationPageState extends State<LoadingAnimationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(const Duration(milliseconds: 2500), () {
    //   // Navigator.push(
    //   //     context, MaterialPageRoute(builder: (context) => const Root_app(),));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset('assets/images/loading.json', width: 200, height: 200),
            Lottie.network('https://assets9.lottiefiles.com/packages/lf20_rwq6ciql.json', width: 100, height: 100)
          ],
        ),
      ),

    );
  }
}
