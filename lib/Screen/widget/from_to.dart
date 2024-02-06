import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';

class FromTo extends StatefulWidget {
  const FromTo({super.key});

  @override
  State<FromTo> createState() => _FromToState();
}

class _FromToState extends State<FromTo> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(8.r),
            borderSide: BorderSide(width: 1.getW(),color:AppColors.c_E6E8E7)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(8.r),
            borderSide: BorderSide(width: 1.getW(),color:AppColors.c_E6E8E7)
        ),
        labelText:'From',
        prefixIcon:IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(AllIcon.airPlane,width: 20.getW(),height: 20.getH(),)),
        hintStyle: AppTextStyle.interSemiBold.copyWith(
          fontSize: 16,
        ),
        // contentPadding:EdgeInsets.symmetric(vertical:20),
      ),
    );
  }
}
