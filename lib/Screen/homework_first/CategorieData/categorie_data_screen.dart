import 'package:flutter/material.dart';
import 'package:homework12/data/models/laptop/laptop-model.dart';
import 'package:homework12/data/repositories/laptop_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import '../../../data/network_response.dart';

class CategoriesDataScreen extends StatefulWidget {
  const CategoriesDataScreen({super.key, required this.id});
  final int id;
  @override
  State<CategoriesDataScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<CategoriesDataScreen> {
  final LaptopRepository laptopRepository=LaptopRepository();
  final List<LaptopModel> products=[];

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.black,
          ),
        ),
        title: Text(
          'Products',
          style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.black,
            fontSize: 24.getW(),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
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
            (snapshot.data as NetworkResponse).data
            as List<LaptopModel>;
            for(int i=0; i<laptops.length; i++){
              if(laptops[i].categoryId==widget.id){
                products.add(laptops[i]);
              }
            }
            return GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 15.getW(),vertical: 30.getH()),
                scrollDirection: Axis.vertical,
                primary: false,
                crossAxisSpacing: 10.getW(),
                mainAxisSpacing: 10.getH(),
                childAspectRatio:0.75,
                crossAxisCount:2,
                children:[
                  ...List.generate(products.length, (index){
                    // print()
                    LaptopModel laptopModel=products[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal:8.getW(),vertical: 10.getH()),
                        width:width,
                        height: height,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow:const[
                              BoxShadow(
                                  offset: Offset(0,1),
                                  spreadRadius: 0,
                                  blurRadius: 2
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.getW())
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ID:${laptopModel.id.toString()}",style: AppTextStyle.interSemiBold.copyWith(
                                color:AppColors.black,fontSize:18.getW()
                            ),),
                            Image.network(laptopModel.imageUrl,width: 180.getW(),height:100.getH(),),
                            const Spacer(),
                            Text(laptopModel.name,style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.blue,fontSize: 20.getW()
                            ),),
                            Text("Price:${laptopModel.price.toString()}\$",style: AppTextStyle.interSemiBold.copyWith(
                                color:Colors.orange
                            ),)
                          ],),
                      );
                    }
                  )

                ]);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
