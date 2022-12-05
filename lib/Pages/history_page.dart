import 'package:banking_application/Component/appbar_wiget.dart';
import 'package:banking_application/Component/buildContainer_history.dart';
import 'package:flutter/material.dart';

class History_page extends StatefulWidget {
  const History_page({Key? key}) : super(key: key);

  @override
  State<History_page> createState() => _History_pageState();
}

class _History_pageState extends State<History_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppbarWiget(),
              Container(
                padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.15)),
                child: Text(
                  '04/12/2022',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54),
                ),
              ),
              BuildContainer_history(
                size: size,
                title: 'Card Payment',
                subtitle: 'retail transaction',
                tienTru: '-500.000',
                soDu: '20.000.000',
                container: container_muaSam,
              ),
              BuildContainer_history(
                size: size,
                title: 'Cash',
                subtitle: 'ATM transaction',
                tienTru: '-20.000.000',
                soDu: '10.000.000',
                container: container_rutTien,
              ),
              BuildContainer_history(
                size: size,
                title: 'Card Payment',
                subtitle: 'retail transaction',
                tienTru: '-500.000',
                soDu: '2.000.000',
                container: container_muaSam,
              ),
              BuildContainer_history(
                size: size,
                title: 'Card Payment',
                subtitle: 'retail transaction',
                tienTru: '-500.000',
                soDu: '2.000.000',
                container: container_muaSam,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final container_rutTien = Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Color(0xffD2E4F1),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.account_balance,
            size: 16,
            color: Color(0xff0077B4),
          ),
        ),
        Text(
          'Rút tiền mặt',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xff0077B4),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
  final container_muaSam = Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Color(0xFFFCD9E9),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.shopping_basket_rounded,
            size: 16,
            color: Color(0xffE64089),
          ),
        ),
        Text(
          'Mua sắm khác',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xffE64089),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
