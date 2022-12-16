import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Pages/register_page/VerifyOtpPage.dart';
import 'package:banking_application/Pages/transfer_page/InputTransferPage.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String sdt = "";
    Size size = MediaQuery.of(context).size;
    final keySdt = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: getAppbar(context),
        body: Padding(
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
                  child: Form(
                    key: keySdt,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'vui lòng nhập số điện thoại';
                        }
                        const pattern = r'^0[\d+]{9,10}$';
                        final regExp = RegExp(pattern);
                        if(!regExp.hasMatch(value)){
                          return 'số điện thoại không hợp lệ';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        sdt = newValue!;
                      },
                      keyboardType:  TextInputType.number,
                      style: App_Style.openSanGoogle(18).copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          color: Colors.black.withOpacity(0.7)),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Ex: ---- --- ---' ,
                        icon: Image.asset(
                          'assets/images/iconflag.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.fitWidth,
                        ),
                        contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16,letterSpacing: 0),
                        label: const Text(
                          'Số điện thoại di động',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // FormInputSuffix_Widget(
              //   hintTxt: 'Ex: ---- --- ---',
              //   size: size,
              //   lable: 'Số điện thoại di động',
              //   iconpreflix: Image.asset(
              //     'assets/images/iconflag.png',
              //     width: 28,
              //     height: 28,
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
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
                  if(keySdt.currentState?.validate()==true){
                    keySdt.currentState?.save();
                    Navigator.push(context, PageTransition(child:  VerifyOtpPage(sdt: sdt), type: PageTransitionType.bottomToTop));
                  }
                },
              )
            ],
          ),
        ),
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
