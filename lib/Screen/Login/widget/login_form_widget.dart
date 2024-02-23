import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/color/color.dart';



class FormWidgetLogin extends StatefulWidget {
  const FormWidgetLogin({super.key, required this.title, required this.controller,});
  final String title;
  final TextEditingController controller;
  @override
  State<FormWidgetLogin> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidgetLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 47.getW()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.white,fontSize: 18.getW()
          ),),
          SizedBox(height: 8.getH(),),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8.getH(),horizontal: 16.getW()),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.getW()),
                    borderSide:BorderSide(width: 1,color: AppColors.white)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.getW()),
                    borderSide:BorderSide(width: 1,color: AppColors.white)
                ),
                hintText: widget.title,
                hintStyle: AppTextStyle.interRegular.copyWith(
                    color: AppColors.white,fontSize: 16.getW()
                )
            ),
          ),
        ],),
    );
  }
}
