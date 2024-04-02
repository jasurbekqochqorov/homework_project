import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/cubits/password/check_password.dart';
import 'package:homework12/data/local/storage_repository.dart';
import 'package:homework12/screens/payme/home_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';


class ConfirmationPasswordScreen extends StatefulWidget {
  const ConfirmationPasswordScreen({super.key});

  @override
  State<ConfirmationPasswordScreen> createState() => _ConfirmationPasswordScreenState();
}

class _ConfirmationPasswordScreenState extends State<ConfirmationPasswordScreen> {
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back,color: AppColors.black,),),
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Confirm Password Screen',style: AppTextStyle.interMedium.copyWith(
            color: AppColors.black,fontSize:24
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24,vertical:40
        ),
        child: Column(children: [
          TextField(
            controller: passwordController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                labelText: "Enter again password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.6))
                )
            ),
          ),
          const SizedBox(height:40,),
          TextButton(onPressed: (){
            context.read<CheckPassword>().confirmPassword(context,passwordController.text);
          },
              style:TextButton.styleFrom(
                  backgroundColor: Colors.blue
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Save',style: AppTextStyle.interSemiBold.copyWith(
                      color: AppColors.white,fontSize:24
                  ),),
                ],
              ))
        ],),
      ),
    );
  }
}
