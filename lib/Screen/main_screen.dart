import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/data/models/my_responce.dart';
import 'package:homework12/data/models/products_models.dart';
import 'package:homework12/data/repository/product_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';


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
      appBar: AppBar(
        title: Text("Products",style: AppTextStyle.interRegular.copyWith(
          color: AppColors.black,fontSize: 20.sp
        ),),
        centerTitle:true,
      ),
      body:FutureBuilder<MyResponse>(
        future: productsRepository.getAllProducts(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text(snapshot.hasError.toString());
          }
          if(snapshot.hasData){
            List<ProductModel> products=(snapshot.data as MyResponse).data as List<ProductModel>;
            return GridView.count(crossAxisCount: 2,
              children: [
                ...List.generate(products.length, (index){
                  var product=products[index];
                  return Center(
                    child:Image.network(product.productName),
                  );
                })
              ],
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
