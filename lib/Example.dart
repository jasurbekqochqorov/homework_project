import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/second.dart';
import 'package:homework12/utils/color/color.dart';
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
        childAspectRatio:0.84,
        children: [
          ...List.generate(models.length, (index) =>ZoomTapAnimation(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return Second(
                  image: models[index].image,
                  name: models[index].productName,
                  price: models[index].price,
                );
              }));
            },
            child: Container(
              decoration: BoxDecoration(
              color: AppColors.white,
                borderRadius: BorderRadius.circular(6)
              ),
              padding: EdgeInsets.symmetric(horizontal:15.w,vertical:10.h),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Center(child: Image.asset(models[index].image,width: 119.h,height:84.h,)),
                SizedBox(height: 15,),
                RichText(text:TextSpan(
                  text:'Nomi: ',
                  style:AppTextStyle.interMedium.copyWith(
                      color: AppColors.black,fontSize: 14.sp
                  ),
                  children: [
                    TextSpan(
                      text:models[index].productName,
                      style: AppTextStyle.interMedium.copyWith(
                        color:Colors.orange,fontSize: 14.sp
                      )
                    )
                  ]
                )),
                  SizedBox(height:4,),
                  RichText(text:TextSpan(
                      text:'Narxi:  ',
                      style:AppTextStyle.interMedium.copyWith(
                          color: AppColors.black,fontSize: 14.sp
                      ),
                      children: [
                        TextSpan(
                            text:models[index].price,
                            style: AppTextStyle.interMedium.copyWith(
                                color:Colors.red,fontSize: 14.sp,
                              decoration:TextDecoration.lineThrough
                            )
                        )
                      ]
                  )),
                  SizedBox(height: 4.h,),
                  Text('${Random().nextInt(10000)+100}\$',style: AppTextStyle.interMedium.copyWith(
                    color:Colors.orange,fontSize: 14.sp
                  ),)
              ],),
            ),
          ))
        ],)
    );
  }
}
