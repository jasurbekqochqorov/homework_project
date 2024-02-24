import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';


class HomeListWidget extends StatefulWidget {
  const HomeListWidget({super.key, required this.icon,  required this.money, required this.title});
  final String icon;
  final String title;
  final String money;
  @override
  State<HomeListWidget> createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.getW(),vertical: 17.getH()),
      child: Row(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:13.getW(),vertical: 15.getH()),
          width: 52.getW(),
          height: 52.getH(),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.c_EEEEEE
          ),
          child:SvgPicture.asset(widget.icon,width: 25.getW(),height: 25.getH(),),
        ),
        SizedBox(width:16.getW(),),
        Text(widget.title,style: AppTextStyle.interMedium.copyWith(
          color: AppColors.c_EEEEEE,fontSize:16.getW(),
        ),),
        Spacer(),
        Text(widget.money,style: AppTextStyle.interMedium.copyWith(
            color: AppColors.c_EEEEEE,fontSize: 16.getW()
        ),)
      ],),
    );
  }
}
