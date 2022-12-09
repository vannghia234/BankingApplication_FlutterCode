import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';

class ChangePassword_page extends StatefulWidget {
  const ChangePassword_page({Key? key}) : super(key: key);

  @override
  State<ChangePassword_page> createState() => _ChangePassword_pageState();
}

class _ChangePassword_pageState extends State<ChangePassword_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        title: Text('Đổi mật khẩu', style: App_Style.boldStyle(16)),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    height: size.height * 1 / 6,
                    width: size.width,
                    child: Image.asset(
                      'assets/images/phihanhgia.jpg',
                      fit: BoxFit.fitWidth,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
                  child: Column(
                    children: [
                      buildFormPassword('mật khẩu hiện tại'),
                      const SizedBox(
                        height: 10,
                      ),
                      buildFormPassword('mật khẩu mới'),
                      const SizedBox(
                        height: 10,
                      ),
                      buildFormPassword('nhập lại mật khẩu mới'),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MaterialButton(
                onPressed: () {},
                elevation: 5,
                hoverElevation: 5,
                splashColor: App_color.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 10),
                highlightColor: App_color.primaryColor,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                color: Colors.grey,
                child: Text(
                  'đồng ý thay đổi'.toUpperCase(),
                  style: App_Style.boldStyle(14)
                      .copyWith(color: Colors.white, letterSpacing: 0.7),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Form buildFormPassword(String lable) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: App_Style.regularStyle(16).copyWith(height: 1.4),
            obscureText: true,
            obscuringCharacter: '*',
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                label: Text(
                  lable.toUpperCase(),
                )),
            keyboardType: TextInputType.visiblePassword,
            maxLines: 1,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
