import 'package:flutter/material.dart';
import '../app_style/app_color/App_color.dart';

class AppbarWiget extends StatefulWidget {
  const AppbarWiget({Key? key}) : super(key: key);

  @override
  State<AppbarWiget> createState() => _AppbarWigetState();
}

class _AppbarWigetState extends State<AppbarWiget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/images/useravatar.png',
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('NGHIA NGUYEN'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      )),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code_scanner,
                    color: App_color.primaryColor,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.forum_outlined,
                    color: App_color.primaryColor,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: App_color.primaryColor,
                    size: 24,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
