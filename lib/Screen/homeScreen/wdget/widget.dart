import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';


class MoreWidget extends StatefulWidget {
  const MoreWidget({super.key, required this.image, required this.title,this.i=false});
  final String image;
  final String title;
  final bool? i;
  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 65.getW(),
            height: 65.getH(),
            padding: EdgeInsets.symmetric(
                horizontal: 24.getW(), vertical: 21.getH()),
            decoration: const BoxDecoration(
                color: AppColors.c_DBE3F8,
                shape: BoxShape.circle),
            child: SvgPicture.asset(widget.image,width: 33.getW(),height: 26.getH(),)),
        SizedBox(
          height: 19.getH(),
        ),
        Text(
          widget.title,
          style: AppTextStyle.interRegular.copyWith(
            color: AppColors.c_EEEEEE,
            fontSize: 16.getH(),
          ),
        )
      ],
    );
  }
}
