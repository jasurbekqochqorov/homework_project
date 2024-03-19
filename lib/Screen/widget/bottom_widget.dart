import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:provider/provider.dart';

import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';
import '../../view_models/calculator_view_model.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical:30.getH()),child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: (){
            context.read<CalculatorViewModel>().number('.');
          },
          child: Text('.',style: AppTextStyle.interBold.copyWith(
              fontSize: 30
          ),),
        ),
        SizedBox(width:32.getW(),),
        TextButton(
          onPressed: (){
            context.read<CalculatorViewModel>().number('0');
          },
          child: Text('0',style: AppTextStyle.interBold.copyWith(
              fontSize: 30
          ),),
        ),
        SizedBox(width:32.getW(),),
        TextButton(onPressed: (){

        },child: SvgPicture.asset(AllIcon.watch))
      ],),);
  }
}
