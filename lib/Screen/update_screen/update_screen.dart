
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/data/models/products_models.dart';
import 'package:homework12/data/repository/product_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.productModel, required this.onUpdate});
  final ProductModel productModel;
  final VoidCallback onUpdate;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  ProductsRepository productsRepository=ProductsRepository();
  final Color color=Colors.black;
  final TextEditingController nameController=TextEditingController();
  final TextEditingController imageController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Products"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            ProductModel productModel=ProductModel(
                color: color,
                description:descriptionController.text==""?widget.productModel.description:descriptionController.text,
                productName: nameController.text==""?widget.productModel.productName:nameController.text,
                imageUrl: imageController.text==""?widget.productModel.imageUrl:imageController.text,
                price:priceController.text==""?widget.productModel.price:double.parse(priceController.text),
                dateTime: DateTime.now(),
                productId:widget.productModel.productId);
            widget.onUpdate.call();
            setState(() {});
            Navigator.pop(context);
          }, icon: const Icon(Icons.check,))
        ],
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal:16.w,vertical:8.h),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20.h,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18.sp,
              ),
              controller: nameController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter other product name',
                contentPadding: EdgeInsets.symmetric(vertical:16.h,horizontal:10.w),
                // hintText: 'Enter product name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18.sp,
              ),
              textInputAction: TextInputAction.done,
              controller: priceController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter other product price',
                contentPadding: EdgeInsets.symmetric(vertical:16.h,horizontal:10.w),
                // hintText: 'Enter product price',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18.sp,
              ),
              textInputAction: TextInputAction.done,
              controller:imageController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter ohter product image address',
                contentPadding: EdgeInsets.symmetric(vertical:16.h,horizontal:10.w),
                // hintText: 'Enter product image address',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18.sp,
              ),
              textInputAction: TextInputAction.done,
              controller: descriptionController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter other product description',
                contentPadding: EdgeInsets.symmetric(vertical:16.h,horizontal:10.w),
                // hintText: 'Enter product description',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1.sp,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
