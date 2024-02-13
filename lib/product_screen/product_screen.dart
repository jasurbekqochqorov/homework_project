import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Models/models.dart';
import 'package:homework12/product_screen/widget/grid_view_builder.dart';
import 'package:homework12/product_screen/widget/grid_view_count.dart';
import 'package:homework12/product_screen/widget/grid_view_extent.dart';
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
          IconButton(onPressed:(){}, icon: SvgPicture.asset(AllIcon.apps,width: 18.getW(),height: 18.getH(),))
         ],),
       ),
         SizedBox(height: 32.getH(),),
         const GridViewExtent(),
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