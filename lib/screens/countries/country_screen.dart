import 'package:flutter/material.dart';
import 'package:homework12/data/models/country_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key, required this.countryModel});
  final CountryModel countryModel;
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
          Text("Country: ${widget.countryModel.name}",style: AppTextStyle.interMedium.copyWith(
            color: AppColors.black,fontSize: 18
          ),),
          const SizedBox(height:8,),
          Text("Capital:${widget.countryModel.capital}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
            const SizedBox(height:8,),
          Text("Phone: ${widget.countryModel.phone}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
            const SizedBox(height:8,),
          Text("Code:${widget.countryModel.code}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
            const SizedBox(height:8,),
          Text("Currency: ${widget.countryModel.currency}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
            const SizedBox(height:8,),
          Text("continent code: ${widget.countryModel.continent.code}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
            const SizedBox(height:8,),
          Text("continent name: ${widget.countryModel.continent.name}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
            const SizedBox(height:8,),
          Text("emoji: ${widget.countryModel.emoji}",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black,fontSize: 18
          )),
        ],),
      ),
    );
  }
}
