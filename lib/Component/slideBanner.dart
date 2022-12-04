import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app_style/app_color/App_color.dart';
import '../app_style/app_images/App_images_banner.dart';
class SliderBanner extends StatefulWidget {
  final Size size;
  const SliderBanner({Key? key, required this.size}) : super(key: key);
  @override
  State<SliderBanner> createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: getListBanner.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 14),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(3, 2),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            getListBanner[index]['name'],
                          ))),
                ),
              );
            },
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    selected_index = index;
                  });
                },
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                viewportFraction: 0.90,
                initialPage: selected_index,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(milliseconds: 3000))),
        const SizedBox(height: 10,),
        AnimatedSmoothIndicator(
            duration: Duration(milliseconds: 300),
            effect: ScrollingDotsEffect(
                dotHeight: 6,
                dotWidth: 6,
                dotColor: App_color.primaryColor,
                spacing: 10),
            activeIndex: selected_index,
            count: getListBanner.length)
      ],
    );
  }
}
