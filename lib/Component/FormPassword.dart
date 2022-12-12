import 'package:flutter/material.dart';

import '../app_style/app_styles/App_style.dart';

class FormPassword extends StatefulWidget {
  final Size size;
  final String lable;
  final IconData icon;
  const FormPassword(
      {Key? key, required this.size, required this.icon, required this.lable})
      : super(key: key);

  @override
  State<FormPassword> createState() => _FormPasswordState();
}

class _FormPasswordState extends State<FormPassword> {
  late Size size;
  late String lable;
  late IconData icon;
  bool obs = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    size = widget.size;
    lable = widget.lable;
    icon = widget.icon;
  }

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
          keyboardType: TextInputType.text,
          obscureText: obs,
          style: App_Style.openSanGoogle(18).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  (icon == Icons.visibility)
                      ? icon = Icons.visibility_off
                      : icon = Icons.visibility;
                  (obs == true) ? obs = false : obs = true;
                });
              },
              child: Icon(
                icon,
              ),
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
