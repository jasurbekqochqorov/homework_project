import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.h,
        margin: EdgeInsets.only(left: 24.w,right: 24.w,top:10.h),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Best Deal',style: AppTextStyle.interBold.copyWith(
                color: AppColors.black,fontSize:15.sp
            ),),
            SizedBox(height:10.h,),
            Container(
              // padding: EdgeInsets.only(right: 0),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient:const LinearGradient(
                      colors: [
                        Color(0xFFFF8730),
                        Color(0xFFFFBC6B),
                      ]
                  )
              ),
              child: Row(
                children: [
                  Padding(
                    padding:EdgeInsets.only(left: 15.w,top: 20.h),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('#SimpleKitchen',style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.white,fontSize:10.sp
                        ),),
                        SizedBox(height:27.h,),
                        Text('Soup \nPackage',style: AppTextStyle.interBold.copyWith(
                            color: AppColors.white,fontSize: 24.sp
                        ),),
                        Text("No need to think about ingredients anymore,\nlet's find your menu today",style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.white,fontSize:6.sp
                        ),),
                        SizedBox(height:19.h,)
                      ],),
                  ),
                  Spacer(),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(AllIcon.banner,height:170.h,width:200,fit: BoxFit.fill,))
                ],),
            ),
            SizedBox(height:15.h,)  ,
            Row(children: [
              Text('Best Price',style: AppTextStyle.interBold.copyWith(
                  color: Color(0xFF3D3014),
                  fontSize: 14.sp
              ),),
              Spacer(),
              Text('Show all',style:AppTextStyle.interRegular.copyWith(
                  color: Color(0xFF3D3014),
                  fontSize: 14.sp
              )),
            ],)
          ],),
              ),
        Positioned(
            top:  0,left:70.w,right:10,
            child:Image.asset(AllIcon.soup,fit: BoxFit.cover,width: 150.w,height: 210.h,))
      ],
    );
  }
}
