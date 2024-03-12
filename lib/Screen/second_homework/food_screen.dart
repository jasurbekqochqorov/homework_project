import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/second_homework/widget/information.dart';
import 'package:homework12/Screen/second_homework/widget/product.dart';
import 'package:homework12/Screen/second_homework/widget/widget.dart';
import 'package:homework12/data/model/product_model.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/icons/icon.dart';
import '../../utils/fonts/fonts.dart';
class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products=[
      ProductModel(title: 'Tempe', image:AllIcon.tempe,price:'20.000'),
      ProductModel(title: 'Chicken', image:AllIcon.chicken,price:'15.000'),
      ProductModel(title: 'Tempe', image:AllIcon.fruit,price: '20.000'),
      ProductModel(title: 'Chicken', image:AllIcon.vegetables,price: '15.000'),
      ProductModel(title: 'Tempe', image:AllIcon.spice,price: '20.000'),
      ProductModel(title: 'Chicken', image:AllIcon.ingridient,price: '15.000'),
      ProductModel(title: 'Tempe', image:AllIcon.sideDishes,price: '20.000'),
      ProductModel(title: 'Chicken', image:AllIcon.chicken,price: '15.000'),
    ];
    return  Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          // pinned: true,
          expandedHeight: 206.h,
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.7),
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsets.only(left: 24.w,right:24.h,top: 41.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        RichText(text:TextSpan(
                          text: 'Hello,',
                          style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.black,fontSize:18.sp
                          ),
                          children:[
                            TextSpan(
                              text: ' Fahmi\n',
                              style: AppTextStyle.interSemiBold.copyWith(
                                color:Colors.orange,fontSize:18.sp
                              ),
                            ),
                            TextSpan(
                              text:'Find the Right One For\nA Healthy Body',
                              style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.black,fontSize:18.sp
                              )
                            )
                          ]
                        )),
                        const Spacer(),
                        IconButton(
                            onPressed: (){},
                            style:IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                side: BorderSide(width: 1,color: Colors.orange.shade100)
                              ),
                              backgroundColor: AppColors.white
                            ),
                            icon:SvgPicture.asset(AllIcon.ring)),
                      ],),
                      SizedBox(height: 22.h,),
                      Row(children: [
                        Expanded(
                          flex: 9,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical:16.h),
                              fillColor: Colors.orange.shade50.withOpacity(0.3) ,
                                filled: true,
                                hintText:'Search',
                                hintStyle: AppTextStyle.interSemiBold.copyWith(
                                    color: Colors.black.withOpacity(0.3)
                                ),
                                prefixIcon: Icon(Icons.search,color: Colors.black.withOpacity(0.4),),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(width:1,color: Colors.orange.shade100)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide(width:1,color: Colors.orange.shade100)
                                )
                            ),
                          ),
                        ),
                        SizedBox(width:20.w,),
                        Expanded(
                          flex: 2,
                          child: IconButton(onPressed:(){},
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical:16.h),
                                backgroundColor:Colors.orange.shade50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                )
                              ),
                              icon:SvgPicture.asset(AllIcon.vector,width:18.w,height: 18.h,)),
                        )
                      ],),
                      SizedBox(height:16.h,),
                      Row(children: [
                        Text('Category',style: AppTextStyle.interSemiBold.copyWith(
                          color: AppColors.black,fontSize:16.sp
                        ),),
                        Spacer(),
                        Text('Show all',style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.black,fontSize:14.sp
                        ),),
                      ],),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: CategoriesFoodView(
          // pinned: true,
          onTap: (){},
        ),
        ),
        SliverList(
            delegate:
            SliverChildListDelegate([
              const InformationWidget()
            ]
        )),
        SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
        SliverGrid.count(
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          crossAxisCount: 2,
          childAspectRatio: 0.98,
          children: [
            ...List.generate(products.length, (index){
              return ProductWidget(image: products[index].image,title: products[index].title, price: products[index].price,i: index%2,);
            })
          ],
        )
      ],
    ),
    );
  }
}
