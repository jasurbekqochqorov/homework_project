import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/homeScreen/wdget/Cards.dart';
import 'package:homework12/Screen/homeScreen/wdget/widget.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_414A61,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 27.getW(), vertical: 27.getH()),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Good morning',
                            style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.c_CECECE, fontSize: 18.getW()),
                          ),
                          Text(
                            'John Smith',
                            style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.c_F9F9F9, fontSize: 22.getW()),
                          )
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        AllIcon.picture,
                        width: 60.getW(),
                        height: 60.getH(),
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.getH(),
                  ),
                  Column(
                    children: [
                      Text(
                        '\$ 8,640.00',
                        style: AppTextStyle.interSemiBold.copyWith(
                          color: AppColors.c_F9F9F9,
                          fontSize: 26.getW(),
                        ),
                      ),
                      SizedBox(
                        height: 12.getH(),
                      ),
                      Text(
                        'Available Balance',
                        style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.c_8D8D8D, fontSize: 14.getW()),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25.getW(), vertical: 33.getH()),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MoreWidget(image:AllIcon.transfer, title:'Transfer'),
                            MoreWidget(image:AllIcon.transaction, title:'Bills'),
                            MoreWidget(image:AllIcon.phone, title:'Recharge'),
                            MoreWidget(image:AllIcon.more, title:'More'),
                          ],
                        ),
                        SizedBox(height: 39.getH(),),
                        Row(children: [
                          Text('More Cards',style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize: 20.getW()
                          ),),
                          Spacer(),
                          Text('View all',style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize:14.getW(),
                          ),),
                        ],),
                        SizedBox(height: 24.getH(),),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.c_292929,
                            borderRadius: BorderRadius.circular(20.getW(),),
                          ),
                          child: Column(children: [
                            Cards(image:AllIcon.visa,card: 'Visa Card',code: '**3245',money: "\$2,200",date: '01/24',),
                            Container(
                              height: 1,
                              width: width,color: AppColors.c_585858,
                            ),
                            Cards(image:AllIcon.visa2,card: 'Master Card',code: '**6339',money: "\$650",date: '04/24',),
                    
                          ],),
                        ),
                        SizedBox(height:25.getH(),),
                        Row(children: [
                          Text('Recent Transactions',style: AppTextStyle.interMedium.copyWith(
                              color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize: 20.getW()
                          ),),
                          Spacer(),
                          Text('View all',style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize:14.getW(),
                          ),),
                        ],),
                        SizedBox(height: 19.getH(),),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.c_292929,
                            borderRadius: BorderRadius.circular(20.getW(),),
                          ),
                          child: Column(children: [
                            Cards(image:AllIcon.visa,card: 'Visa Card',code: '**3245',money: "\$2,200",date: '01/24',),
                            Container(
                              height: 1,
                              width: width,color: AppColors.c_585858,
                            ),
                            Cards(image:AllIcon.visa2,card: 'Master Card',code: '**6339',money: "\$650",date: '04/24',),
                    
                          ],),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
