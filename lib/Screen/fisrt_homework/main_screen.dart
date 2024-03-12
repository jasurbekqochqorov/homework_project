import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/fisrt_homework/widget/widget.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/icons/icon.dart';
import '../../utils/fonts/fonts.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>list=['Uber Monthly','Behance Project','Behance Project','Transfer Money'];
    List<String>list2=['january','february','march','april','may','july','june','august','september','november','december','october'];
    return  Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          // pinned: true,
          expandedHeight: 441.h,
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.7),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              margin:  EdgeInsets.only(left: 20.w,right: 18.w,top:37.h),
              decoration: BoxDecoration(
                color:AppColors.c_F5F6FA,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.only(left: 22.w,right:22.h,top: 41.h,bottom:42.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          IconButton(
                              onPressed: (){},
                              padding: const EdgeInsets.all(16),
                              style:IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)
                                ),
                                backgroundColor: AppColors.white
                              ),
                              icon: Icon(Icons.arrow_back,size:18.sp,)),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              style:IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)
                                ),
                                backgroundColor: AppColors.white
                              ),
                              icon: Icon(Icons.more_horiz,size:30.sp,)),
                        ],),
                        SizedBox(height: 22.h,),
                        Text('Balances',style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c_151940,fontSize:40.sp
                        ),)
                      ],
                    ),
                  ),
                  Expanded(
                    // height:140.h,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal:22.w),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(4, (index){
                          return Container(
                            margin:EdgeInsets.symmetric(horizontal:7.w),
                            decoration: BoxDecoration(
                                boxShadow:[
                                BoxShadow(
                                  spreadRadius:0,
                                  blurRadius: 3,
                                  offset: const Offset(4,0),
                                  color: AppColors.black.withOpacity(0.1)
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.white
                            ),
                            padding: EdgeInsets.only(left: 19.w,top:17.h,right:39,bottom:20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Container(
                                width:36.w,
                                height: 36.h,
                                child:  Icon(Icons.monetization_on,color: AppColors.blue,size:17.sp,),
                              ),
                              SizedBox(height: 16.h,),
                              Text('585.00',style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.c_151940,fontSize:19.sp
                              ),),
                               Text('EUR Balance',style: AppTextStyle.interSemiBold.copyWith(
                                 color: AppColors.c_898A8D,fontSize:12.sp
                               ),)
                            ],)
                          );
                        })
                      ],
                    ),
                  ),
                  SizedBox(height:30.h,),
                  Center(
                    child: Text('See Balance Details',textAlign: TextAlign.center,style: AppTextStyle.interSemiBold.copyWith(
                      color: AppColors.blue,fontSize: 18.sp,
                    ),),
                  ),
                  SizedBox(height:4.h,),
                ],
              ),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: CategoriesView(
          // pinned: true,
          onTap: (){},
        ),
        ),
        SliverList(
            delegate:
            SliverChildListDelegate([
          Padding(
            padding:  EdgeInsets.only(left: 42.w,bottom:13.h),
            child: Text('Today',style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.black,fontSize: 26.sp
            ),),
          ),
          ...List.generate(16, (index){
            return ListTile(
              onTap: (){},
              contentPadding: EdgeInsets.symmetric(horizontal:42.w,vertical:17.h),
              leading:Container(
                  decoration: BoxDecoration(
                color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.r),
                      boxShadow:  [
                        BoxShadow(
                            spreadRadius:0,
                            blurRadius:5,
                            color: AppColors.black.withOpacity(0.1),
                            offset: const Offset(0,4)
                        )
                      ]
                  ),
                  child:Image.asset(AllIcon.be)),
              title:Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(list[Random().nextInt(4)],style: AppTextStyle.interSemiBold.copyWith(
                      color:AppColors.black,fontSize: 18.sp
                    ),),
                    Text('${Random().nextInt(30)}rd ${list2[Random().nextInt(12)]} ${Random().nextInt(24)+2000}',style: AppTextStyle.interRegular.copyWith(
                      color: AppColors.black.withOpacity(0.6),fontSize: 12.sp
                    ),),
                  ],),
                  const Spacer(),
                  Text('\$${Random().nextInt(1000)+100}',style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.black
                  ),)
                ],
              ),
              
            );
          })
        ]
        ))
      ],
    ),
    );
  }
}
