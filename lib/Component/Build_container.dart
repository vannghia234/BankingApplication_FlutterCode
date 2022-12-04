import 'package:flutter/material.dart';
import '../app_style/app_color/App_color.dart';

class Build_container extends StatelessWidget {
  const Build_container({
    Key? key,
    required this.title,
    this.row_title,
    required this.subTitle,
    required this.nav_title,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String title;
  final Widget? row_title;
  final Widget subTitle;
  final Widget nav_title;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (title == 'Tài khoản chính') ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 20),
      width: size.width - 10,
      height: size.height * 1 / 8,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(2, 2),
                blurRadius: 4)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(width: 5,),
                    row_title ?? Container(),
                  ],
                ),
                const SizedBox(height: 5),
                subTitle,
                // Text(
                //   '060260254505',
                //   style: TextStyle(
                //     fontSize: 14,
                //     decoration: TextDecoration.underline,
                //     decorationThickness: 2,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.greenAccent[400],
                //   ),
                // ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            bottom: 0,
            child: nav_title,
            // child: Center(
            //   child: Text(
            //     '0 vnd',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: App_color.primaryColor),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}


