import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/data/model/category_model.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class CategoriesFoodView extends  SliverPersistentHeaderDelegate{
  final VoidCallback onTap;
  CategoriesFoodView({required this.onTap,});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    List<CategoryModel> list=[
      CategoryModel(image:AllIcon.vegetables, title:'Vegetables'),
      CategoryModel(image:AllIcon.fruit, title:'Fruit'),
      CategoryModel(image:AllIcon.spice, title:'Spice'),
      CategoryModel(image:AllIcon.ingridient, title:'Ingridients'),
      CategoryModel(image:AllIcon.sideDishes, title:'Side Dishes'),
      CategoryModel(image:AllIcon.vegetables, title:'Vegetables'),
      CategoryModel(image:AllIcon.fruit, title:'Fruit'),
      CategoryModel(image:AllIcon.spice, title:'Spice'),
      CategoryModel(image:AllIcon.ingridient, title:'Ingridients'),
      CategoryModel(image:AllIcon.sideDishes, title:'Side Dishes'),
    ];
    return Container(
      height: 100,
      color: AppColors.white,
      // margin:EdgeInsets.only(left: 24.w,right: 24.w),
      child: ListView(
        padding: EdgeInsets.only(top: 16.h,right:24.w,left:16.w),
        scrollDirection: Axis.horizontal,
        children: [
        ...List.generate(list.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal:8.w),
            child: Column(
              children: [
                InkWell(onTap: (){}, focusColor: AppColors.black,child:ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(list[index].image,width:55.w,height:55.h,fit: BoxFit.cover,)),),
                Text(list[index].title,style: AppTextStyle.interRegular.copyWith(
                  color: AppColors.black.withOpacity(0.8),fontSize:13.sp
                ),)
              ],
            ),
          );
        })
      ],),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
