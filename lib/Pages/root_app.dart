import 'package:banking_application/Pages/history_page.dart';
import 'package:banking_application/Pages/lifeStyle_page.dart';
import 'package:banking_application/Pages/others_page.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Root_app extends StatefulWidget {
  const Root_app({Key? key}) : super(key: key);

  @override
  State<Root_app> createState() => _Root_appState();
}

class _Root_appState extends State<Root_app> {
  @override
  int current_index = 0;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String ID = "";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: App_color.primaryColor,
        child: Image.asset(
          'assets/images/transfer1.png',
          width: 18,
          height: 18,
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: current_index,
      children: [
        const Home_page(),
        const LifeStyle_page(),
        const History_page(),
        const Others_page(),
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
                      Icons.show_chart,
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
                child: Text(
                  'Transfer',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.7)),
                ),
                margin: EdgeInsets.only(
                  top: 10,
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
                  setState(() {
                    current_index = 3;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.menu,
                      color: (current_index == 3)
                          ? Color(0xFF5B3D86)
                          : Colors.grey.withOpacity(0.7),
                      size: 30,
                    ),
                    Text('Others',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (current_index == 3)
                                ? App_color.primaryColor
                                : Colors.grey.withOpacity(0.7)))
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
