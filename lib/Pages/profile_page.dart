import 'package:banking_application/Pages/LoginPage.dart';
import 'package:banking_application/Pages/setting_page/change_info_page.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size;
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppbar(context),
      backgroundColor: Colors.white.withOpacity(0.94),
      body: getBody(size, context),
    );
  }

  AppBar getAppbar(BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.close,
              color: App_color.primaryColor,
              size: 30,
            ),
          ),
        )
      ],
      backgroundColor: Colors.transparent,
      // backgroundColor: Colors.white.withOpacity(0.94),
      elevation: 0,

      automaticallyImplyLeading: false,
    );
  }

  Widget getBody(Size size, BuildContext context) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Cài đặt',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: App_color.primaryColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: size.width,
              height: size.height * 1 / 4 + 30,
              decoration: BoxDecoration(
                  color: App_color.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 3),
                        blurRadius: 15,
                        spreadRadius: 7)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _build_iconColumn(
                            Icons.info_outline, 'Thông tin cá nhân', size),
                        const VerticalDivider(
                          thickness: 0.5,
                          color: Colors.white24,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const Change_Info_Page(),
                                      type: PageTransitionType.fade));
                            },
                            child: _build_iconColumn(
                                Icons.edit, 'Thay đổi thông tin', size)),
                        const VerticalDivider(
                          thickness: 0.5,
                          color: Colors.white24,
                        ),
                        _build_iconColumn(
                            Icons.credit_card, 'Quản lý thẻ', size),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.white24,
                    indent: 10,
                    endIndent: 10,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _build_iconColumn(
                            Icons.lock_outline, 'Thông báo & bảo mật', size),
                        const VerticalDivider(
                          thickness: 0.5,
                          color: Colors.white24,
                        ),
                        _build_iconColumn(
                            Icons.g_translate, 'Thay đổi ngôn ngữ', size),
                        const VerticalDivider(
                          thickness: 0.5,
                          color: Colors.white24,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, PageTransition(child: const LoginPage(), type: PageTransitionType.topToBottom ));
                          },
                          child: _build_iconColumn(
                              Icons.power_settings_new, 'Đăng xuất', size),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Text(
              'Trợ giúp',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: App_color.primaryColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: size.width,
              height: size.height * 1 / 7,
              decoration: BoxDecoration(
                  color: App_color.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 3),
                        blurRadius: 15,
                        spreadRadius: 7)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _build_iconColumn(Icons.location_on, 'Địa điểm', size),
                        const VerticalDivider(
                          thickness: 0.5,
                          color: Colors.white24,
                        ),
                        _build_iconColumn(Icons.mark_unread_chat_alt_outlined,
                            'Phản hồi', size),
                        const VerticalDivider(
                          thickness: 0.5,
                          color: Colors.white24,
                        ),
                        _build_iconColumn(Icons.phone, 'Liên hệ', size),
                        const VerticalDivider(
                          thickness: 0.5,
                          color: Colors.white24,
                        ),
                        _build_iconColumn(Icons.live_help, 'Hỏi đáp', size)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Điều kiện & Điều khoản',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  children: const [
                    TextSpan(
                        text: ' | ',
                        style: TextStyle(
                            decoration: TextDecoration.none, fontSize: 14)),
                    TextSpan(
                      text: ' Chính sách bảo vệ dữ liệu & Quyền riêng tư',
                    ),
                  ]),
            )
          ],
        ),
      ),
    ));
  }

  SizedBox _build_iconColumn(IconData icon, String s, Size size) {
    return SizedBox(
      width: (size.width - 20) / 3 - 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          Text(
            s,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 13,
              height: 1.9,
            ),
          )
        ],
      ),
    );
  }
}
