import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/models/models.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../utils/color/color.dart';
import '../../utils/icons/icon.dart';


class SelectionWidget extends StatefulWidget {
  const SelectionWidget({super.key, required this.models,required this.k, required this.onTap});
 final Models models;
 final bool k;
 final VoidCallback onTap;
  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:20.getH()),
      child: TextButton(
          style:TextButton.styleFrom(
              backgroundColor:widget.k?AppColors.blue:AppColors.white,
              padding: EdgeInsets.symmetric(vertical:19.getH(),horizontal: 23.getH()),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side:BorderSide(width:3,color:widget.k?AppColors.blue:AppColors.black)
              )
          ),
          onPressed:widget.onTap,
          child:Row(children: [
            SvgPicture.asset(widget.models.icon,colorFilter:ColorFilter.mode(widget.k?AppColors.white:AppColors.black,BlendMode.srcIn),),
            SizedBox(width: 34.getW(),),
            Text(widget.models.title,style: AppTextStyle.interRegular.copyWith(
              color:widget.k?AppColors.white:AppColors.black
            ),),
            Spacer(),
            SvgPicture.asset(widget.models.icon2,colorFilter:ColorFilter.mode(widget.k?AppColors.white:AppColors.black,BlendMode.srcIn)),
          ],)),
    );
  }
}
