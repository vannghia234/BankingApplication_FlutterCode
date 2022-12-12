import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/anim/LoadAnimSuccessfullyPage.dart';
import 'package:flutter/material.dart';

import '../app_style/app_styles/App_style.dart';

class ConfirmAccountPassword_page extends StatelessWidget {
  const ConfirmAccountPassword_page({Key? key}) : super(key: key);

  AppBar getAppbar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
        ),
      ),
      title: Text(
        'Xác nhận mật khẩu',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppbar(context),
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo1.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  'Tất cả vì sự thịnh vượng của khách hàng',
                  style: App_Style.primaryStyle().copyWith(
                      letterSpacing: 1,
                      fontStyle: FontStyle.italic,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14),
                ),
                const Spacer(),
                TextFormField(
                  style: App_Style.primaryStyle().copyWith(
                      color: Colors.black.withOpacity(0.75), letterSpacing: 1),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (newValue) {},
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                      focusColor: grayColor.withOpacity(0.5),
                      contentPadding:
                          const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                      label: Text(
                        'Tài khoản'.toUpperCase(),
                        style: App_Style.primaryStyle(),
                      )),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: App_Style.primaryStyle().copyWith(
                      color: Colors.black.withOpacity(0.75), letterSpacing: 1),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (newValue) {},
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                      focusColor: grayColor.withOpacity(0.5),
                      contentPadding:
                          const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                      label: Text(
                        'mật khẩu'.toUpperCase(),
                        style: App_Style.primaryStyle(),
                      )),
                  textAlign: TextAlign.left,
                  obscureText: true,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.text,
                ),
                const Spacer(
                  flex: 5,
                ),
                ButtonWidget(
                  size: size,
                  text: 'xác nhận',
                  onTapp: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const LoadAnimSuccessfullyPage(),
                            opaque: false));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
