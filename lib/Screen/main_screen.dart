import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/widget/flight.dart';
import 'package:homework12/Screen/widget/from_to.dart';
import 'package:homework12/Screen/widget/hot_offer.dart';
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
  List<Choose> list=[
    Choose(title:'One way'),
    Choose(title: 'Round'),
    Choose(title: 'Multi-city'),
  ];
  List<Menu> icons=[
    Menu(title:'Home', icon:AllIcon.menu),
    Menu(title: 'Booking', icon:AllIcon.list2),
    Menu(title:'Offer', icon:AllIcon.middle),
    Menu(title: 'Inbox', icon: AllIcon.email),
    Menu(title: 'Profile', icon:AllIcon.person)
  ];
  int activeIndex=-1;
  int activeIndex1=-1;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor:Colors.transparent
      ),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        AppColors.c_69E4F4,
                        AppColors.c_B6DCF3,
                        AppColors.c_B6DCF3,
                        AppColors.c_6CE3F4
                      ],
                        stops: [0.0, 0.3413, 0.6556, 1.0],)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.getW()),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.getW(), vertical: 3.getH()),
                              margin: EdgeInsets.only(
                                top: 28.getH(),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                color: AppColors.c_B6DCF3,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.25),
                                      spreadRadius: 0, blurRadius: 4, offset: Offset(0, 4))
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(AllIcon.picture,width:36.getW(),height: 36.getH(),),
                                  Text('Dinakaran',style: AppTextStyle.interSemiBold.copyWith(
                                    color: AppColors.white,fontSize: 16.sp
                                  ),),
                                  IconButton(onPressed:(){}, icon:SvgPicture.asset(AllIcon.ring))
                                  ],
                              ),
                            ),
                            SizedBox(height: 17.getH(),),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color:const Color(0xFF591B1B).withOpacity(0.05),
                                    blurRadius:10,
                                    spreadRadius: 0,
                                    offset:const Offset(0,5)
                                  )
                                ]
                              ),
                              padding:EdgeInsets.symmetric(horizontal: 2.getW(),vertical:2.getH()),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                ...List.generate(list.length, (index) =>
                                    TextButton(
                                      onPressed:(){
                                        activeIndex=index;
                                        setState(() {
                                        });
                                      },
                                  style:TextButton.styleFrom(
                                    backgroundColor:activeIndex==index?Color(0xFF88E0F3):AppColors.white,
                                      shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.r)
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal:20.getW(),vertical: 2.getH())
                                  ),
                                  child:Center(child:Text(list[index].title,style: AppTextStyle.interRegular.copyWith(
                                      color:activeIndex==index?AppColors.white:Color(0xFF999999),fontSize: 18.sp
                                  ),),),
                                ))
                              ],),
                            ),
                            SizedBox(height: 17.getH(),),
                            Stack(
                              children:[ Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: AppColors.white,
                                  boxShadow: [BoxShadow(
                                    color: AppColors.c_591B1B.withOpacity(0.05),
                                    blurRadius: 10,spreadRadius: 0,offset: Offset(0,5)
                                  )]
                                ),
                                padding: EdgeInsets.only(left: 15.getW(),top:20.getH(),right: 6.getW(),bottom:20.getH()),
                                child: Column(children: [
                                  FromTo(
                                    labelText:'From',
                                    icon: AllIcon.airPlane,
                                    hintText: 'CHENNAI',
                                  ),
                                  SizedBox(height: 20.getH(),),
                                  FromTo(
                                    labelText: 'To',
                                    icon:AllIcon.airPlane2,
                                    hintText:'BANGALORE',
                                  ),
                                  SizedBox(height: 20.getH(),),
                                  Row(children: [
                                    const FlightPlane(isIcon: true,labelText: 'Departure',hinText:'26/May/2023',),
                                    SizedBox(width: 16.getW(),),
                                    const FlightPlane(labelText: 'Return',hinText:'+ Add Return Date',),
                                  ],),
                                  SizedBox(height: 20.getH(),),
                                  Row(children: [
                                    const FlightPlane(labelText: 'Traveller',hinText:'1 Adult',),
                                    SizedBox(width: 16.getW(),),
                                    const FlightPlane(labelText: 'Class',hinText:'Economy',),
                                  ],),
                                  SizedBox(height: 25.getH(),),
                                  TextButton(
                                    onPressed: (){},
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColors.c_6FE2F4,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(50.r,),
                                     ),
                                    padding: EdgeInsets.symmetric(vertical: 7.getH()),),
                                    child: Center(child: Text('Search flights',style: AppTextStyle.interBold.copyWith(
                                      color: AppColors.white,fontSize: 18.sp,
                                    ),),),
                                  ),
                                ],),
                              ),
                              Positioned(
                                top:61.getH(),
                                right:18.getW(),
                                child:IconButton(onPressed: (){},
                                icon: SvgPicture.asset(AllIcon.internet,width:40.getW(),height:40.getH(),),),)]
                            ),
                            SizedBox(height: 23.getH(),),
                            Container(
                              height: 1.getH(),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(1.r),
                                boxShadow: [BoxShadow(
                                  color: AppColors.black.withOpacity(0.25),
                                  blurRadius: 4,spreadRadius: 0,offset: Offset(0,4)
                                )]
                              ),
                            ),
                            SizedBox(height: 19.getH(),),
                            Row(children: [
                              Text('Hot offer',style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.black,fontSize: 18.sp
                              ),),
                              Spacer(),
                              Text('See all',style: AppTextStyle.interRegular.copyWith(
                                color: AppColors.c_009FFF,fontSize: 14.sp
                              ),),
                            ],),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.getH(),),
                      SizedBox(height: 112.getH(),
                        child: ListView(
                          padding:EdgeInsets.symmetric(horizontal: 16.getW()),
                          scrollDirection: Axis.horizontal,
                          children: [
                            HotOffer(),
                            SizedBox(width: 16.getW(),),
                            HotOffer(),
                          ],
                        ),),
                      SizedBox(height: 40.getH(),),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.getW(),top:8.getH(),right: 16.getW()),
              decoration: const BoxDecoration(
                  color: AppColors.c_0085FF
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                ...List.generate(icons.length, (index) =>Column(children: [
                  IconButton(onPressed:(){
                    activeIndex1=index;
                    setState(() {});
                  }, icon:SvgPicture.asset(icons[index].icon,
                    colorFilter: ColorFilter.mode((activeIndex1==index)?AppColors.white:AppColors.white.withOpacity(0.65),BlendMode.srcIn),
                    width:24.getW(),height: 24.getH()
                    ,),),
                  Text(icons[index].title,style: AppTextStyle.interRegular.copyWith(
                    color: (activeIndex1==index)?AppColors.white:AppColors.white.withOpacity(0.65),fontSize: 12.sp
                  ),)
                ],))
                ],),
            )
          ],
        ),
      ),
    );
  }
}

class Choose{
  String title;
  Choose({required this.title});
}
class Menu{
  String icon;
  String title;
  Menu({required this.title,required this.icon});
}
