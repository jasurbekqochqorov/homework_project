import 'package:flutter/material.dart';
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
         Center(
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
        )
    ],);
  }
}
