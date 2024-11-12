import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/card_controller.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/productDetiales/color_piker.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  ImageSliders({super.key, required this.imageUrl});

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselSliderController myController = CarouselSliderController();
  int currentPage = 0;
  int currentColor = 0;
  final cartController = Get.find<CardController>();
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: myController,
          itemCount: 3,
          options: CarouselOptions(
            height: 470,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.imageUrl,
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20)),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              dotColor: Colors.black,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                    outerBorder: currentColor == index,
                    color: colorSelected[index],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 3,
              ),
              itemCount: colorSelected.length,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -10),
                badgeStyle: badges.BadgeStyle(badgeColor: Colors.grey),
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.cardSecreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.8)
                            : mainColor.withOpacity(0.8),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    
    
    
      ],
    );
  }
}
