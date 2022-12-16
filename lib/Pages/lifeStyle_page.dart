import 'package:banking_application/Component/appbar_wiget.dart';
import 'package:banking_application/Component/build_container_lifeStyle.dart';
import 'package:flutter/material.dart';

import '../app_style/func/json_lifeStyle.dart';

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
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              const AppbarWiget(),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                  child: ListView.builder(
                    itemCount: listLifeStyle.length,
                    itemBuilder: (context, index) {

                    return Build_container_lifeStyle(
                        size: size,
                        icon: listLifeStyle[index]['icon'],
                        title: listLifeStyle[index]['title'],
                        subtitle: listLifeStyle[index]['subtitle']);
                  },)
              )

              // Build_container_lifeStyle(
              //   size: size,
              //   title: 'Báo cáo phân tích chi tiêu',
              //   subtitle: 'Trả lời câu hỏi: tôi đã tiêu tiền vào những khoản gì?',
              //   icon: const Icon(
              //     Icons.history_edu,
              //     color: App_color.primaryColor,
              //     size: 40,
              //   ),
              // ),
              // Build_container_lifeStyle(
              //   size: size,
              //   title: 'Báo cáo thu chi hàng tháng',
              //   subtitle: 'Trở thành chuyên gia tài chính cá nhân của riêng mình',
              //   icon: const Icon(
              //     Icons.equalizer,
              //     color: App_color.primaryColor,
              //     size: 40,
              //   ),
              // ),
              // Build_container_lifeStyle(
              //   size: size,
              //   title: 'Đầu Tư Chứng Chỉ Quỹ',
              //   subtitle: 'Thẻ tín dụng NQPay',
              //   icon: const Icon(
              //     Icons.attach_money_rounded,
              //     color: App_color.primaryColor,
              //     size: 40,
              //   ),
              // ),
              // // Build_container_lifeStyle(size: size, title: 'Báo cáo phân tích chi tiêu', subtitle: 'Trả lời câu hỏi: tôi đã tiêu tiền vào những khoản gì?',),
              // Build_container_lifeStyle(
              //   size: size,
              //   title: 'Bảo hiểm du lịch',
              //   subtitle: 'Du lịch toàn cầu chỉ từ 23.000 VND/ ngày',
              //   icon: const Icon(
              //     Icons.flight_takeoff,
              //     color: App_color.primaryColor,
              //     size: 40,
              //   ),
              // ),
              // Build_container_lifeStyle(
              //   size: size,
              //   title: 'Khoản vay Ngân Hàng bản Việt',
              //   subtitle: 'Khoản vay cho nhà, xe và kinh doanh',
              //   icon: const Icon(
              //     Icons.handshake,
              //     color: App_color.primaryColor,
              //     size: 40,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
