import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

class CategoriesView extends  SliverPersistentHeaderDelegate{
  final VoidCallback onTap;
  CategoriesView({required this.onTap,});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    List<String> list=['Payments','Food','Services','Rent'];
    int active=0;
    return StatefulBuilder(builder: (context,setState){
      return Container(
        color:AppColors.white,
        // margin: EdgeInsets.only(top:10.h),
        padding: EdgeInsets.only(top: 16.h),
        height: 90.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
              list.length,
                  (index) => TextButton(onPressed:(){
                    active=index;
                    setState((){});
              },
                  style: TextButton.styleFrom(
                    backgroundColor:(index==active)?AppColors.blue:AppColors.white,
                  ),
                  child:Row(children: [
                    Icon(Icons.circle,size:14.sp,color:(active==index)?AppColors.white:const Color(0xFF7F8192),),
                    SizedBox(width: 5.w),
                    Text(list[index],style: AppTextStyle.interRegular.copyWith(
                      color: (active==index)?AppColors.white:const Color(0xFF7F8192)
                    ),)
                  ],)),
            )
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
