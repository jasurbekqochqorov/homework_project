import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/Widget/selection_widget.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../models/models.dart';
import '../utils/fonts/fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex=-1;
  bool kl=false;
  List<Models> list=[
    Models(icon:AllIcon.person, title:'Profile', icon2:AllIcon.arrowForward),
    Models(icon:AllIcon.list, title:'Account Statement', icon2:AllIcon.arrowForward),
    Models(icon:AllIcon.headphone, title:'Support', icon2:AllIcon.arrowForward),
  ];

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding:EdgeInsets.only(top: 101.getH(),left: 26.getW(),bottom: 38.getH()),
          child:IconButton(onPressed: (){},
          icon:SvgPicture.asset(AllIcon.arrowBack),),
          ),
          Padding(padding:EdgeInsets.symmetric(horizontal:34.getW()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('About You',style: AppTextStyle.interBold.copyWith(
              color: AppColors.c_0D2333,fontSize: 32,
            ),),
            SizedBox(height: 24.getH(),),
            ...List.generate(list.length, (index) =>
                SelectionWidget(models:list[index],onTap: (){
                  activeIndex=index;
                  setState(() {
                  });
                  },k:activeIndex==index),)
          ],),)
        ],
      ),
    );
  }
}
