import 'package:banking_application/API/api_services.dart';
import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Provider/InfoAccount.dart';
import 'package:banking_application/anim/LoadAnimSuccessfullyPage.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../app_style/app_styles/App_style.dart';
import '../../app_style/func/CheckValue.dart';
import '../../models/ResponseRegister.dart';

class ConfirmAccountPassword_page extends StatefulWidget {
  const ConfirmAccountPassword_page({
    Key? key,
  }) : super(key: key);

  @override
  State<ConfirmAccountPassword_page> createState() =>
      _ConfirmAccountPassword_pageState();
}

class _ConfirmAccountPassword_pageState
    extends State<ConfirmAccountPassword_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
        'ten la : ${Provider.of<InfoAccountProvider>(context, listen: false).hoVaTen}');
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
      title: Text(
        'Xác nhận mật khẩu',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
      ),
    );
  }

  bool obs1 = true;
  bool obs2 = true;
  String newPass = "";
  String reNewPass = "";
  static GlobalKey<FormState> keyRegis = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppbar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    color: Colors.black.withOpacity(0.5), fontSize: 14),
              ),
              const Spacer(),
              Form(
                  key: keyRegis,
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
                            onSaved: (newValue) {},
                            validator: (value) {
                              int vl = value?.length ?? 0;
                              bool rg = RegExp(
                                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
                                  .hasMatch(value!);
                              if (vl < 8) {
                                return 'mật khẩu của bạn phải có ít nhất 8 ký tự';
                              } else if (!rg) {
                                return 'mật khẩu phải có chữ thường, chữ hoa, chứ số và 1 kí tự đặc biệt';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              newPass = value;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: obs1,
                            style: App_Style.openSanGoogle(18).copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7)),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  obs1 = !obs1;
                                }),
                                child: (obs1 == false)
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              label: Text(
                                'Mật khẩu mới'.toUpperCase(),
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
                              int vl = value?.length ?? 0;
                              bool rg = RegExp(
                                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
                                  .hasMatch(value!);
                              if (value != newPass) {
                                return 'mật khẩu không trùng khớp';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              reNewPass = value;
                            },
                            onSaved: (newValue) {
                              Provider.of<InfoAccountProvider>(context,
                                          listen: false)
                                      .password =
                                  encryptPassword(newValue!).toString();
                            },
                            keyboardType: TextInputType.text,
                            style: App_Style.openSanGoogle(18).copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7)),
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: obs2,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  obs2 = !obs2;
                                }),
                                child: (obs2 == false)
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              label: Text(
                                'Nhập lại mật khẩu'.toUpperCase(),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              const Spacer(
                flex: 6,
              ),
              ButtonWidget(
                size: size,
                text: 'xác nhận',
                onTapp: () async {
                  if (keyRegis.currentState?.validate() == true) {
                    keyRegis.currentState?.save();
                    print(
                        'pw:${Provider.of<InfoAccountProvider>(context, listen: false).password}');
                    ResponseRegister res = await ApiServices.intance.getResponseRegister(
                            name: Provider.of<InfoAccountProvider>(context, listen: false)
                                .hoVaTen
                                .toString(),
                            cccd: Provider.of<InfoAccountProvider>(context,
                                    listen: false)
                                .soCccd
                                .toString(),
                            email: Provider.of<InfoAccountProvider>(context,
                                    listen: false)
                                .email
                                .toString(),
                            pass: Provider.of<InfoAccountProvider>(context,
                                    listen: false)
                                .password
                                .toString(),
                            username: Provider.of<InfoAccountProvider>(context,
                                    listen: false)
                                .sdt
                                .toString());
                    print('err: ${res.result?.response?.responseCode}');
                    switch (res.result?.response?.responseCode) {
                      case "11":
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'tài khoản đã tồn tại trong hệ thống',
                          confirmBtnColor: App_color.primaryColor,
                          autoCloseDuration: Duration(seconds: 4),
                        );
                        break;
                      case "03":
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'lỗi hệ thống, vui lòng thử lại nhe',
                          confirmBtnColor: App_color.primaryColor,
                          autoCloseDuration: Duration(seconds: 4),
                        );
                        break;
                      case "99":
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'Hệ thống đang bảo trì, quay lại sau nhé',
                          confirmBtnColor: App_color.primaryColor,
                          autoCloseDuration: Duration(seconds: 4),
                        );
                        break;
                      case "09":
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          text: 'tài khoản ngân hàng không hợp lệ',
                          confirmBtnColor: App_color.primaryColor,
                          autoCloseDuration: Duration(seconds: 4),
                        );
                        break;
                      case "00":
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const LoadAnimSuccessfullyPage(
                                            title: 'Đăng ký thành công'),
                                opaque: false));
                        break;
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
