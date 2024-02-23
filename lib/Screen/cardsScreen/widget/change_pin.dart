import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/color/color.dart';


class ChangePinWidget extends StatefulWidget {
  const ChangePinWidget({super.key, required this.image,required this.title});
  final String image;
  final String title;
  @override
  State<ChangePinWidget> createState() => _ChangePinWidgetState();
}

class _ChangePinWidgetState extends State<ChangePinWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.getW(),vertical: 17.getH()),
      child: Row(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:15.getW(),vertical: 13.getH()),
          width: 52.getW(),
          height: 52.getH(),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.c_6A6A6A
          ),
          child:SvgPicture.asset(widget.image,colorFilter: ColorFilter.mode(Color(0xFFDDDDDD),BlendMode.srcIn ),),
        ),
        SizedBox(width:16.getW(),),
        Text(widget.title,style: AppTextStyle.interMedium.copyWith(
          color: AppColors.c_EEEEEE,fontSize: 16.getW()
        ),),
        Spacer(),
        IconButton(onPressed:(){}, icon:Icon(Icons.arrow_forward_ios_outlined,color:Color(0xFFD1D1D1).withOpacity(0.6),))

      ],),
    );
  }
}
