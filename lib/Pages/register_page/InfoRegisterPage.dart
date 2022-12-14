import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Pages/ConfirmAccountPassword_page.dart';
import 'package:banking_application/models/ToBanking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_style/app_styles/App_style.dart';

class MainRegisterPage extends StatelessWidget {
  const MainRegisterPage({Key? key}) : super(key: key);

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
        'Thông tin tài khoản',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: getAppbar(context),
        body: Column(
          children: [
            Image.asset(
              'assets/images/logo1.png',
              width: 120,
              height: 120,
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Người bạn đồng hành tin cậy',
              style: App_Style.primaryStyle().copyWith(
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic,
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14),
            ),
            const Spacer(),
            Form(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      inputFormatters: [
                        UpperCaseTextFormatter()
                      ],
                      textCapitalization: TextCapitalization.characters,
                      style: App_Style.primaryStyle().copyWith(
                          color: Colors.black.withOpacity(0.75),
                          letterSpacing: 0.6),
                      maxLength: 50,
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
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          focusColor: grayColor.withOpacity(0.5),
                          contentPadding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10),
                          label: Text(
                            'Họ và tên'.toUpperCase(),
                            style: App_Style.primaryStyle()
                                .copyWith(letterSpacing: 1),
                          )),
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      style: App_Style.primaryStyle().copyWith(
                          color: Colors.black.withOpacity(0.75),
                          letterSpacing: 1),
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
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          focusColor: grayColor.withOpacity(0.5),
                          contentPadding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10),
                          label: Text(
                            'email'.toUpperCase(),
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
                          color: Colors.black.withOpacity(0.75),
                          letterSpacing: 3),
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
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          focusColor: grayColor.withOpacity(0.5),
                          contentPadding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10),
                          label: Text(
                            'Số CCCD'.toUpperCase(),
                            style: App_Style.primaryStyle()
                                .copyWith(letterSpacing: 1),
                          )),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            ButtonWidget(
              size: size,
              text: 'Tiếp tục',
              onTapp: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmAccountPassword_page(),
                    ));
              },
            )
          ],
        ),
      ),
    );

  }

}
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}