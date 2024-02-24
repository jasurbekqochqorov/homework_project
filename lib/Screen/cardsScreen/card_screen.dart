import 'package:flutter/material.dart';
import 'package:homework12/Screen/cardsScreen/widget/card.dart';
import 'package:homework12/Screen/cardsScreen/widget/change_pin.dart';
import 'package:homework12/Screen/cardsScreen/widget/payment_widget.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key,this.onTap});
  final VoidCallback? onTap;
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int activeIndex=0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              widget.onTap!.call();
            },
            icon: Icon(Icons.arrow_back_ios_new,color: AppColors.white,)),
        title: Text('My Cards',style: AppTextStyle.interMedium.copyWith(
            color: AppColors.c_F9F9F9,fontSize:24.getW()
        ),),
        backgroundColor: AppColors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 46.getH(),),
          SizedBox(
            height: 190.getH(),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:[
                ...List.generate(3, (index){
                  return const VisaCard();
                })
              ],),
          ),
          Padding(
            padding: EdgeInsets.only(left:26.getW(),right: 26.getW()),
            child: Column(
              children: [
                SizedBox(height: 19.getH(),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    width: 10,height: 10,
                    decoration: BoxDecoration(
                      color:(activeIndex==0)? AppColors.white:AppColors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                    Container(
                      width: 10,height: 10,
                      decoration: BoxDecoration(
                        color:(activeIndex==1)?AppColors.white:AppColors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 10,height: 10,
                      decoration: BoxDecoration(
                        color: (activeIndex==2)?AppColors.white:AppColors.black,
                        shape: BoxShape.circle,
                      ),
                    )
                ],),
                SizedBox(height: 33.getH(),),
                PaymentWidget(),
                SizedBox(height: 40.getH(),),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 36.getW()),
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.getW()),
                        color: AppColors.c_414A61
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.getH(),horizontal: 26.getW()),
                      child: Text('Settings',style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,fontSize: 16.getW(),
                      ),),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.getW()),
                          color: AppColors.c_414A61.withOpacity(0.5)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.getH(),horizontal: 16.getW()),
                      child: Text('Transactions',style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white.withOpacity(0.5),fontSize: 16.getW(),
                      ),),
                    ),
                  ],),
                ),
                SizedBox(height:35.getH(),),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.getW()),
                      color: AppColors.c_292929
                  ),
                  child: Column(children: [
                    ChangePinWidget(image:AllIcon.transaction, title:'View Statement',isActive: 1,),
                    Container(
                      width: width,height: 1,color: AppColors.c_585858,
                    ),
                    ChangePinWidget(image:AllIcon.pin, title:'Change Pin',isActive: 2,),
                    Container(
                      width: width,height: 1,color: AppColors.c_585858,
                    ),
                    ChangePinWidget(image:AllIcon.remote, title:'Remove Card',isActive: 3,),
                  ],),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
