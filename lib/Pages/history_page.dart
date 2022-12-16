import 'package:banking_application/Component/appbar_wiget.dart';
import 'package:banking_application/Component/buildContainer_history.dart';
import 'package:banking_application/Provider/HistoryProvider.dart';
import 'package:banking_application/Provider/TransactionProvider.dart';
import 'package:banking_application/models/TransactionHistory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class History_page extends StatefulWidget {
  const History_page({Key? key}) : super(key: key);
  @override
  State<History_page> createState() => _History_pageState();
}

class _History_pageState extends State<History_page> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<HistoryProvider>(context, listen: false).transHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('build history');
    // Provider.of<HistoryProvider>(context, listen: false).transHistory();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                const AppbarWiget(),
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.15)),
                  child: const Text(
                    '04/12/2022',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54),
                  ),
                ),
                Consumer2<HistoryProvider, TransactionProvider>(
                 builder: (context, value, value2, child) {
                   return Flexible(
                     child: ListView.builder(
                       itemBuilder: (context, index) {
                         return  BuildContainer_history(
                           size: size,
                           title: value.getListHistory![index].transDesc ?? "",
                           subtitle: 'retail transaction',
                           tienTru: value.getListHistory![index].transAmount ?? "" ,
                           soDu: value2.currentMoneyString,
                           container: (index % 2 == 0) ? container_rutTien : container_muaSam,
                         );
                       },
                       itemCount: value.getListHistory?.length,
                     ),
                   );
                 },
                )

                // BuildContainer_history(
                //   size: size,
                //   title: 'Card Payment',
                //   subtitle: 'retail transaction',
                //   tienTru: '-500.000',
                //   soDu: '20.000.000',
                //   container: container_muaSam,
                // ),
                // BuildContainer_history(
                //   size: size,
                //   title: 'Cash',
                //   subtitle: 'ATM transaction',
                //   tienTru: '-20.000.000',
                //   soDu: '10.000.000',
                //   container: container_rutTien,
                // ),
                // BuildContainer_history(
                //   size: size,
                //   title: 'Card Payment',
                //   subtitle: 'retail transaction',
                //   tienTru: '-500.000',
                //   soDu: '2.000.000',
                //   container: container_muaSam,
                // ),
                // BuildContainer_history(
                //   size: size,
                //   title: 'Card Payment',
                //   subtitle: 'retail transaction',
                //   tienTru: '-500.000',
                //   soDu: '2.000.000',
                //   container: container_muaSam,
                // ),
              ],
            ),
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
      children: const [
        Padding(
          padding: EdgeInsets.only(right: 5),
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
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: const Color(0xFFFCD9E9),
    ),
    child: Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(right: 5),
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
