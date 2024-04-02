import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/screens/countries/currencies_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import '../../data/local/storage_repository.dart';


class CheckCubit extends Cubit<String> {
  CheckCubit() : super("");

  void createPassword(String pinCode) {
    if(StorageRepository.getString(key: 'pin_code').isEmpty){
      StorageRepository.setString(
        key: "pin_code",
        value: pinCode,
      );
    }
  }

  void toCheckPinCode(String pinCode, BuildContext context) {
    if (StorageRepository.getString(key: "pin_code") == pinCode) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CurrenciesScreen(),
        ),
      );
    }
    else if(StorageRepository.getString(key: 'pin_code').isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
            backgroundColor:Colors.red,
            content: Text('Password is not correct',style: AppTextStyle.interMedium.copyWith(
              color:AppColors.white,fontSize:22
            ),))
      );
    }
  }
}
