import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';


class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.getW(),vertical: 22.getH(),),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.getW()),
          color: AppColors.c_414A61
      ),
      child:Row(children: [
        Text('Make a Payment',style: AppTextStyle.interMedium.copyWith(
            color: AppColors.white,fontSize: 20.getW()
        ),),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('\$220',style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white,fontSize: 20.getW()
            ),),
            SizedBox(height: 3.getH(),),
            Text('Due: Feb 10, 2022',style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white.withOpacity(0.76),fontSize: 12.getW()
            ),)
          ],)
      ],),
    );
  }
}
