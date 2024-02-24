
import 'package:flutter/material.dart';
import 'package:homework12/Screen/TransactionsScreen/widet./sort_widget.dart';
import 'package:homework12/Screen/TransactionsScreen/widet/list_widget.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../../utils/color/color.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int active=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
            widget.onTap!.call();
          },
          icon: Icon(Icons.arrow_back_ios_new,color: AppColors.white,),
        ),
        backgroundColor: AppColors.black,
        title: Text('Transaction',style: AppTextStyle.interMedium.copyWith(
            color: AppColors.c_F9F9F9,fontSize: 24.getW()
        ),),
        centerTitle:true,
      ),
      backgroundColor: AppColors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 27.getW(),right: 27.getW()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 47.getH(),),
          Row(children: [
            Text('Recent',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize: 20.getW()
            ),),
            Spacer(),
            Text('Select Time Range',style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize: 14.getW()
            ),)
          ],),
          SizedBox(height: 22.getH(),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            SortWidget(isHas:false, icon:AllIcon.down, title:'All',onTap:(){
              active=1;
              setState(() {});
            },active: active==1,),
            SortWidget(isHas:true, icon:AllIcon.down, title:'Income',onTap:(){
              active=2;
              setState(() {});
            },active: active==2,),
            SortWidget(isHas:true, icon:AllIcon.top, title:'Expense',onTap:(){
              active=3;
              setState(() {});
            },active:active==3,),
          ],),
          SizedBox(height: 32.getH(),),
          Expanded(
            child: ListView(children: [
              Text('Today',style: AppTextStyle.interMedium.copyWith(color: AppColors.c_EEEEEE.withOpacity(0.8)),),
              SizedBox(height: 29.getH(),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.getW()),
                  color: AppColors.c_292929,
                ),
                child: Column(children: [
                  ListWidget(icon:AllIcon.box, money:'-\$200', title:'Grocery'),
                  Container(width: width,height: 1,color: AppColors.c_585858,),
                  ListWidget(icon:AllIcon.transaction, money:'-\$120', title:'IESCO Bill'),
                ],),
              ),
              SizedBox(height: 32.getH(),),
              Text('Yesterday',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_EEEEEE,fontSize: 20.getW()
              ),),
              SizedBox(height: 29.getH(),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.getW()),
                  color: AppColors.c_292929,
                ),
                child: Column(children: [
                  ListWidget(icon:AllIcon.transfer, money: '\$1,200', title:'Fund Transferred'),
                  Container(width: width,height: 1,color: AppColors.c_585858,),
                  ListWidget(icon:AllIcon.transaction, money:'-\$235', title:'Mobile Bill'),
                  Container(width: width,height: 1,color: AppColors.c_585858,),
                  ListWidget(icon:AllIcon.money, money:'-\$6,500', title:'Salary'),
                  Container(width: width,height: 1,color: AppColors.c_585858,),
                  ListWidget(icon:AllIcon.card, money:'-\$155', title:'Card Payment'),
                ],),
              ),
            ],),
          )
        ],),
      ),
    );
  }
}
