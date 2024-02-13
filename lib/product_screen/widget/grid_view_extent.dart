import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../Models/list.dart';
import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';

class GridViewExtent extends StatefulWidget {
  const GridViewExtent({super.key});

  @override
  State<GridViewExtent> createState() => _GridViewExtentState();
}

class _GridViewExtentState extends State<GridViewExtent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child:GridView.extent(
      maxCrossAxisExtent:200.getH(),
      padding: EdgeInsets.symmetric(horizontal: 16.getW()),
      mainAxisSpacing:8.getH(),
      //vertically
      crossAxisSpacing:9.getW(),
      //horizontally
      childAspectRatio:0.85,
      children: [
        ...List.generate(
          list.length,
              (index) =>Container(
            padding: EdgeInsets.only(left: 12.getW()),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [

                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
              color: AppColors.white,
            ),
            height:196.getH(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:22.getH(),),
                Image.asset(list[index].image,width: 119.getW(),height:87.getH(),),
                SizedBox(height:40.getH(),),
                Text(list[index].productName,style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_0A1034,fontSize: 16.sp
                ),),
                SizedBox(height: 4.getH(),),
                Text(list[index].price,style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_0001FC,fontSize: 12.sp
                ),),
              ],),
          ),
        )
      ],
    ));
  }
}
