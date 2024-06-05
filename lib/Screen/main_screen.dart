import 'package:flutter/material.dart';
import 'package:homework12/data/models/category_model.dart';
import 'package:homework12/data/models/product_model.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex=0;
  int active=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Category",style: AppTextStyle.interMedium.copyWith(
          color: AppColors.black,fontSize:24
        ),),
      ),
      body:Column(
        children: [
          const SizedBox(height: 20,),
          SizedBox(
            height: 40,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              children:List.generate(categories.length, (index){
                return Container(
                    margin:const EdgeInsets.symmetric(horizontal:6),
                    child: TextButton(onPressed:(){},
                        style: TextButton.styleFrom(
                          backgroundColor:(active==index+1)?Colors.orange:Colors.orange.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal:10)
                        ),
                        child:Text(categories[index].name,style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.c_9A9A9A,fontSize:16
                        ),)));
              }),
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int index) {
            active=products[index].crId;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color:AppColors.white
              ),
              margin: const EdgeInsets.symmetric(horizontal: 34,vertical:8),
              width: double.infinity,
              child:Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products[index].name,style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.black,fontSize: 25
                      ),),
                      Text("${products[index].price}\$",style: AppTextStyle.interMedium.copyWith(
                          color:Colors.orange,fontSize:16
                      ),)
                    ],),
                  const Spacer(),
                  Image.network(products[index].imageUrl,width: 80,height:80,fit: BoxFit.cover,),
                ],
              ),
            );
          },
            itemCount: products.length,
          ))
        ],
      ),
    );
  }
}
