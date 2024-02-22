import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/secondscreen/widget/widget.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../CreateAccount/create_account_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  List<OnBoard> onBoards=[
    OnBoard(title:'The best tech market', image:''),
    OnBoard(title:'A lot of exclusives', image:''),
    OnBoard(title:'Sales all the time', image:''),
    OnBoard(title:'Sales all the time', image:''),
  ];
  int activeIndex=1;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_0001FC,
        body: Column(children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              children:[
               ...List.generate(onBoards.length, (index) =>OnBoarding(title: onBoards[activeIndex-1].title,index:activeIndex-1,),),

              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 79.getH()),child:Column(children: [
            SizedBox(height: 41.getH(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:10.getW(),height: 10.getH(),
                  decoration:BoxDecoration(
                    color: (activeIndex==1)?AppColors.white:AppColors.black,
                    shape: BoxShape.circle,
                  ),),
                SizedBox(width: 5.getW(),),
                Container(
                  width:10.getW(),height: 10.getH(),
                  decoration:BoxDecoration(
                    color: (activeIndex==2)?AppColors.white:AppColors.black,
                    shape: BoxShape.circle,
                  ),),
                SizedBox(width: 5.getW(),),
                Container(
                  width:10.getW(),height: 10.getH(),
                  decoration:BoxDecoration(
                    color:(activeIndex==3)?AppColors.white:AppColors.black,
                    shape: BoxShape.circle,
                  ),),
                SizedBox(width: 5.getW(),),
                Container(
                  width:10.getW(),height: 10.getH(),
                  decoration:BoxDecoration(
                    color:(activeIndex==4)?AppColors.white:AppColors.black,
                    shape: BoxShape.circle,
                  ),),
              ],),
            SizedBox(height: 40.getH(),),
            TextButton(
              onPressed:(){
                activeIndex++;
                setState(() {});
                if(activeIndex==5){
                  Navigator.push(context,MaterialPageRoute(builder:(context){
                    return const CreateAccountScreen();
                  }));
                }
                },
              child:(activeIndex==4)?Text('Skip for now',style: AppTextStyle.interSemiBold.copyWith(
                  color: AppColors.white,fontSize: 18.getW()
              ),):
              Text('Next',style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.white,fontSize: 18.getW()
    ),),
            )
          ],),)
        ],),
      ),
    );
  }
}

class OnBoard{
   String title;
  String image;
  OnBoard({
    required this.title,
    required this.image,
});
}