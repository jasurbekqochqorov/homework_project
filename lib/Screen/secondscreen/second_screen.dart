import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework12/Screen/conexsionScreen/conexsion_screen.dart';
import 'package:homework12/Screen/secondscreen/widget/widget.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../../data/local/storage_repository.dart';
import '../../utils/color/color.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<OnBoard> onBoards = [
    OnBoard(title: 'The best tech market', image: AllIcon.map),
    OnBoard(title: 'A lot of exclusives', image: AllIcon.computer),
    OnBoard(title: 'Sales all the time', image: AllIcon.percent),
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: AppColors.c_0001FC,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    onBoards.length,
                    (index) {
                      return OnBoarding(
                        title: onBoards[index].title,
                        index: index,
                        image: onBoards[index].image,
                      );
                    },
                  ),
                  Text('adsfa',style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.white,fontSize: 30
                  ),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 79.getH()),
              child: Column(
                children: [
                  SizedBox(
                    height: 41.getH(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10.getW(),
                        height: 10.getH(),
                        decoration: BoxDecoration(
                          color: (activeIndex == 1)
                              ? AppColors.white
                              : AppColors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 5.getW(),
                      ),
                      Container(
                        width: 10.getW(),
                        height: 10.getH(),
                        decoration: BoxDecoration(
                          color: (activeIndex == 2)
                              ? AppColors.white
                              : AppColors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 5.getW(),
                      ),
                      Container(
                        width: 10.getW(),
                        height: 10.getH(),
                        decoration: BoxDecoration(
                          color: (activeIndex == 3)
                              ? AppColors.white
                              : AppColors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.getH(),
                  ),
                  TextButton(
                    onPressed: () {
                      StorageRepository.setString(key: 'save', value: 'save');
                      setState(() {});
                      if (activeIndex == 3) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ConnextionScreen();
                        }));
                      }
                      if(activeIndex<3){
                        activeIndex++;
                      }
                    },
                    child: Text(
                            'Next',
                            style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.white, fontSize: 18.getW()),
                          ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoard {
  String title;
  String image;

  OnBoard({
    required this.title,
    required this.image,
  });
}
