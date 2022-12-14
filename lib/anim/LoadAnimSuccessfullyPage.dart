import 'dart:async';

import 'package:banking_application/Pages/LoginPage.dart';
import 'package:banking_application/Pages/home_page.dart';
import 'package:banking_application/Pages/root_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LoadAnimSuccessfullyPage extends StatefulWidget {
  final String title;
  final bool? home ;

  const LoadAnimSuccessfullyPage({Key? key, required this.title,  this.home}) : super(key: key);

  @override
  State<LoadAnimSuccessfullyPage> createState() => _LoadAnimSuccessfullyPageState();
}

class _LoadAnimSuccessfullyPageState extends State<LoadAnimSuccessfullyPage> {
   String text = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () =>    setState(() {
      text = widget.title;
    }),);
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => (widget.home == null) ? const LoginPage() : const Root_app(),));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset('assets/images/loadsuccess.json', width: 200, height: 200)),
          const SizedBox(height: 20,),
           Center(
            child: Text(text, style:  TextStyle(
              fontSize: 28, color: Colors.greenAccent.shade400,
              fontWeight: FontWeight.bold,
            ),),
          )
        ],
      ),
    );
  }
}
