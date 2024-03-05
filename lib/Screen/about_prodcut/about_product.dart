import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/data/models/products_models.dart';
import 'package:homework12/data/repository/product_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

class AboutProductScreen extends StatefulWidget {
  const AboutProductScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<AboutProductScreen> createState() => _AboutProductScreenState();
}

class _AboutProductScreenState extends State<AboutProductScreen> {
  ProductsRepository productsRepository=ProductsRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios,color: AppColors.blue,),
        ),
        title:Text("About product",style: AppTextStyle.interMedium.copyWith(
          color: AppColors.blue,fontSize: 22.sp
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder:(context){
              return AlertDialog(
                title: Text("Would you like to delete this product",style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.black,fontSize:18.sp
                ),),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child:Text("No",style:AppTextStyle.interMedium.copyWith(
                      color: AppColors.black,fontSize:18.sp
                  ),)),
                  TextButton(onPressed: ()async{
                    await productsRepository.deleteProducts(widget.productModel.productId);
                    setState(() {});
                    Navigator.pop(context);
                    Navigator.pop(context);
                    setState(() {});
                    }, child:Text("Yes",style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.black,fontSize:18.sp
                  ),)),
                ],
              );
            });
            setState(() {});
          }, icon:const Icon(Icons.delete,color: Colors.red,)),
        ],
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal:16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical:20.h),
              child: Image.network(widget.productModel.imageUrl)),
          SizedBox(height: 20.h,),
          RichText(
            text:TextSpan(
              text:"Name: ",
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:20.sp
              ),
              children: [
                TextSpan(
                  text: widget.productModel.productName,
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_FFC000,fontSize:20.sp
                  )
                )
              ]
            )
          ),
            SizedBox(height:10.h,),
            RichText(
                text:TextSpan(
                    text:"Price: ",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.black,fontSize:20.sp
                    ),
                    children: [
                      TextSpan(
                          text: "${widget.productModel.price}\$",
                          style: AppTextStyle.interMedium.copyWith(
                              color: AppColors.c_FFC000,fontSize:20.sp
                          )
                      )
                    ]
                )
            ),
            SizedBox(height:10.h,),
            RichText(
                text:TextSpan(
                    text:"Description: ",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.black,fontSize:20.sp
                    ),
                    children: [
                      TextSpan(
                          text: widget.productModel.description,
                          style: AppTextStyle.interMedium.copyWith(
                              color: AppColors.c_FFC000,fontSize:20.sp
                          )
                      )
                    ]
                )
            ),
        ],),
      ),
    );
  }
}