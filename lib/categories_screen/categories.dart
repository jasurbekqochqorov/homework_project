import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Models/list.dart';
import 'package:homework12/product_screen/product_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../Models/models.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<ProductsName> categories = [
    ProductsName.all,
    ProductsName.computers,
    ProductsName.smart_objects,
    ProductsName.smartphones,
    ProductsName.speakers,
    ProductsName.accessories
  ];
  List<Icons> icons=[
    Icons(icon: AllIcon.home),
    Icons(icon: AllIcon.search),
    Icons(icon: AllIcon.box),
    Icons(icon: AllIcon.person),
  ];
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Colors.white.withOpacity(0.99),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AllIcon.arrowBack),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 16.getW(), vertical: 24.getH()),
          child: Text(
            'Categories',
            style: AppTextStyle.interBold
                .copyWith(color: AppColors.c_0A1034, fontSize: 24.sp),
          ),
        ),
        Expanded(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.getW()),
              children: [
                ...List.generate(
                    categories.length,
                    (index) => Column(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 24.getW(),vertical: 28.getH()),
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r))),
                            onPressed: () {
                              products=categories[index].name;
                              list=[];
                              for(var i in models){
                                if(i.productsName.name==products){
                                  list.add(i);
                                }
                              }
                              if(list.isEmpty){
                                list=models;
                              }

                              Navigator.push(context,MaterialPageRoute(builder:(context){
                                return Products();
                              }));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categories[index].name,
                                  style: AppTextStyle.interSemiBold.copyWith(
                                      color: AppColors.c_0A1034, fontSize: 18.sp),
                                )
                              ],
                            )),
                        SizedBox(height: 16.getH(),)
                      ],
                    )),
              ]),
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
                (activeIndex==index)?AppColors.blue:AppColors.c_0A1034,BlendMode.srcIn),width: 18.getW(),height: 18.getH())))
          ],),
        )
      ]),
    );
  }
}


class Icons{
  String icon;
  Icons({required this.icon});
}