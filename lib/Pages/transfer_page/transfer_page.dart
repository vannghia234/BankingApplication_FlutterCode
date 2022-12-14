import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:banking_application/models/ToBanking.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Component/FormInputSuffix_Widget.dart';
import '../register_page/InfoRegisterPage.dart';
import 'InputTransferPage.dart';

class Transfer_Page extends StatelessWidget {
  const Transfer_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToBanking bundle = ToBanking();
    final _formkey = GlobalKey<FormState>();
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
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
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
                key: _formkey,
                child: Column(
                  children: [
                    Container(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'vui lòng nhập tên ngân hàng';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            bundle.tenNganHang = newValue;
                          },
                          keyboardType: (TextInputType.text),
                          enabled: true,
                          maxLength: 150,
                          initialValue: 'Agribank',
                          style: App_Style.openSanGoogle(18).copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              color: Colors.black.withOpacity(0.7)),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.edit),
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            suffixIcon: Icon(
                              Icons.edit,
                            ),
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0),
                            label: Text(
                              'Tên ngân hàng',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'vui lòng nhập số tài khoản.';
                            }
                            if (isNumeric(value) == false) {
                              return 'STK chỉ bao gồm chữ số.';
                            }
                            if (!(value.length >= 6 && value.length <= 15)) {
                              return 'số tài khoản chỉ từ 6 đến 15 ký tự.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            bundle.soTaiKhoan = newValue;
                          },
                          enabled: true,
                          style: App_Style.openSanGoogle(16).copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.black.withOpacity(0.75)),
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            suffixIcon: Icon(
                              Icons.edit,
                            ),
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0),
                            label: Text(
                              'Số tài khoản',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                          inputFormatters: [UpperCaseTextFormatter()],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'vui lòng nhập số tài khoản';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            bundle.tenTaiKhoan = newValue;
                          },
                          enabled: true,
                          initialValue: 'nguyen hoang phuc'.toUpperCase(),
                          style: App_Style.openSanGoogle(16).copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.black.withOpacity(0.75)),
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            suffixIcon: Icon(
                              Icons.edit,
                            ),
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0),
                            label: Text(
                              'Tên chủ tài khoản',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (_formkey.currentState?.validate() == true) {
                    _formkey.currentState?.save();
                    Navigator.push(
                      context,
                      PageTransition(
                          child:  Detail_Transfer_page(InfoBanking: bundle,),
                          type: PageTransitionType.leftToRight),
                    );
                  }
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

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
