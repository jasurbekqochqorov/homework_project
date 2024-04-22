import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/screens/product_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/images/app_images.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

import '../utils/size/size_utils.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_333333,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 56.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 263.h,),
            SvgPicture.asset(AppImages.scaner),
            SizedBox(
              height:220.h,
            ),
            Text(
              'Go and enjoy our features for free and make your life easy with us.',
              textAlign: TextAlign.center,
              style: AppTextStyle.interMedium
                  .copyWith(color: AppColors.white, fontSize: 16.w),
            ),
             SizedBox(
              height: 35.h,
            ),
            SizedBox(
              width: width,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                      return const ProductScreen();
                    }));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: AppColors.c_FDB623
                  ),
                  child: Text(
                    "Let's Start",
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.c_333333,fontSize: 16.w
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
