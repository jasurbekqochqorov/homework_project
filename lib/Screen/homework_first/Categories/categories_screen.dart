import 'package:flutter/material.dart';
import 'package:homework12/Screen/homework_first/CategorieData/categorie_data_screen.dart';
import 'package:homework12/data/models/categories/categories.dart';
import 'package:homework12/data/repositories/categories_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/network_response.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<CategoriesScreen> {
  final CategoriesRepository categoriesRepository = CategoriesRepository();

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
          'Categories',
          style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.black,
            fontSize: 24.getW(),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: categoriesRepository.getCategories(),
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
            List<CategoriesModel>? categories =
                (snapshot.data as NetworkResponse).data
                    as List<CategoriesModel>;
            return GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 15.getW(),vertical: 30.getH()),
                scrollDirection: Axis.vertical,
                primary: false,
                crossAxisSpacing: 10.getW(),
                mainAxisSpacing: 10.getH(),
                childAspectRatio:0.7,
                crossAxisCount:2,
                children:[
                  ...List.generate(categories.length, (index){
                    CategoriesModel categoriesModel=categories[index];
                    return ZoomTapAnimation(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return CategoriesDataScreen(id:categoriesModel.id);
                          }));
                        },
                      child: Container(
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
                          Text("ID:${categoriesModel.id.toString()}",style: AppTextStyle.interSemiBold.copyWith(
                            color:AppColors.black,fontSize:18.getW()
                          ),),
                          Image.network(categoriesModel.imageUrl,width: 180.getW(),height:100.getH(),),
                          const Spacer(),
                            Text(categoriesModel.name,style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.blue,fontSize: 20.getW()
                          ),),
                          Text("created at: ${categoriesModel.createdAt}",style: AppTextStyle.interSemiBold.copyWith(
                            color:Colors.orange
                          ),)
                        ],),
                      ),
                    );
                  })

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
