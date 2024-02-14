import 'package:flutter/material.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import 'Models/list.dart';



class Second extends StatefulWidget {
  const Second({super.key, required this.image, required this.name, required this.price});
  final String image;
  final String name;
  final String price;

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(widget.image)),
              SizedBox(height: 10,),
              Text('Nomi:'+widget.name,style: AppTextStyle.interMedium.copyWith(
                color: AppColors.blue,fontSize: 18
              ),),
              SizedBox(height: 10,),
              Text('Narxi: '+widget.price, style:AppTextStyle.interMedium.copyWith(
                  color: AppColors.blue,fontSize: 18
              ),),
            ],
          ),
        ),
    );
  }
}
