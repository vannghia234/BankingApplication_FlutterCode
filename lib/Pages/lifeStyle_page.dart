import 'package:banking_application/Component/appbar_wiget.dart';
import 'package:banking_application/Component/build_container_lifeStyle.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:flutter/material.dart';

class LifeStyle_page extends StatefulWidget {
  const LifeStyle_page({Key? key}) : super(key: key);

  @override
  State<LifeStyle_page> createState() => _LifeStyle_pageState();
}

class _LifeStyle_pageState extends State<LifeStyle_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarWiget(),
            const SizedBox(
              height: 20,
            ),
            Build_container_lifeStyle(
              size: size,
              title: 'Báo cáo phân tích chi tiêu',
              subtitle: 'Trả lời câu hỏi: tôi đã tiêu tiền vào những khoản gì?',
              icon: Icon(
                Icons.pie_chart,
                color: App_color.primaryColor,
                size: 40,
              ),
            ),
            Build_container_lifeStyle(
              size: size,
              title: 'Báo cáo thu chi hàng tháng',
              subtitle: 'Trở thành chuyên gia tài chính cá nhân của riêng mình',
              icon: Icon(
                Icons.equalizer,
                color: App_color.primaryColor,
                size: 40,
              ),
            ),
            Build_container_lifeStyle(
              size: size,
              title: 'Đầu Tư Chứng Chỉ Quỹ',
              subtitle: 'Thẻ tín dụng NQPay',
              icon: Icon(
                Icons.attach_money_rounded,
                color: App_color.primaryColor,
                size: 40,
              ),
            ),
            // Build_container_lifeStyle(size: size, title: 'Báo cáo phân tích chi tiêu', subtitle: 'Trả lời câu hỏi: tôi đã tiêu tiền vào những khoản gì?',),
            Build_container_lifeStyle(
              size: size,
              title: 'Bảo hiểm du lịch',
              subtitle: 'Du lịch toàn cầu chỉ từ 23.000 VND/ ngày',
              icon: Icon(
                Icons.flight_takeoff,
                color: App_color.primaryColor,
                size: 40,
              ),
            ),
            Build_container_lifeStyle(
              size: size,
              title: 'Khoản vay Ngân Hàng bản Việt',
              subtitle: 'Khoản vay cho nhà, xe và kinh doanh',
              icon: Icon(
                Icons.handshake,
                color: App_color.primaryColor,
                size: 40,
              ),
            )

          ],
        ),
      ),
    );
  }
}
