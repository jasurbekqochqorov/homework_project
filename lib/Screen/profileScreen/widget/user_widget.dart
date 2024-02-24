import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/color/color.dart';
import '../../../utils/icons/icon.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52.getW(),height:52.getH(),
          decoration: BoxDecoration(
              shape: BoxShape.circle
          ),
          child:Image.asset(widget.image,width: 52.getW(),height: 52.getH(),fit: BoxFit.cover,),
        ),
        SizedBox(height: 10.getH(),),
        Text(widget.title,style: AppTextStyle.interMedium.copyWith(
          color:AppColors.c_F9F9F9.withOpacity(0.85),fontSize: 12.getW()
        ),)
      ],
    );
  }
}
