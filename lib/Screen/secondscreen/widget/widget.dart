import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/CreateAccount/create_account_screen.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key, required this.title, required this.index, required this.image,});
  final String title;
  final int index;
  final String image;

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.index!=3) Center(
          child: SizedBox(
            height: 480.getH(),
            child: Column(
              children: [
                Image.asset(widget.image,width:467.getW(),height:410.getH()),
                Spacer(),
                Text(widget.title,style: AppTextStyle.interBold.copyWith(
                    color: AppColors.white,fontSize: 24.getW()
                ),),
              ],
            ),
          ),
        ) else Padding(
          padding:EdgeInsets.symmetric(horizontal: 32.getW()),
          child: Column(
            children: [
              Padding(padding:EdgeInsets.symmetric(vertical: 67.getH()),
              child: Text('Connextion',style: AppTextStyle.interBold.copyWith(
                color: AppColors.white,fontSize: 24.getW()
              ),),),
              SizedBox(height: 150.getH(),),
              Container(
                width: double.infinity,
                child: TextButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CreateAccountScreen();
                  }));
                },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.getH()),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )
                    ),
                    child:Text('Create an account',style: AppTextStyle.interSemiBold.copyWith(
                      color: AppColors.c_0001FC,fontSize: 18.getW()
                    ),)),
              ),
              SizedBox(height: 32.getH(),),
              Container(
                width: double.infinity,
                child: TextButton(onPressed:(){},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.getH()),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image.asset(AllIcon.google1,width: 25.getW(),height:25.getH(),),
                      SizedBox(width: 24.getW(),),
                      Text('Connect with Google',style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.c_0001FC,fontSize: 18.getW()
                      ),)
                    ],)),
              ),
              SizedBox(height: 16.getH(),),
              Container(
                width: double.infinity,
                child: TextButton(onPressed:(){},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.getH()),
                        backgroundColor: AppColors.c_4157FF,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image.asset(AllIcon.facebook1,width:13.getW(),height: 24.getH(),),
                      SizedBox(width: 24.getW(),),
                        Text('Connect with Facebook',style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.white,fontSize: 18.getW()
                      ),)
                    ],)),
              ),
              SizedBox(height:40.getH(),),
              Text('Already have an account ? Login',style: AppTextStyle.interSemiBold.copyWith(
                color:AppColors.c_FBDF00
              ),),
            ],
          ),
        ),
    ],);
  }
}
