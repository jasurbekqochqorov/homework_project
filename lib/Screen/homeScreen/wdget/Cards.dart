import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';


class Cards extends StatefulWidget {
  const Cards({super.key, required this.image, required this.card, required this.code, required this.money, required this.date});
  final String image;
  final String card;
  final String code;
  final String money;
  final String date;
  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.getW(),vertical: 17.getH()),
      child: Row(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:8.getW(),vertical: 20.getH()),
          width: 52.getW(),
          height: 52.getH(),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.c_EEEEEE
          ),
          child:Image.asset(widget.image,),
        ),
        SizedBox(width:16.getW(),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.card,style: AppTextStyle.interMedium.copyWith(
                color:AppColors.c_EEEEEE,fontSize: 16.getW()
            ),),
            SizedBox(height: 8.getH(),),
            Text(widget.code,style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_EEEEEE.withOpacity(0.6),fontSize:12.getW()
            ),)
          ],),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.money,style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_EEEEEE,fontSize:16.getW()
            ),),
            Text(widget.date,style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_EEEEEE.withOpacity(0.6),fontSize: 12.getW()
            ),)
          ],
        )
      ],),
    );
  }
}
