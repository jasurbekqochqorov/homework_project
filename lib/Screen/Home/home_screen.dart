

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/About/about_screen.dart';
import 'package:homework12/data/local/local_database.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/model/coffee_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CoffeeModel> coffees=[
    CoffeeModel(image:AppImages.coffee1,price:120, description:'aadfasdfa', name: "Cappucino", categoryId:1, rate: 2, subtitle: 'With Chocolate', type:'L'),
    CoffeeModel(image:AppImages.coffee2,price:234, description:'aDds', name: "AAAAAAAAA", categoryId:2, rate: 2, subtitle: 'With Oat Milk', type:'S'),
    CoffeeModel(image:AppImages.coffee3,price:234, description:'aDds', name: "Cappucino", categoryId:3, rate: 2, subtitle: 'With Oat Milk', type:"M"),
    CoffeeModel(image:AppImages.coffee4,price:234, description:'aDds', name: "Cappucino", categoryId:4, rate: 2, subtitle: 'With Oat Milk', type:"S"),
    CoffeeModel(image:AppImages.coffee5,price:234, description:'aDds', name: "VASDAWRGWRGW", categoryId:5, rate: 2, subtitle: 'With Oat Milk', type:"L"),
    CoffeeModel(image:AppImages.coffee6,price:234, description:'aDds', name: "VASDAWRGWRGW", categoryId:6, rate: 2, subtitle: 'With Oat Milk', type:"M"),
    CoffeeModel(image:AppImages.coffee7,price:234, description:'aDds', name: "VASDAWRGWRGW", categoryId:7, rate: 2, subtitle: 'With Oat Milk', type:"S"),
    CoffeeModel(image:AppImages.coffee8,price:234, description:'aDds', name: "VASDAWRGWRGW", categoryId:8, rate: 2, subtitle: 'With Oat Milk', type:'L'),
  ];
  List<CoffeeModel>list=[];
  List<CoffeeModel>list1=[];

  _init()async{
    list=await LocalDatabase.getAllTask();
    list1=await LocalDatabase.getAllTask();
    // print(list);
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          onPressed:(){},icon: SvgPicture.asset(AppImages.menu),),
        actions: [
          IconButton(onPressed:(){}, icon:SvgPicture.asset(AppImages.search)),
          IconButton(onPressed:(){}, icon:SvgPicture.asset(AppImages.like)),
          SizedBox(width: 24.w,)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:24.h,),
          Padding(padding:EdgeInsets.symmetric(horizontal:24.h,),
          child: Text('Your Favorites',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.w700
          ),),),
          SizedBox(height:12.h,),
          Visibility(
            visible:list1!=[],
            child: SizedBox(
              width: double.infinity,
              height: 431.h,
              child: CarouselSlider(
                  items:List.generate(list.length, (index){
                    return Container(
                    width: 256.w,
                    padding: EdgeInsets.symmetric(horizontal:8.w,vertical:8.h),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Image.asset(list[index].image,width:240.w,height: 276.h,fit: BoxFit.fill,),
                        SizedBox(height: 12.h,),
                        Text(list[index].name,style: Theme.of(context).textTheme.headlineSmall,),
                        SizedBox(height:4.h,),
                        Text(list[index].subtitle,style: Theme.of(context).textTheme.titleMedium,),
                        SizedBox(height:16.h,),
                        Row(children: [
                          Text('${list[index].price.toString()} \$',style: AppTextStyle.interBold.copyWith(
                            color: AppColors.c_FFC000,fontSize: 24.sp
                          ),),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:8.w,vertical:8.h),
                            decoration: const BoxDecoration(
                              color: AppColors.c_FFC000,
                              shape: BoxShape.circle
                            ),
                            child:const Icon(Icons.add,color: AppColors.white,),
                          )
                        ],)
                      ],),
                    );
              }),
                  options: CarouselOptions(
                    aspectRatio:0.85,
                    viewportFraction: 0.63,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )
              ),
            ),
          ),
          SizedBox(height: 24.h,),
          Padding(padding:EdgeInsets.symmetric(horizontal:24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Popular now',style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 16.h,),
              Text('All',style: Theme.of(context).textTheme.headlineSmall,)
          ],),),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
            children: [
              ...List.generate(coffees.length, (index){
                return Image.asset(coffees[index].image);
              })
            ],),
          )
      ],),
    );
  }
}

//...List.generate(coffees.length~/2, (index){
//                     return Column(children: [
//                       SizedBox(height:16.h,),
//                       Row(children: [
//                         Expanded(child:ZoomTapAnimation(
//                           onTap: (){
//                             Navigator.push(context,MaterialPageRoute(builder: (context){
//                               return AboutScreen(coffeeModel: coffees[index],);
//                             }));
//                             setState(() {});
//                           },
//                           child:Image.asset((coffees[index].image),width:178.w,height:238.h,fit: BoxFit.fill,),
//                         )),
//                         SizedBox(width: 24.w,),
//                         Expanded(child:ZoomTapAnimation(
//                         onTap: (){
//                           Navigator.push(context,MaterialPageRoute(builder: (context){
//                             return AboutScreen(coffeeModel: coffees[coffees.length-1-index]);
//                           }));
//                           setState(() {});
//                         },
//                           child:  Image.asset((coffees[(coffees.length-1)-index].image),width:178.w,height:238.h,fit: BoxFit.fill,),
//                         )),
//                       ],)
//                     ],);
//                   })