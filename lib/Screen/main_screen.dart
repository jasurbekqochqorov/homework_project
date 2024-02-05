import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/widget/list_widget.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../utils/extension/extension.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding:EdgeInsets.only(left: 34.getW(),right: 33.getW(),top: 98.getH()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Setting',style: AppTextStyle.interBold.copyWith(
                        fontSize: 32,color: AppColors.c_0D2333
                      ),),
                      SizedBox(height: 57.getH(),),
                      Text('Security',style: AppTextStyle.interBold.copyWith(
                        color: AppColors.c_0D2333,fontSize: 24
                      ),),
                      SizedBox(height: 29.getH(),),
                      ListTileWidget(icon: AllIcon.finger,title:'Activate Fingerprint',),
                      SizedBox(height: 14.getH(),),
                      ListTileWidget(icon:AllIcon.oclock,title: 'Change Transaction Pin',icon2: true,),
                      SizedBox(height: 57.getH(),),
                      Text('Notifications',style: AppTextStyle.interBold.copyWith(
                        color: AppColors.c_0D2333,fontSize: 24,
                      ),),
                      SizedBox(height: 20.getH(),),
                      ListTileWidget(title:'Credit Alerts', icon:AllIcon.ring),
                      SizedBox(height: 13.getH(),),
                      ListTileWidget(title:'Debit Alerts', icon:AllIcon.ring),
                      SizedBox(height: 13.getH(),),
                      ListTileWidget(title:'Broadcasts', icon:AllIcon.ring),
                      SizedBox(height: 49.getH(),),
                      Text('Appearance',style: AppTextStyle.interBold.copyWith(
                        color: AppColors.c_0D2333,fontSize: 24
                      ),),
                      SizedBox(height: 20.getH(),),
                      ListTileWidget(title:'Dark Theme', icon:AllIcon.ring,bool1: true,),
                      SizedBox(height: 100.getH(),),
                      Text('Log out',style: AppTextStyle.interBlack.copyWith(
                        color: AppColors.c_F02E54,fontSize: 18
                      ),),
                      SizedBox(height: 55.getH(),),
                  ],),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:32.getH(),bottom:11.getH()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              IconButton(onPressed:(){}, icon:SvgPicture.asset(AllIcon.home)),
              IconButton(onPressed:(){}, icon:SvgPicture.asset(AllIcon.line)),
              IconButton(onPressed:(){}, icon:SvgPicture.asset(AllIcon.scaner,)),
              IconButton(onPressed:(){}, icon:SvgPicture.asset(AllIcon.setting)),
            ],),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton(
        onPressed: (){},
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add_circle_outline_sharp,color: AppColors.white,),),
    );
  }
}
