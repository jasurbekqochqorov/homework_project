import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/data/models/my_responce.dart';
import 'package:homework12/data/models/products_models.dart';
import 'package:homework12/data/repository/product_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'about_prodcut/about_product.dart';
import 'add_screen/add_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    ProductsRepository productsRepository=ProductsRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.blue,
      appBar: AppBar(
        // backgroundColor: AppColors.blue,
        title: Text("Products",style: AppTextStyle.interRegular.copyWith(
          color: AppColors.blue,fontSize: 22.sp
        ),),
        elevation: 1,
        centerTitle:true,
      ),
      body:RefreshIndicator(
        color: AppColors.white,
        backgroundColor: AppColors.blue,
        onRefresh: () async{
          setState(() {});
        },
        child: FutureBuilder<MyResponse>(
          future: productsRepository.getAllProducts(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Text(snapshot.hasError.toString());
            }
            if(snapshot.hasData){
              List<ProductModel> products=(snapshot.data as MyResponse).data as List<ProductModel>;
              return GridView.count(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical:40.h),
                mainAxisSpacing:16.h,
                //vertically
                crossAxisSpacing:10.w,
                //horizontally
                crossAxisCount: 2,
                childAspectRatio:0.7,
                children: [

                  ...List.generate(
                    products.length,
                        (index) =>ZoomTapAnimation(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return AboutProductScreen(productModel: products[index],);
                            }));
                          },
                          child: Container(
                                              padding: EdgeInsets.only(left: 12.w),
                                              decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow:const[
                            BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0,4)
                            )
                          ],
                          color: AppColors.white,
                                              ),
                                              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:8.h,),
                            Center(child: Image.network(products[index].imageUrl,width: 100.w,height:110.h,)),
                            const Spacer(),
                            Text("name:${products[index].productName}",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,fontSize: 20.sp
                            ),),
                            SizedBox(height: 4.h,),
                            Text("Price:${products[index].price.toString()}",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,fontSize: 18.sp
                            ),),
                            SizedBox(height:10.h,)
                          ],),
                                            ),
                        ),
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: ()async{
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return AddScreen();
        }));
      },
        backgroundColor: AppColors.blue,
      child: const Icon(Icons.add,color: AppColors.white,),
      ),
    );
  }
}
//IconButton(onPressed: ()async{
//                           await productsRepository.deleteProducts(products[index].productId);
//                           setState(() {});
//                         }, icon: const Icon(Icons.delete,color: Colors.red,)),