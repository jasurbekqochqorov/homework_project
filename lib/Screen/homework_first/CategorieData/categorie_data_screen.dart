import 'package:flutter/material.dart';
import 'package:homework12/data/models/categories/categories.dart';
import 'package:homework12/data/network_response.dart';
import 'package:homework12/data/repositories/categories_repository.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';


class CategoriesData extends StatefulWidget {
  const CategoriesData({super.key, required this.id});
  final int id;

  @override
  State<CategoriesData> createState() => _ProductState();
}

class _ProductState extends State<CategoriesData> {
  CategoriesRepository categoriesRepository =CategoriesRepository();
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
        future: categoriesRepository.getCategories(),
        builder: (
            BuildContext context,
            AsyncSnapshot<NetworkResponse> snapshot,) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<CategoriesModel>? categories =
            (snapshot.data as NetworkResponse).data as List<CategoriesModel>;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.getW()),
                      child: Image.network(categories[widget.id-1].imageUrl,fit: BoxFit.cover,width: 290.getW(),height:330.getH(),)),
                  SizedBox(height: 10.getH(),),
                  Text('Created at:${categories[widget.id-1].createdAt}',style: AppTextStyle.interSemiBold.copyWith(
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
