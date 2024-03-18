import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> element = [
    AllIcon.C,
    AllIcon.present,
    AllIcon.remove,
  ];
  List<String> amallar=['/','x','-','+','='];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 124.getH(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.getW()),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "adfs",
                      style: AppTextStyle.interSemiBold.copyWith(fontSize: 24),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'afda',
                      style: AppTextStyle.interBold.copyWith(fontSize: 32),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.getH(),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.getW()),
                  topRight: Radius.circular(20.getW()),
                ),
                color: const Color(0xFFE9F6FF)),
            child: Row(children: [
              Column(children: [
                Row(children: [...List.generate(element.length, (index){
                  return Padding(padding: EdgeInsets.symmetric(horizontal:16.getW(),vertical:30.getH()),
                      child:TextButton(onPressed: (){},
                        child: SvgPicture.asset(element[index],width:25.getW(),height: 25.getH(),),));
                })],),
                Row(children: [...List.generate(3, (index){
                  return Padding(padding: EdgeInsets.symmetric(horizontal:16.getW(),vertical:30.getH()),
                      child:TextButton(onPressed: (){},
                        child:Text("${index+7}",style: AppTextStyle.interBold.copyWith(
                          color: AppColors.black,fontSize:24.getW()
                        ),),));
                })],),
                Row(children: [...List.generate(3, (index){
                  return Padding(padding: EdgeInsets.symmetric(horizontal:16.getW(),vertical:30.getH()),
                      child:TextButton(onPressed: (){},
                        child:Text("${index+4}",style: AppTextStyle.interBold.copyWith(
                          color: AppColors.black,fontSize:24.getW()
                        ),),));
                })],),
                Row(children: [...List.generate(3, (index){
                  return Padding(padding: EdgeInsets.symmetric(horizontal:16.getW(),vertical:30.getH()),
                      child:TextButton(onPressed: (){},
                        child:Text("${index+1}",style: AppTextStyle.interBold.copyWith(
                          color: AppColors.black,fontSize:24.getW()
                        ),),));
                })],),
                Padding(padding: EdgeInsets.symmetric(vertical:30.getH()),child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (){

                      },
                      child: Text('.',style: AppTextStyle.interBold.copyWith(
                          fontSize: 30
                      ),),
                    ),
                    SizedBox(width:32.getW(),),
                    TextButton(
                      onPressed: (){

                      },
                      child: Text('0',style: AppTextStyle.interBold.copyWith(
                          fontSize: 30
                      ),),
                    ),
                    SizedBox(width:32.getW(),),
                    TextButton(onPressed: (){

                    },child: SvgPicture.asset(AllIcon.watch))
                  ],),)],),
              Column(children: [
                ...List.generate(amallar.length, (index){
                  return Padding(padding: EdgeInsets.symmetric(horizontal:16.getW(),vertical:29.getH()),
                      child:TextButton(onPressed: (){

                      },
                        child:Text(amallar[index],style: AppTextStyle.interBold.copyWith(fontSize:25.getW(),color: Colors.blue),),));
                })
              ],)
            ],),
          ))
        ],
      ),
    );
  }
}
