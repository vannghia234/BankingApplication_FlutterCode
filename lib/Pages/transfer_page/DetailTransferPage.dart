import 'package:banking_application/API/api_services.dart';
import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Provider/TransactionProvider.dart';
import 'package:banking_application/anim/LoadAnimSuccessfullyPage.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:banking_application/models/ToBanking.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'InputTransferPage.dart';

class ConfirmTransfer_Page extends StatelessWidget {
  const ConfirmTransfer_Page(
      {Key? key, required this.loiNhan, this.infoBanking, this.soTien})
      : super(key: key);
  final ToBanking? infoBanking;
  final String? soTien;
  final String loiNhan;

  @override
  Widget build(BuildContext context) {
    // print('lời nhắn: $loiNhan');
    print('rebuild detaiTransfer');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppbar(context),
      body: getBody(size, context),
    );
  }

  AppBar getAppbar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
        ),
      ),
      title: Text(
        'Chuyển tiền',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
      ),
    );
  }

  getBody(Size size, BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SoDuBar_widget(
            soDu: soTien,
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: InfoTransfer_widget(
                  size: size,
                  loiNhan: loiNhan,
                  soTien: soTien,
                  infobanking: infoBanking,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Reminder_widget(
                    icon: Icons.info_outline,
                    loiNhan:
                        'Người nhận ở ngân hàng khác sẽ nhận được nội dung bên dư'),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                width: size.width - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.withOpacity(0.09)),
                child: Center(
                    child: Text(
                  loiNhan ?? "",
                  textAlign: TextAlign.center,
                  style: App_Style.primaryStyle().copyWith(fontSize: 14),
                )),
              ),
            ],
          ),
          const Spacer(),
          ButtonWidget(
            size: size,
            text: 'chuyển tiền ngay',
            onTapp: () async {
              print("số tiền: $soTien");
              final response = await ApiServices.intance.resultTransfer(amount: soTien.toString(), des: 'mess', to: '003704070000276');
              // amount: soTien.toString(), description: loiNhan.toString(), toAcct: infoBanking?.soTaiKhoan
             print(response.response?.responseCode);
              switch (response.response?.responseCode) {
                case "04":
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.warning,
                    text: 'số dư trong tài khoản của bạn không đủ để thực hiện',
                    confirmBtnColor: App_color.primaryColor,
                    autoCloseDuration: Duration(seconds: 4),
                  );
                  break;
                case "99":
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    text: 'Hệ thống đang bảo trì, quay lại sau nhé',
                    confirmBtnColor: App_color.primaryColor,
                    autoCloseDuration: Duration(seconds: 4),
                  );
                  break;
                case "09":
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    text: 'tài khoản ngân hàng không hợp lệ',
                    confirmBtnColor: App_color.primaryColor,
                    autoCloseDuration: Duration(seconds: 4),
                  );
                  break;
                case "00":
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoadAnimSuccessfullyPage(
                          title: 'chuyển tiền thành công',
                          home: true,
                        ),
                        opaque: false,
                      ));
                  break;
              }
            },
          )
        ],
      ),
    );
  }
}

class InfoTransfer_widget extends StatelessWidget {
  final Size size;
  final String? loiNhan;
  final String? soTien;
  final ToBanking? infobanking;

  const InfoTransfer_widget(
      {Key? key,
      required this.size,
      required this.loiNhan,
      required this.soTien,
      required this.infobanking})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2,
      width: size.width - 30,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width - 31,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.18),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Số tiền ',
                        style: App_Style.primaryStyle().copyWith(fontSize: 14),
                      ),
                      Text(
                        MoneyFormatter(amount: double.parse(soTien!))
                            .output
                            .withoutFractionDigits,
                        style: App_Style.primaryStyle().copyWith(
                            color: App_color.primaryColor, fontSize: 22),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Expanded(
              child: From_To_widget(
            to: 'Từ',
            name: 'Nguyen van nghia',
            bankingName: 'NQPay',
            iD: '060260253834',
          )),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
              child: From_To_widget(
            to: 'Đến',
            name: infobanking?.tenTaiKhoan,
            bankingName: infobanking?.tenNganHang,
            iD: '5559383453',
          )),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
            child: LoiNhan_widget(
              loiNhan: loiNhan,
            ),
          )
        ],
      ),
    );
  }
}

class LoiNhan_widget extends StatelessWidget {
  final String? loiNhan;

  const LoiNhan_widget({Key? key, required this.loiNhan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Lời nhắn:',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loiNhan ?? "",
                  style: App_Style.primaryStyle().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14),
                ),
              ],
            ))
      ],
    );
  }
}

class From_To_widget extends StatelessWidget {
  final String? name;
  final String to;
  final String? bankingName;
  final String iD;

  const From_To_widget(
      {Key? key,
      required this.name,
      required this.to,
      required this.bankingName,
      required this.iD})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                to,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name?.toUpperCase() ?? "",
                  style: App_Style.primaryStyle().copyWith(
                      letterSpacing: 0.15,
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  bankingName!,
                  style: App_Style.primaryStyle().copyWith(
                      color: Colors.black.withOpacity(0.4), fontSize: 15),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  iD,
                  style: App_Style.primaryStyle().copyWith(
                      color: Colors.black.withOpacity(0.25),
                      letterSpacing: 0.2,
                      fontSize: 15),
                )
              ],
            ))
      ],
    );
  }
}

class SoDuBar_widget extends StatelessWidget {
  final String? soDu;

  const SoDuBar_widget({Key? key, required this.soDu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: App_color.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Số dư khả dụng: ',
            style: App_Style.primaryStyle()
                .copyWith(color: Colors.white.withOpacity(0.85), fontSize: 14),
          ),
          Consumer<TransactionProvider>(
            builder: (context, value, child) {
              return Text(
                value.currentMoneyString,
                style: App_Style.primaryStyle()
                    .copyWith(color: Colors.white, letterSpacing: 0.5),
              );
            },
          ),
        ],
      ),
    );
  }
}
