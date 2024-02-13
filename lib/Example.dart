import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/product_screen/widget/grid_view_count.dart';
import 'package:homework12/second.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'Models/list.dart';
import 'Models/models.dart';

class ProductsExample extends StatefulWidget {
  const ProductsExample({super.key});

  @override
  State<ProductsExample> createState() => _ProductsExampleState();
}

class _ProductsExampleState extends State<ProductsExample> {
  int activeIndex=0;
  List<ProductsName> categories = [
    ProductsName.all,
    ProductsName.computers,
    ProductsName.smart_objects,
    ProductsName.smartphones,
    ProductsName.speakers,
    ProductsName.accessories
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products', style: AppTextStyle.interBold.copyWith(
              color: AppColors.blue, fontSize: 24
          ),),
          centerTitle: true,
        ),
        body:GridView.count(crossAxisCount:2,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ...List.generate(models.length, (index) =>ZoomTapAnimation(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return Second();
              }));
            },
            child: Container(
              decoration: BoxDecoration(
              color: AppColors.blue,
                borderRadius: BorderRadius.circular(6)
              ),
              padding: EdgeInsets.all(20),
              child: Image.asset(models[index].image),
            ),
          ))
        ],)
    );
  }
}
