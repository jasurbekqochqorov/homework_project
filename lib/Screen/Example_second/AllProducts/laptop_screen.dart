import 'package:flutter/material.dart';
import 'package:homework12/Screen/Example_second/Product/product.dart';
import 'package:homework12/data/models/laptop/laptop-model.dart';
import 'package:homework12/data/repositories/laptop_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../data/network_response.dart';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({super.key});

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  final LaptopRepository laptopRepository =LaptopRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_outlined,color: AppColors.black,),),
        title:Text('All Products',style: AppTextStyle.interSemiBold.copyWith(
          color: AppColors.black,fontSize: 24.getW(),
        ),),
        centerTitle: true,
      ),
      body:FutureBuilder(
        future: laptopRepository.getLaptops(),
        builder: (
            BuildContext context,
            AsyncSnapshot<NetworkResponse> snapshot,
            ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<LaptopModel>? laptops =
            (snapshot.data as NetworkResponse).data as List<LaptopModel>;
            return ListView(
              children: List.generate(
                laptops.length,
                    (index) {
                  LaptopModel laptopModel = laptops[index];
                  return Padding(
                    padding:EdgeInsets.symmetric(horizontal:10.getW(),vertical:5.getH()),
                    child: ListTile(
                      tileColor: AppColors.white,
                        splashColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.getW()),
                      ),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return Product(id:laptopModel.id,);
                        }));
                      },
                      title:Row(children: [
                        Text('ID:'+laptopModel.id.toString(),style: AppTextStyle.interSemiBold.copyWith(
                          color: AppColors.black,fontSize:18.getW(),
                        ),),
                        SizedBox(width: 10.getW(),),
                        Text(laptopModel.name,
                        style: AppTextStyle.interSemiBold.copyWith(
                          color: AppColors.black,fontSize: 18.getW(),),
                        ),
                      ],)
                    ),
                  );
                },
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
