import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class bottom_nav extends StatelessWidget {
  const bottom_nav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 30,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 80,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey.withOpacity(0.7),
                      size: 32,
                    ),
                    Text('Home', style: GoogleFonts.openSans(height: 1.4))
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Column(
                  children: [
                    Icon(
                      Icons.bar_chart,
                      color: Colors.grey.withOpacity(0.7),
                      size: 32,
                    ),
                    Text(
                      'Lifestyle',
                      style: GoogleFonts.openSans(height: 1.4),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(
                  'Transfer',
                  style: GoogleFonts.openSans(height: 1.4),
                ),
                margin: EdgeInsets.only(top: 22),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Column(
                  children: [
                    Icon(
                      Icons.history,
                      color: Colors.grey.withOpacity(0.7),
                      size: 32,
                    ),
                    Text(
                      'History',
                      style: GoogleFonts.openSans(height: 1.4),
                    )
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Column(
                  children: [
                    Icon(
                      Icons.apps_rounded,
                      color: Colors.grey.withOpacity(0.7),
                      size: 32,
                    ),
                    Text(
                      'Others',
                      style: GoogleFonts.openSans(height: 1.4),
                    )
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
