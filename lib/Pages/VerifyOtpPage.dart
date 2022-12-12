import 'package:banking_application/Pages/MainRegistePage.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  String? txtError = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                child: Text(
                  'Gửi qua tin nhắn\n đến số điện thoại ${convertObscure('0378381905')}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15,
                      color: App_color.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 58,
                    width: 54,
                    child: TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          focusColor: Colors.red,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: App_color.primaryColor,
                                width: 3,
                              )),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      style: App_Style.primaryStyle().copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                    width: 54,
                    child: TextField(
                      controller: controller2,

                      decoration: InputDecoration(
                          hoverColor: Colors.amber,
                          fillColor: Colors.grey.shade300,
                          focusColor: Colors.red,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: App_color.primaryColor,
                                width: 3,
                              )),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      style: App_Style.primaryStyle().copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                    width: 54,
                    child: TextField(
                      controller: controller3,

                      decoration: InputDecoration(
                          hoverColor: Colors.amber,
                          fillColor: Colors.grey.shade300,
                          focusColor: Colors.red,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: App_color.primaryColor,
                                width: 3,
                              )),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onChanged: (value)  {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();

                        }
                      },
                      textAlign: TextAlign.center,
                      style: App_Style.primaryStyle().copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                    width: 54,
                    child: TextField(
                      controller: controller4,
                      decoration: InputDecoration(
                          hoverColor: Colors.amber,
                          fillColor: Colors.grey.shade300,
                          focusColor: Colors.red,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: App_color.primaryColor,
                                width: 3,
                              )),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                          String otpcode = '5555';
                          String resultOtp = '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
                          if(resultOtp == otpcode){
                            Navigator.pushReplacement(context, PageTransition(child: const MainRegisterPage(), type: PageTransitionType.bottomToTop));
                          }
                          else if(resultOtp != otpcode) {
                            setState(() {
                              txtError = 'bạn đã nhập sai mã OTP rồi ><! nhập lại đii';
                            });


                          }
                        }
                      },
                      textAlign: TextAlign.center,
                      style: App_Style.primaryStyle().copyWith(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Text(txtError!, style: TextStyle(
              color: Colors.red.withOpacity(0.7),
              fontSize: 16,
            ),),
            Row(
              mainAxisSize: MainAxisSize.min  ,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gửi lại mã OTP',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      decoration: TextDecoration.underline,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),

                Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_gbfwtkzw.json',
                    width: 60,
                    height: 60),
              ],
            ),
            const SizedBox(height: 15,),
            Text('Vui lòng không tiết lộ OTP của bạn cho bất kỳ ai kể cả nhân viên NQPAY.',
            textAlign: TextAlign.start,
            style: App_Style.primaryStyle().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),)
          ],
        ),
      ),
    );
  }

  AppBar getAppbar(context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 5, right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Hủy',
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
            ),
          ),
        )
      ],
      title: SizedBox(
        width: 200,
        child: Column(
          children: [
            const Text(
              'Xác nhận OTP',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
