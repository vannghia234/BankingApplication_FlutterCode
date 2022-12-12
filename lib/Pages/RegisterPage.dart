import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Component/FormInputSuffix_Widget.dart';
import 'package:banking_application/Pages/VerifyOtpPage.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'detail_Transfer_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: getAppbar(context),
        body: getBody(context, size),
      ),
    );
  }

  Widget getBody(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            height: size.height * 0.03,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Bắt đầu với',
                style: App_Style.primaryStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: size.height * 0.03,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Số điện thoại của bạn.',
                style: App_Style.primaryStyle().copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          FormInputSuffix_Widget(
            hintTxt: 'Ex: ---- --- ---',
            size: size,
            lable: 'Số điện thoại di động',
            iconpreflix: Image.asset(
              'assets/images/iconflag.png',
              width: 28,
              height: 28,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Spacer(
            flex: 15,
          ),
          const Reminder_widget(
            icon: Icons.lightbulb,
            loiNhan:
                'Bằng việc tiếp tục, bạn đồng ý với Điều Kiện & Điều Khoản và Chính sách Bảo vệ Dữ liệu & Quyền Riêng tư',
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            size: size,
            text: 'Tiếp theo',
            onTapp: () {
              Navigator.push(context, PageTransition(child: const VerifyOtpPage(), type: PageTransitionType.bottomToTop));


            },
          )
        ],
      ),
    );
  }

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
    );
  }
}
