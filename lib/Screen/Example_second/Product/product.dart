import 'package:flutter/material.dart';
import 'package:homework12/data/network_response.dart';
import 'package:homework12/data/repositories/laptop_repository.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../data/models/laptop/laptop-model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';


class Product extends StatefulWidget {
  const Product({super.key, required this.id});
  final int id;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  LaptopRepository laptopRepository =LaptopRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_outlined,color: AppColors.black,),),
        title:Text('Product',style: AppTextStyle.interSemiBold.copyWith(
          color: AppColors.black,fontSize: 24.getW(),
        ),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: laptopRepository.getLaptops(),
        builder: (
            BuildContext context,
            AsyncSnapshot<NetworkResponse> snapshot,) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<LaptopModel>? laptops =
            (snapshot.data as NetworkResponse).data as List<LaptopModel>;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.getW()),
                      child: Image.network(laptops[widget.id-1].imageUrl,fit: BoxFit.cover,width: 290.getW(),height:330.getH(),)),
                  SizedBox(height: 10.getH(),),
                  Text('category id:${laptops[widget.id-1].categoryId}',style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.black,fontSize:25.getW(),
                  ),),
                  Text('Price:${laptops[widget.id-1].price}\$',style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.black,fontSize: 25.getW(),))
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
