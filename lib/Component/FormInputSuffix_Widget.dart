import 'package:flutter/material.dart';

import '../app_style/app_styles/App_style.dart';
class FormInputSuffix_Widget extends StatelessWidget {
  const FormInputSuffix_Widget({
    Key? key,
    required this.size,
    required this.lable,
    this.iconSuffix,
    this.iconpreflix,
    this.hintTxt,
    this.name,
  }) : super(key: key);
  final IconData? iconSuffix;
  final Image? iconpreflix;
  final String? hintTxt;
  final Size size;
  final String lable;
  final String? name;
  @override
  Widget build(BuildContext context) {
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
          keyboardType: (lable.contains('Lời nhắn') ? TextInputType.text : TextInputType.number),
          enabled: (name != null) ? false : true,
          initialValue: name,
          style: App_Style.openSanGoogle(18).copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.black.withOpacity(0.7)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
          hintText: hintTxt ,
            icon: iconpreflix,
            contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
            suffixIcon:  Icon(
              iconSuffix,
            ),
            labelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16,letterSpacing: 0),
            label: Text(
              lable,
            ),
          ),
        ),
      ),
    );
  }
}
