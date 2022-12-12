import 'package:banking_application/Component/Build_container.dart';
import 'package:banking_application/Component/appbar_wiget.dart';
import 'package:banking_application/Component/slideBanner.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:lottie/lottie.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  String ID = "060260254505";
  static const String balance = '2000000';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //header
            const AppbarWiget(),
            //slider banner
            SizedBox(
                child: SliderBanner(
              size: size,
            )),
            const SizedBox(
              height: 5,
            ),
            // main body
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80),
              child: Column(
                children: [
                  Container(
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                             const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(Icons.notifications_active,
                              color: Colors.white,
                              size: 16,),
                            ),
                            Text(
                              'Bạn có 2 việc cần xử lý.',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 17,
                      left: 17,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                              'Hạn mức chuyển khoản mỗi tháng 100.000.000 đồng. ',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 13),
                          children: [
                            TextSpan(
                                text: 'Tìm hiểu thêm',
                                style: TextStyle(
                                    color: Colors.greenAccent[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2))
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: 40,
                      width: double.infinity - 15,
                      decoration: const BoxDecoration(
                          color: Color(0xffE4DFEA),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -20,
                            left: 0,
                            bottom: -5,
                            child: Image.asset(
                              'assets/images/paypal.png',
                              fit: BoxFit.contain,
                              height: 30,
                              width: 60,
                            ),
                          ),
                          const Positioned(
                              top: 10,
                              right: 0,
                              left: 70,
                              bottom: 0,
                              child: Text(
                                'Chuyển tiền vào NQPay ngay!',
                                style: TextStyle(
                                    color: App_color.primaryColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Positioned(
                            right: 10,
                            top: 0,
                            bottom: 0,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: App_color.primaryColor,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Build_container(
                    size: size,
                    title: 'Tài khoản chính',
                    subTitle: text_idTK(ID),
                    nav_title: text_sodu(balance.toVND(unit: 'đ')),
                  ),
                  Build_container(
                    size: size,
                    title: 'Hũ chi tiêu',
                    row_title: text_row_title(Colors.red, 'Nên thử'),
                    nav_title: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black.withOpacity(0.25),
                      size: 18,
                    ),
                    subTitle: text_subTitle('Quản lý chi tiêu hiệu quả'),
                  ),
                  Build_container(
                    size: size,
                    title: 'Mục tiêu cá nhân',
                    nav_title: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black.withOpacity(0.25),
                      size: 18,
                    ),
                    subTitle: text_subTitle('Bạn chưa thiết lập mục tiêu'),
                  ),
                  Build_container(
                    size: size,
                    title: 'Thẻ Visa',
                    nav_title: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xff2874B2)),
                        child: const Text(
                          'Đăng Ký Ngay',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subTitle: text_subTitle('Quản lý chi tiêu hiệu quả'),
                  ),
                  Build_container(
                    size: size,
                    title: 'Social Banking',
                    row_title: text_row_title(const Color(0xff2874B2), 'BETA'),
                    nav_title: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black.withOpacity(0.25),
                        size: 18,
                      ),
                    ),
                    subTitle: text_subTitle('Quản lý chi tiêu hiệu quả'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container text_row_title(Color color, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Text(
        content,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text text_subTitle(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 12,
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }

  Center text_sodu(String sodu) {
    return Center(
      child: Text(
        sodu,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: App_color.primaryColor),
      ),
    );
  }

  Text text_idTK(String id) {
    return Text(
      id,
      style: TextStyle(
        fontSize: 14,
        decoration: TextDecoration.underline,
        decorationThickness: 2,
        fontWeight: FontWeight.bold,
        color: Colors.greenAccent[400],
      ),
    );
  }

// CarouselSlider carouselSliderBanner(var size) {
//   return CarouselSlider.builder(
//       itemCount: getListBanner.length,
//       itemBuilder: (context, index, realIndex) {
//         return Padding(
//           padding: const EdgeInsets.only(right: 6, left: 6, top: 14),
//           child: Container(
//             width: (size.width - 20),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.purple,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.25),
//                       offset: Offset(3, 0),
//                       blurRadius: 5,
//                       spreadRadius: 2)
//                 ],
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(
//                       getListBanner[index]['name'],
//                     ))),
//           ),
//         );
//       },
//       options: CarouselOptions(
//           onPageChanged: (index, reason) {
//             setState(() {
//               selected_index = index;
//             });
//           },
//           autoPlay: true,
//           enlargeStrategy: CenterPageEnlargeStrategy.height,
//           viewportFraction: 0.92,
//           initialPage: selected_index,
//           enableInfiniteScroll: true,
//           autoPlayInterval: Duration(milliseconds: 3000)));
// }

// buildIndicator(int index, int length) {
//   return AnimatedSmoothIndicator(
//       duration: Duration(milliseconds: 300),
//       effect: ScrollingDotsEffect(
//           dotHeight: 6,
//           dotWidth: 6,
//           dotColor: App_color.primaryColor,
//           spacing: 10),
//       activeIndex: index,
//       count: length);
// }
}

// class Appbar_component extends StatelessWidget {
//   const Appbar_component({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Image.asset(
//                   'assets/images/useravatar.png',
//                   height: 36,
//                   width: 36,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text('NGHIA NGUYEN'.toUpperCase(),
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 0.9)),
//             ],
//           ),
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.qr_code,
//                     color: App_color.primaryColor,
//                   )),
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.chat,
//                     color: App_color.primaryColor,
//                   )),
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.notifications,
//                     color: App_color.primaryColor,
//                   )),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
