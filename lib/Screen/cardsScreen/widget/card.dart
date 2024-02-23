import 'package:flutter/material.dart';

import '../../../utils/color/color.dart';
import '../../../utils/extension/extension.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';


class VisaCard extends StatefulWidget {
  const VisaCard({super.key});

  @override
  State<VisaCard> createState() => _VisaCardState();
}

class _VisaCardState extends State<VisaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.getW()),
          gradient: LinearGradient(
              colors: [Color(0xFFA6D9E),Color(0xFFBECAF5)]
          )
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.getW(),vertical: 23.getH()),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(AllIcon.visa),
          ],),
        SizedBox(height:10.getH(),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('**** **** **** 3245 ',style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_031952.withOpacity(0.86),fontSize: 24.getW()
                ),),
                SizedBox(height: 8.getH(),),
                Text('Available Balance',style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.white.withOpacity(0.8)
                ),)
              ],),
          ],
        ),
        SizedBox(height:8.getH(),),
        Row(children: [
          Text('\$2,200',style: AppTextStyle.interMedium.copyWith(
            color: AppColors.white,fontSize: 20.getW(),
          ),),
          Spacer(),
          Text('01/24',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,fontSize:14.getW()
          ),)
        ],)
      ],),
    );
  }
}
