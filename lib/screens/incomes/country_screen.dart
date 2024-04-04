import 'package:flutter/material.dart';
import 'package:homework12/data/models/country_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key, required this.incomesModel});
  final IncomesModel incomesModel;
  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country information',style: AppTextStyle.interMedium.copyWith(
          color: AppColors.white,fontSize: 16
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Country: ${widget.incomesModel.data[0].amount}",style: AppTextStyle.interMedium.copyWith(
            color: AppColors.black,fontSize: 18
          ),),
          const SizedBox(height:8,),
          Text("Capital:${widget.incomesModel.data[0].date}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
            const SizedBox(height:8,),
            Image.network(widget.incomesModel.data[0].sender.image)
        ],),
      ),
    );
  }
}
