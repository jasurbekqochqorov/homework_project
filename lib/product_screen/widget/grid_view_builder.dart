import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../Models/list.dart';
import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';



class GridViewBuilder extends StatefulWidget {
  const GridViewBuilder({super.key});

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount:list.length,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        childAspectRatio: 0.85,
        mainAxisSpacing:8.getH(),
        //vertically
        crossAxisSpacing:9.getW(),
        //horizontally
      ), itemBuilder:(context,index){
        return Column(children: [
          Container(
              padding: EdgeInsets.only(left: 12.getW()),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.white,
              ),
              height: 196.getH(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.getH(),),
                  Image.asset(list[index].image,width: 119.getW(),height:87.getH(),),
                  SizedBox(height: 42.getH(),),
                  Text(list[index].productName,style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.c_0A1034,fontSize: 16.sp
                  ),),
                  SizedBox(height: 4.getH(),),
                  Text(list[index].price,style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.c_0001FC,fontSize: 12.sp
                  ),),
                ],),
            ),
        ],);
      }),
    );
  }
}
