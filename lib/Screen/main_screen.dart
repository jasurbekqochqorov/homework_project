import 'package:flutter/material.dart';
import 'package:homework12/Screen/Storage/storage_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import 'Example_second/AllProducts/laptop_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding:EdgeInsets.only(left: 20.getW(),right: 20.getW(),top: 100.getH()),
        child: Column(children: [
          TextButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return const LaptopScreen();
              }));
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.blue,
              padding: EdgeInsets.symmetric(vertical: 10.getH()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )
            ),
            child: Center(child: Text('1-Button',style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.white,fontSize: 20.getW()
            ),),),
          ),
          SizedBox(height: 20.getH(),),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Storage();
              }));
            },
            style: TextButton.styleFrom(
                backgroundColor: AppColors.blue,
                padding: EdgeInsets.symmetric(vertical: 10.getH()),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )
            ),
            child: Center(child: Text('2-Button',style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,fontSize: 20.getW()
            ),),),
          ),

        ],),
      ),
    );
  }
}
