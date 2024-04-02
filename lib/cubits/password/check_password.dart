

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/storage_repository.dart';
import '../../screens/payme/home_screen.dart';
import '../../screens/payme/register/comfirmation_password_screen.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class CheckPassword extends Cubit<String>{
  CheckPassword():super("");


  enterPassword(String value){
    emit(value);
  }

  void savePassword(BuildContext context,String password){
    if(password.isNotEmpty && password.length==4 ){
      StorageRepository.setString(key: 'password', value:password);
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return const ConfirmationPasswordScreen();
      }));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor:Colors.red,
              content:Text('Password not entered or error',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.white,fontSize:20
              ),)));
    }
  }

  void confirmPassword(BuildContext context,String password){
    if(StorageRepository.getString(key: 'password')==password)
    {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor:Colors.green,
              content: Text('Password saved')));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const HomeScreen();
      }));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: SnackBar(content: Text('Password is not correct'),)));
    }
  }
}
