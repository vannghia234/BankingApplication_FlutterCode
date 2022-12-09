import 'package:flutter/material.dart';

class Detail_Transfer_page extends StatelessWidget {
  const Detail_Transfer_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(size),
    );
  }

  AppBar getAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      foregroundColor: Colors.black,
      elevation: 0,
      title: Text(
        'Chuyển tiền',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.75)),
      ),
    );
  }

  getBody(Size size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Container(
            height: size.height * 1 / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0.15),
                  offset: const Offset(1, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'TỪ ',
                              style: TextStyle(
                                fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            Image.asset('assets/images/user_static.png', width: 32, height: 32,),
                            Text(
                              ' Tài khoản chính',
                              style: TextStyle(
                                fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.80)),
                            ),
                          ],
                        ),
                        Container(
                          decoration:  BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.tealAccent.shade400,
                              width: 2

                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/user_gif.gif', width: 28, height: 28,),
                                    Text(
                                      'Tài khoản chính',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(0.80)),
                                    ),
                                     Icon(Icons.verified, color: Colors.tealAccent.shade400, size: 20,)
                                  ],
                                ),
                                Text(
                                  '200.000.000',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.3)),
                                )
                              ],
                            ),
                          ),

                        )
                      ],
                    )
                  ],
                ),
                const Divider(
                  indent: 15,
                    endIndent: 15,

                ),
                Row()
              ],
            ),
          ),
        )
      ],
    );
  }
}
