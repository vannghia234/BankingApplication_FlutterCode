import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'detail_Transfer_page.dart';

class Transfer_Page extends StatelessWidget {
  const Transfer_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new, size: 20,),
        ),
        foregroundColor: Colors.black,
        title: Text(
          'Thêm tài khoản',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.75)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                child: Column(

                  children: [
                    FormInputSuffix_Widget(size: size, lable: 'Tên ngân hàng', name: 'Agribank'),
                    buildContainer(size, 'Số tài khoản'),
                    buildContainer(size, 'Tên chủ tài khoản',
                        name: 'nguyen van nghia'),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const Detail_Transfer_page(),
                          type: PageTransitionType.leftToRight));
                },
                minWidth: double.infinity,
                color: App_color.primaryColor,
                elevation: 7,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  "XÁC NHẬN",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Container buildContainer(Size size, String lable, {String? name}) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      height: size.width * 0.17,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26.withOpacity(0.15),
                blurRadius: 9,
                offset: const Offset(0, 3))
          ]),
      child: Center(
        child: TextFormField(
          enabled: (name != null) ? false : true,
          initialValue: name?.toUpperCase(),
          style: App_Style.openSanGoogle(16).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.75)),
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
            suffixIcon: const Icon(
              Icons.edit,
            ),
            labelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
            label: Text(
              lable,
            ),
          ),
        ),
      ),
    );
  }
}

class FormInputSuffix_Widget extends StatelessWidget {
  const FormInputSuffix_Widget({
    Key? key,
    required this.size,
    required this.lable,
     this.name,
  }) : super(key: key);

  final Size size;
  final String lable;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      height: size.width * 0.17,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26.withOpacity(0.15),
                blurRadius: 9,
                offset: const Offset(0, 3))
          ]),
      child: Center(
        child: TextFormField(
          keyboardType: (lable.contains('Lời nhắn') ? TextInputType.text : TextInputType.number),
          enabled: (name != null) ? false : true,
          initialValue: name,
          style: App_Style.openSanGoogle(16).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
            suffixIcon: const Icon(
              Icons.edit,
            ),
            labelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
            label: Text(
              lable,
            ),
          ),
        ),
      ),
    );
  }
}
