import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';


class FlightPlane extends StatelessWidget {
  const FlightPlane({super.key,this.isIcon=false, required this.labelText, required this.hinText});
  final bool?isIcon;
  final String labelText;
  final String hinText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        style: AppTextStyle.interRegular.copyWith(
          color: AppColors.black,fontSize: 12.sp
        ),
        decoration: InputDecoration(
          contentPadding:EdgeInsets.symmetric(vertical:9.getH(),horizontal:12.getW()),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.getW(),color:AppColors.c_E6E8E7),
                borderRadius: BorderRadius.circular(8.r)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.getW(),color:AppColors.c_E6E8E7),
                borderRadius: BorderRadius.circular(8.r)
            ),
            labelText:labelText,
            labelStyle: AppTextStyle.interLight.copyWith(
              color: AppColors.c_555555,fontSize: 12.sp
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon:(isIcon!)?IconButton(onPressed: (){},
              icon: SvgPicture.asset(AllIcon.list),):null,
            hintText:hinText,
          hintStyle: AppTextStyle.interRegular.copyWith(
            color: AppColors.black,fontSize: 14.sp,
          )
        ),
      ),
    );
  }
}
