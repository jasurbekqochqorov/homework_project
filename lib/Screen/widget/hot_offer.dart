import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';


class HotOffer extends StatelessWidget {
  const HotOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      padding: EdgeInsets.only(right:16.getW()),
      child: Row(children: [
        SvgPicture.asset(AllIcon.picture1,height:112.getH(),),
        SizedBox(width: 16.getW(),),
        SizedBox(width: 130.getW(),
          child:Text('25% discount with mastercard',
            style:AppTextStyle.interSemiBold.copyWith(
                color: AppColors.black,fontSize: 16.sp
            ) ,),)
      ],),
    );
  }
}
