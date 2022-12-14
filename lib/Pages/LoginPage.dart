import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Component/FormPassword.dart';
import 'package:banking_application/anim/LoadingAnimationPage.dart';
import 'package:banking_application/Pages/register_page/RegisterPage.dart';
import 'package:banking_application/Pages/root_app.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getBody(size, context),
    );
  }

  getBody(Size size, BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo1.png',
                height: 120,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              Text(
                'DIGITAL BANK',
                style: App_Style.primaryStyle().copyWith(
                    letterSpacing: 1,
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'NGÂN HÀNG SỐ THÔNG MINH',
                style: App_Style.primaryStyle().copyWith(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: App_color.primaryColor,
                    fontSize: 22),
              ),
              Text(
                'NÂNG TẦM CUỘC SỐNG',
                style: App_Style.primaryStyle().copyWith(
                    letterSpacing: 1, color: primaryColor, fontSize: 22),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              formLogin(size, Icons.edit, 'Tên đăng nhập / Số điện thoại'),
              FormPassword(size: size, icon: Icons.visibility, lable: 'Mật khẩu',),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          size: size,
          text: 'Đăng nhập',
          onTapp: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const LoadingAnimationPage(),
                    type: PageTransitionType.leftToRight,
                  opaque: false
                ));
          },
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(
                  color: Colors.blue.shade500.withOpacity(0.7),
                  decoration: TextDecoration.underline,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: 'Đăng ký',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const RegisterPage(),
                              type: PageTransitionType.bottomToTop));
                    },
                ),
                const TextSpan(
                    text: '  |  ',
                    style: TextStyle(decoration: TextDecoration.none)),
                const TextSpan(text: 'Không thể đăng nhập?'),
              ]),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
  Widget formLogin(Size size, IconData icon, String lable) {
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
          keyboardType: TextInputType.text,
          style: App_Style.openSanGoogle(18).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              icon,
            ),
            labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            label: Text(
              lable,
            ),
          ),
        ),
      ),
    );
  }
}
