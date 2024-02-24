import 'package:flutter/material.dart';
import 'package:homework12/Screen/TransactionsScreen/widet./sort_widget.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../../utils/color/color.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: EdgeInsets.only(left: 27.getW(),right: 27.getW(),top:46.getH()),
        child: Column(children: [
          Center(child: Text('Transaction',style: AppTextStyle.interMedium.copyWith(
            color: AppColors.c_F9F9F9,fontSize: 24.getW()
          ),),),
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
            SortWidget(isHas:false, icon:AllIcon.down, title:'All',onTap:(){}),
            SortWidget(isHas:true, icon:AllIcon.down, title:'Income'),
            SortWidget(isHas:true, icon:AllIcon.top, title:'Expense'),
          ],)
        ],),
      ),
    );
  }
}
