
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nt_ten/screens/country_screen/country_screen.dart';
import 'package:flutter_nt_ten/screens/user_screen/user_screen.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const CountryScreen();
            }));
          },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical:16),
                  backgroundColor:Colors.blue
              ),
              child: Text("Countries",style: AppTextStyle.interSemiBold.copyWith(
            color:AppColors.white,fontSize:20))),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const UserScreen();
            }));
            },
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical:16),
                backgroundColor:Colors.blue
              ),
              child:Text("Users",style: AppTextStyle.interSemiBold.copyWith(
                color:AppColors.white,fontSize:20
              ),)),
        ),
      ],
      ),),
    );
  }
}
