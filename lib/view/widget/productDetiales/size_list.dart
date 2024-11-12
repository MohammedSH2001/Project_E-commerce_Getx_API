import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key});

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ["S", "M", "L", "XL", "XXL"];
  var currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentSelected = index;
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: currentSelected == index
                    ? Get.isDarkMode
                        ? pinkClr
                        : mainColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 2,
                ),
              ),
              child: Text(
                sizeList[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: sizeList.length,
      ),
    );
  }
}
