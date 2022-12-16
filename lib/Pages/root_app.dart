import 'package:banking_application/Component/FadeUIndexStack.dart';
import 'package:banking_application/Pages/history_page.dart';
import 'package:banking_application/Pages/lifeStyle_page.dart';
import 'package:banking_application/Pages/transfer_page/transfer_page.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'home_page.dart';

class Root_app extends StatefulWidget {
  const Root_app({Key? key}) : super(key: key);

  @override
  State<Root_app> createState() => _Root_appState();
}

class _Root_appState extends State<Root_app> {
  @override
  int current_index = 0;

  void _showModelBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        elevation: 15,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 0.6,
            minChildSize: 0.5,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 4,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Spacer(),
                          Text(
                            'Dịch vụ khác',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          build_dichVu(Icons.flip, 'Quét mã'),
                          build_dichVu(Icons.qr_code_outlined, 'Mã của tôi'),
                          build_dichVu(Icons.phone_iphone_outlined,
                              'Nạp tiền điện thoại'),
                          build_dichVu(Icons.person_add, 'mời bạn bè'),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          build_dichVu(Icons.waving_hand_outlined, 'Nhắc nợ'),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  Column build_dichVu(IconData icon, String s) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blueAccent,
          size: 28,
        ),
        Text(
          s,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            height: 1.9,
          ),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: App_color.primaryColor,
        child: Image.asset(
          'assets/images/transfer1.png',
          width: 16,
          height: 16,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const Transfer_Page(),
                  type: PageTransitionType.leftToRightWithFade));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return FadeIndexedStack(
      duration: const Duration(milliseconds: 200),
      index: current_index,
      children: const [
        Home_page(),
        LifeStyle_page(),
        History_page(),
      ],
    );
  }

  Widget getFooter() {
    return BottomAppBar(
      elevation: 40,
      shape: const CircularNotchedRectangle(),
      notchMargin: 12,
      child: Container(
        width: double.infinity,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  setState(() {
                    current_index = 0;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: (current_index == 0)
                          ? Color(0xFF5B3D86)
                          : Colors.grey.withOpacity(0.7),
                      size: 30,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (current_index == 0)
                              ? App_color.primaryColor
                              : Colors.grey.withOpacity(0.7)),
                    )
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  setState(() {
                    current_index = 1;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.leaderboard,
                      color: (current_index == 1)
                          ? Colors.deepOrange[600]
                          : Colors.grey.withOpacity(0.7),
                      size: 30,
                    ),
                    Text(
                      'lifeStyle',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (current_index == 1)
                              ? Colors.deepOrange[600]
                              : Colors.grey.withOpacity(0.7)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  'Transfer',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.7)),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  setState(() {
                    current_index = 2;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.history,
                      color: (current_index == 2)
                          ? Colors.orange
                          : Colors.grey.withOpacity(0.7),
                      size: 30,
                    ),
                    Text('History',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (current_index == 2)
                                ? Colors.orange
                                : Colors.grey.withOpacity(0.7)))
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  _showModelBottomSheet(context);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.space_dashboard_rounded,
                      color: Colors.grey.withOpacity(0.7),
                      size: 30,
                    ),
                    Text('Others',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.7)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
