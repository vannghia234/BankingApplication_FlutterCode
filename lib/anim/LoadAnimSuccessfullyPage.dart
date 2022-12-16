import 'dart:async';

import 'package:banking_application/Pages/LoginPage.dart';
import 'package:banking_application/Pages/home_page.dart';
import 'package:banking_application/Pages/root_app.dart';
import 'package:banking_application/Provider/InfoAccount.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class LoadAnimSuccessfullyPage extends StatefulWidget {
  final String title;
  final bool? home ;

  const LoadAnimSuccessfullyPage({Key? key, required this.title,  this.home}) : super(key: key);

  @override
  State<LoadAnimSuccessfullyPage> createState() => _LoadAnimSuccessfullyPageState();
}

class _LoadAnimSuccessfullyPageState extends State<LoadAnimSuccessfullyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => (widget.home == null) ? const LoginPage() : const Root_app(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_m2igjaux.json', width: 250, height: 250),),
          // Center(child: Lottie.asset('assets/images/loadsuccess.json', width: 200, height: 200)),
        ],
      ),
    );
  }
}
