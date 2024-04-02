import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/cubits/password/check_password.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';


class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({super.key});

  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Enter Password Screen',style: AppTextStyle.interMedium.copyWith(
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
              labelText: "Enter password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(width: 1,color: AppColors.black.withOpacity(0.6))
              )
            ),
          ),
          const SizedBox(height:40,),
          TextButton(onPressed: (){
            context.read<CheckPassword>().savePassword(context, passwordController.text);
          },
              style:TextButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Next',style: AppTextStyle.interSemiBold.copyWith(
                              color: AppColors.white,fontSize:24
                            ),),
                  const Icon(Icons.arrow_forward,color: AppColors.white,)
                ],
              ))
        ],),
      ),
    );
  }
}
