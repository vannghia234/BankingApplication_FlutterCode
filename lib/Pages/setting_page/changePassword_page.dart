import 'package:banking_application/API/api_services.dart';
import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:banking_application/app_style/func/CheckValue.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../models/ResponseChangePassword.dart';

class ChangePassword_page extends StatefulWidget {
  const ChangePassword_page({Key? key}) : super(key: key);

  @override
  State<ChangePassword_page> createState() => _ChangePassword_pageState();
}

class _ChangePassword_pageState extends State<ChangePassword_page> {
  final keyChangePassword = GlobalKey<FormState>();
  String pass = "";
  String OldPass = "";

  String Repass = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            )),
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
                      Form(
                        key: keyChangePassword,
                        child: Column(
                          children: [
                            TextFormField(
                              style: App_Style.regularStyle(16)
                                  .copyWith(height: 1.4),
                              obscureText: true,
                              obscuringCharacter: '*',
                              textAlignVertical: TextAlignVertical.center,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'trường này hiện đang trống';
                                }
                                return null;
                              },
                              onChanged: (value) => OldPass = value,
                              decoration: InputDecoration(
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  contentPadding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  label: Text(
                                    'mật khẩu hiện tại'.toUpperCase(),
                                  )),
                              keyboardType: TextInputType.visiblePassword,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: App_Style.regularStyle(16)
                                  .copyWith(height: 1.4),
                              obscureText: true,
                              obscuringCharacter: '*',
                              onChanged: (value) => pass = value,
                              textAlignVertical: TextAlignVertical.center,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'trường này hiện đang trống';
                                }
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
                              decoration: InputDecoration(
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  contentPadding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  label: Text(
                                    'mật khẩu mới'.toUpperCase(),
                                  )),
                              keyboardType: TextInputType.visiblePassword,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: App_Style.regularStyle(16)
                                  .copyWith(height: 1.4),
                              obscureText: true,
                              onChanged: (value) => Repass = value,
                              obscuringCharacter: '*',
                              textAlignVertical: TextAlignVertical.center,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'trường này hiện đang trống';
                                }
                                if (Repass != pass) {
                                  return 'nhập lại mật khẩu không khớp.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  contentPadding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  label: Text(
                                    'nhập lại mật khẩu mới'.toUpperCase(),
                                  )),
                              keyboardType: TextInputType.visiblePassword,
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ButtonWidget(
              size: size,
              text: 'Đồng ý thay đổi',
              onTapp: () async {
                CheckValue.PublicKey =
                    (await ApiServices.intance.getPublicKey())!;
                print('pbk: ${CheckValue.PublicKey}');
                if (keyChangePassword.currentState?.validate() == true) {
                  print("pass: ${pass}");
                  String plainText =
                      '{"username": "${CheckValue.username}","oldPass":"$OldPass","newPass":"$pass"}';
                  print(plainText);
                  String result = encryptRSA(plainText, CheckValue.PublicKey);
                  print('result: $result');
                  print('oldpass: ${OldPass}');
                  print('newpass ${pass}');
                  ResponseChangePassword rp = await ApiServices.intance
                      .reponseChangePassword(
                          password: OldPass,
                          username: CheckValue.username,
                          credential: result,
                          newPass: pass);
                  switch (rp.result?.response?.responseCode) {
                    case "1223":
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'mật khẩu mới không được trùng với mật khẩu cũ',
                        text: 'mật khẩu của bạn đặt đã trùng với mật khẩu cũ',
                        confirmBtnColor: App_color.primaryColor,
                      );
                      break;
                    case "13":
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        text: 'không được phép sử dụng mật khẩu 4 lần gần nhất',
                        confirmBtnColor: App_color.primaryColor,
                      );
                      break;
                    case "99":
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        text:
                            'Hệ thống đang bảo trì, bạn vui lòng quay lại sau nhé!',
                        confirmBtnColor: App_color.primaryColor,
                      );
                      break;
                    case "09":
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: 'tài khoản ngân hàng không hợp lệ',
                        confirmBtnColor: App_color.primaryColor,
                      );
                      break;
                    case "00":
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'thay đổi mật khẩu thành công',
                      );
                      // Navigator.pop(context);
                      break;
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class MaterialButton_widget extends StatelessWidget {
  const MaterialButton_widget({
    Key? key,
    required this.txtBtn,
    this.ontapp,
  }) : super(key: key);
  final String txtBtn;
  final VoidCallback? ontapp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MaterialButton(
        onPressed: ontapp,
        elevation: 5,
        hoverElevation: 5,
        splashColor: App_color.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        highlightColor: App_color.primaryColor,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.grey,
        child: Text(
          txtBtn.toUpperCase(),
          style: App_Style.boldStyle(14)
              .copyWith(color: Colors.white, letterSpacing: 0.7),
        ),
      ),
    );
  }
}
