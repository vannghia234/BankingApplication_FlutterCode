import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_style/app_color/App_color.dart';

class Build_container_lifeStyle extends StatelessWidget {
  final Icon icon;
  final Size size;
  final String title;
  final String subtitle;
  const Build_container_lifeStyle({Key? key, required this.size, required this.icon, required this.title, required this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      child: Container(
        height: size.height * 1 / 8,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(1, 2))
            ]),
        child: Center(
          child:  ListTile(
            leading: icon,
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              subtitle, style: TextStyle(
                fontSize: 13
            ),),
            style: ListTileStyle.list,
          ),
        ),
      ),
    );
  }
}
