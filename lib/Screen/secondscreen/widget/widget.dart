import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key, required this.title, required this.index,});
  final String title;
  final int index;

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
          child: Text(widget.title,style: AppTextStyle.interBold.copyWith(
              color: AppColors.white,fontSize: 24.getW()
          ),),
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
                child: TextButton(onPressed:(){},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.getH()),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )
                    ),
                    child:Text('Create an account')),
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
                    child:Text('Connect with Google')),
              ),
              SizedBox(height: 16.getH(),),
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
                    child:Text('Connect with Facebook')),
              ),
              SizedBox(height:40.getH(),),
              Text('Already have an account ? Login'),
            ],
          ),
        ),
    ],);
  }
}
