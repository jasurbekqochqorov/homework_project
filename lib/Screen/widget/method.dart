import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../utils/color/color.dart';
import '../../utils/icons/icon.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1,color: AppColors.c_090F47.withOpacity(0.1))
        ),
        padding:EdgeInsets.symmetric(horizontal: 4.getW(),vertical: 5.getH()),
        child:Image.asset(widget.image,width: 32.getW(),height: 30.getH(),),
      ),
      SizedBox(width:16.getW(),),
      Text(widget.title),
      Spacer(),
      Radio(value:'', groupValue:'', onChanged:(v){})
    ],);
  }
}
