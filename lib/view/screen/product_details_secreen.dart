import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/view/widget/productDetiales/add_cart.dart';
import 'package:flutter_api_getx_matjer/view/widget/productDetiales/clothes_info.dart';
import 'package:flutter_api_getx_matjer/view/widget/productDetiales/image_sliders.dart';
import 'package:flutter_api_getx_matjer/view/widget/productDetiales/size_list.dart';
import 'package:get/get.dart';

class ProductDetailsSecreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsSecreen({super.key, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                titel: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
            const  SizeList(),
            AddCart(
              price: productModels.price,
              productModels: productModels,
            ),
            ],
          ),
        ),
      ),
    );
  }
}
