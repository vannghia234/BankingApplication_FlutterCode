import 'package:flutter/material.dart';

class BuildContainer_history extends StatelessWidget {
  const BuildContainer_history({
    Key? key,
    required this.title,
     required this.subtitle,
    required this.tienTru,
    required this.soDu,
    required this.container,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String subtitle;
  final String title;
  final String tienTru;
  final String soDu;
  final Widget container;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 1/7,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 1,
              blurStyle: BlurStyle.solid,
              offset: Offset(2,0)

            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style:  const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16
                ),),
                const SizedBox(height: 6,),
                Text(subtitle, style:  TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)
                ),),
                const SizedBox(height: 8,),
                container,

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tienTru, style:  const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18
                  ),),
                  Text(soDu, style:   TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
