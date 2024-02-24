import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/color/color.dart';
import '../../../utils/icons/icon.dart';


class SortWidget extends StatefulWidget {
  const SortWidget({super.key, required this.isHas, required this.icon, required this.title, required this.onTap, required this.active});
  final bool isHas;
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool active;

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:widget.onTap,
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.getW(),vertical: 12.getH()),
          backgroundColor: (widget.active)?AppColors.c_414A61:AppColors.c_414A61.withOpacity(0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.getW())
          )
      ),
      child:Row(children: [
        (widget.isHas)?SvgPicture.asset(widget.icon):SizedBox(width:1,),
        (widget.isHas)?SizedBox(width: 10.getW(),):SizedBox(width:1,),
        Text(widget.title,style: AppTextStyle.interMedium.copyWith(
          color: (widget.active)?AppColors.white:AppColors.white.withOpacity(0.5),
          fontSize: 16.getW()
        ),)
      ],),
    );
  }
}
