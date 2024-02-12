import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Models/models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../Models/list.dart';


class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
ScrollController scrollController=ScrollController();
List<ButtonIcons> icons=[
  ButtonIcons(icon: AllIcon.home),
  ButtonIcons(icon: AllIcon.search),
  ButtonIcons(icon: AllIcon.box),
  ButtonIcons(icon: AllIcon.person),
];
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
      appBar:AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:SvgPicture.asset( AllIcon.arrowBack),),
      ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       Padding(padding: EdgeInsets.symmetric(horizontal: 16.getW(),vertical: 24.getH()),
         child:Text(products,style: AppTextStyle.interBold.copyWith(
           color: AppColors.c_0A1034,fontSize: 24.sp
         ),)),
       Padding(
         padding:EdgeInsets.symmetric(horizontal: 16.getW()),
         child: Row(children: [
           Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(4.r),
               border: Border.all(width: 1,color: AppColors.c_A7A9BE)
             ),
             padding: EdgeInsets.symmetric(
              vertical: 8.getH(),horizontal: 9.getW()
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
               children: [
               Text('Ascending price',style: AppTextStyle.interRegular.copyWith(
                 color: AppColors.c_A7A9BE,fontSize: 14.sp
               ),),
               const ZoomTapAnimation(child: Icon(Icons.arrow_upward_rounded,size:15,color: AppColors.c_A7A9BE,)),
               const ZoomTapAnimation(child: Icon(Icons.keyboard_arrow_down,size:19,color: AppColors.c_A7A9BE,)),

             ],),
           ),
           SizedBox(width: 32.getW(),),
           Row(children: [
             Text('Filters',style: AppTextStyle.interRegular.copyWith(
               color: AppColors.c_A7A9BE,fontSize: 14.sp
             ),),
             IconButton(onPressed:(){}, icon:const Icon(Icons.keyboard_arrow_down,size:18,color: AppColors.c_A7A9BE,)),
           ],),
           const Spacer(),
          IconButton(onPressed:(){}, icon: SvgPicture.asset(AllIcon.apps))
         ],),
       ),
         SizedBox(height: 32.getH(),),
         Expanded(
           child: GridView.count(
             controller:scrollController,
             scrollDirection: Axis.vertical,
             padding: EdgeInsets.symmetric(horizontal: 16.getW()),
             mainAxisSpacing:8.getH(),
             //vertically
             crossAxisSpacing:9.getW(),
             //horizontally
             crossAxisCount: 2,
             childAspectRatio:0.75,
             children: [
               ...List.generate(
                 list.length,
                     (index) =>Container(
                       padding: EdgeInsets.only(left: 12.getW()),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(6.r),
                       color: AppColors.white,
                       ),
                       height: 196.getH(),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         SizedBox(height: 32.getH(),),
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
               )
             ],
           ),
         ),
         Container(
           padding: EdgeInsets.symmetric(vertical:12.getH(),horizontal: 50.getW(),),
           child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               ...List.generate(icons.length, (index) =>IconButton(onPressed: (){
                 activeIndex=index;
                 setState(() {});
               },icon: SvgPicture.asset(icons[index].icon,colorFilter: ColorFilter.mode(
                   (activeIndex==index)?AppColors.blue:AppColors.c_0A1034,BlendMode.srcIn),width: 18.getW(),height: 18.getH(),)))
             ],),
         )
     ],), 
    );
  }
}

class ButtonIcons{
  String icon;
  ButtonIcons({required this.icon});
}