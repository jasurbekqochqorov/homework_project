import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:41,vertical:54),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(children: [
              InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding:const EdgeInsets.all(17),
                  decoration:BoxDecoration(
                  color: AppColors.blue,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Image.asset(AllIcon.menu,width: 14,height:14,),
                ),
              ),
              const Spacer(),
              Container(
                padding:const EdgeInsets.all(14),
                decoration:BoxDecoration(
                color: AppColors.blue,
                  borderRadius: BorderRadius.circular(16)
                ),
                child:Icon(Icons.more_horiz,size:20,),
              ),
            ],),
            Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 28,),
                    Container(
                      decoration: BoxDecoration(
                      color:AppColors.c_FFE1D5,
                       borderRadius: BorderRadius.circular(16)
                      ),
                      height: 186,
                    ),
                    SizedBox(height: 52,)
                  ],
                ),
                Positioned(
                  top:0,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                    Image.asset(AllIcon.flag1,width: 64,height: 64,),
                    SizedBox(height: 13,),
                    Text("395,42.00",style: AppTextStyle.interSemiBold.copyWith(
                      fontSize:34
                    ),),
                    SizedBox(height: 8,),
                    Text("US Dollars",style: AppTextStyle.interMedium.copyWith(
                      fontSize:16
                    ),),
                    const SizedBox(height: 23,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      Container(
                        width: 86,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.c_2A3256
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height:9,),
                            const Icon(Icons.north_east,color: AppColors.white,size:25,),
                            const SizedBox(height: 7,),
                            Text("Send",style: AppTextStyle.interSemiBold.copyWith(
                              fontSize: 16,color: AppColors.white
                            ),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 23,),
                        Container(
                          width: 86,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.c_2A3256
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height:9,),
                              const Icon(Icons.east,color: AppColors.white,size:25,),
                              const SizedBox(height: 7,),
                              Text("Convert",style: AppTextStyle.interSemiBold.copyWith(
                                  fontSize: 16,color: AppColors.white
                              ),)
                            ],
                          ),
                        ),
                    ],)
                  ],),
                )
              ],
            ),
            const SizedBox(height: 29,),
            Container(
              height: 73,
              padding:const EdgeInsets.symmetric(horizontal:17),
              decoration: BoxDecoration(
              color: AppColors.white,boxShadow: [
                BoxShadow(
                  blurRadius: 60,
                  color: AppColors.c_8A959E.withOpacity(0.25),
                  spreadRadius: 0,
                  offset: Offset(0,30)
                )
              ],
                borderRadius: BorderRadius.circular(7)
              ),
              child:Row(children: [
                Text("USD Transaction History",style:AppTextStyle.interSemiBold.copyWith(
                  fontSize: 16
                ),),
                const Spacer(),
                TextButton(onPressed:(){},
                    style:TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                     backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(16)
                      )
                    ),
                    child: const Icon(Icons.east,color: AppColors.white,)),
              ],),
            ),
            const SizedBox(height: 27,),
            Text("More Payment Methods",style: AppTextStyle.interSemiBold.copyWith(
                fontSize: 26
            ),),
            const SizedBox(height: 27,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              height: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.c_F5F6FA
              ),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                  color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 52,width:54,
                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                  child: Image.asset(AllIcon.flag2),
                ),
                const SizedBox(width: 13,),
                Text("British Pound",style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 18
                ),),
                const Spacer(),
                TextButton(onPressed:(){},
                    style:TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(10)
                        )
                    ),
                    child: const Icon(Icons.east,color: AppColors.blue,))
              ],),
            ),
              SizedBox(height: 19,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                height: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.c_F5F6FA
                ),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: 52,width:54,
                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                    child: Image.asset(AllIcon.flag1),
                  ),
                  const SizedBox(width: 13,),
                  Text("US Dollar",style: AppTextStyle.interSemiBold.copyWith(
                      fontSize: 18
                  ),),
                  const Spacer(),
                  TextButton(onPressed:(){},
                      style:TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(10)
                          )
                      ),
                      child: const Icon(Icons.east,color: AppColors.blue,))
                ],),
              ),
              SizedBox(height: 19,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                height: 84,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.c_F5F6FA
                ),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: 52,width:54,
                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                    child: Image.asset(AllIcon.flag3),
                  ),
                  const SizedBox(width: 13,),
                  Text("Euro",style: AppTextStyle.interSemiBold.copyWith(
                      fontSize: 18
                  ),),
                  const Spacer(),
                  TextButton(onPressed:(){},
                      style:TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(10)
                          )
                      ),
                      child: const Icon(Icons.east,color: AppColors.blue,))
                ],),
              ),
          ],),
        ),
      ),
    );
  }
}
