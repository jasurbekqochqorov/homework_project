import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:provider/provider.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../../view_models/calculator_view_model.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({super.key, required this.number});
  final int number;
  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [...List.generate(3, (index){
      return Padding(padding: EdgeInsets.symmetric(horizontal:16.getW(),vertical:30.getH()),
          child:TextButton(onPressed: (){
            context.read<CalculatorViewModel>().number("${index+7}");
          },
            child:Text("${index+7}",style: AppTextStyle.interBold.copyWith(
                color: AppColors.black,fontSize:24.getW()
            ),),));
    })],);
  }
}
