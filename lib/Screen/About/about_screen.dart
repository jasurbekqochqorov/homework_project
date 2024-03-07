import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/data/local/local_database.dart';
import 'package:homework12/data/model/coffee_model.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  CoffeeModel coffeeModel=CoffeeModel.initialValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(padding: EdgeInsets.symmetric(horizontal:24.w,vertical:24.h),
                  child:Expanded(
                    // height:544.h,
                    // width:double.infinity,
                    child: Stack(
                      children: [
                      Image.asset(widget.coffeeModel.image,height: 544.h,fit: BoxFit.fill,),
                      Positioned(
                          bottom: 0,
                          // left: 0,
                          child:Container(
                            decoration: BoxDecoration(
                              color: AppColors.c_FFFFFF.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical:16.h),
                        child: SizedBox(
                          width: 350.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(
                              children: [
                              Text(widget.coffeeModel.name,style: Theme.of(context).textTheme.headlineSmall,),
                              const   Spacer(),
                              Text(widget.coffeeModel.rate.toString())
                            ],),
                            Text(widget.coffeeModel.subtitle),
                            SizedBox(height:16.h,),
                            Row(children: [
                              Text(widget.coffeeModel.price.toString()),
                              const Spacer(),
                              TextButton(onPressed: (){
                                LocalDatabase.insertTask(widget.coffeeModel);
                                setState(() {});
                              },
                                  style:TextButton.styleFrom(
                                    backgroundColor: AppColors.c_FFC000,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r)
                                    )
                                  ),
                                  child:const Text('Add to cart'))
                            ],)
                          ],),
                        ),
                      )),
                        Positioned(
                            top:16.h,left: 16.w,
                            child:TextButton(onPressed: (){
                              Navigator.pop(context);
                            },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)
                                ),
                                  backgroundColor: AppColors.white.withOpacity(0.3),
                                  padding: EdgeInsets.symmetric(horizontal:15.w,vertical:15.h)
                              ),
                              child:const Icon(Icons.arrow_back,color: AppColors.white,),)),
                    ],),
                  )),
                Padding(padding: EdgeInsets.symmetric(horizontal:24.w),child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Description',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20.sp,fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height: 8.h,),
                  Text(widget.coffeeModel.description,style: AppTextStyle.interRegular.copyWith(
                    color: AppColors.white.withOpacity(0.25),fontSize:18.sp
                  ),),
                   SizedBox(height:24.h,),
                   Text('Size',style:Theme.of(context).textTheme.titleLarge,),
                   SizedBox(height: 10.h,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     Container(
                       padding:EdgeInsets.symmetric(vertical:8.h,horizontal:48.w),
                       decoration: BoxDecoration(
                         color:(widget.coffeeModel.type.name=='S')?AppColors.black:AppColors.white.withOpacity(0.3),
                         border: Border.all(color: (widget.coffeeModel.type.name=='S')?AppColors.c_D17842:AppColors.white.withOpacity(0.3),width: 1.sp),
                         borderRadius: BorderRadius.circular(4.r),
                       ),
                       child:Text('S',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                         color:(widget.coffeeModel.type.name=='S')?AppColors.c_D17842:AppColors.white
                       ),),
                     ),
                     Container(
                       padding:EdgeInsets.symmetric(vertical:8.h,horizontal:48.w),
                       decoration: BoxDecoration(
                         color:(widget.coffeeModel.type.name=='M')?AppColors.black:AppColors.white.withOpacity(0.3),
                         border: Border.all(color: (widget.coffeeModel.type.name=='M')?AppColors.c_D17842:AppColors.white.withOpacity(0.3),width: 1.sp),
                         borderRadius: BorderRadius.circular(4.r),
                       ),
                       child:  Text('M',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                         color: (widget.coffeeModel.type.name=='M')?AppColors.c_D17842:AppColors.white
                       ),),
                     ),
                       Container(
                         padding:EdgeInsets.symmetric(vertical:8.h,horizontal:48.w),
                         decoration: BoxDecoration(
                           color:(widget.coffeeModel.type.name=='L')?AppColors.black:AppColors.white.withOpacity(0.3),
                           border: Border.all(color: (widget.coffeeModel.type.name=='L')?AppColors.c_D17842:AppColors.white.withOpacity(0.3),width: 1.sp),
                           borderRadius: BorderRadius.circular(4.r),
                         ),
                         child:  Text('L',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                             color: (widget.coffeeModel.type.name=='L')?AppColors.c_D17842:AppColors.white
                         ),),
                       ),
                   ],),
                ],),)
              ],),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:24.w),
            width:double.infinity,
            child: TextButton(
                onPressed: (){},
                style:TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical:16.h),
                  backgroundColor: AppColors.c_D17842,
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)
                  ),
                ),
                child:Text('Buy now',style: AppTextStyle.interBold.copyWith(
                    color: AppColors.white,fontSize:20.sp
                ),)),
          ),
          SizedBox(height:48.h,)
        ],
      ),
    );
  }
}
