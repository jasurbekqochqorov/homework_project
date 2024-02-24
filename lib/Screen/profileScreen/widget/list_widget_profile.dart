import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';




class ListWidgetProfile extends StatefulWidget {
  const ListWidgetProfile({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  State<ListWidgetProfile> createState() => _ListWidgetProfileState();
}

class _ListWidgetProfileState extends State<ListWidgetProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(widget.title,style: AppTextStyle.interMedium.copyWith(
          color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize: 18.getW()
      ),),
      SizedBox(height: 35.getH(),),
      Text(widget.subTitle,style: AppTextStyle.interMedium.copyWith(
        color: AppColors.white,fontSize: 20.getW(),
      ),),
      SizedBox(height: 15.getH(),),
      Container(
        height: 1,width: width,color: AppColors.c_626262,
      ),
    ],);
  }
}
