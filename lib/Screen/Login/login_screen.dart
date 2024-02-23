import 'package:flutter/material.dart';
import 'package:homework12/Screen/CreateAccount/widget/form_widget.dart';
import 'package:homework12/Screen/EmptyScreen/empty_screen.dart';
import 'package:homework12/Screen/Login/widget/login_form_widget.dart';
import 'package:homework12/data/local/storage_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../CreateAccount/create_account_screen.dart';
import '../Login/login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.only(top: 67.getH()),
          child: Center(
            child: Column(
              children: [
                Text('Login',style: AppTextStyle.interBold.copyWith(
                    color: AppColors.white,fontSize: 28.getW()
                ),),
                SizedBox(height: 215.getH(),),
                FormWidgetLogin(title: 'Emial',controller:emailController,),
                SizedBox(height:32.getH(),),
                FormWidgetLogin(title: 'Password', controller:passwordController,),
                SizedBox(height:32.getH(),),
                Container(
                  width: double.infinity,
                  margin:EdgeInsets.symmetric(horizontal: 32.getW()),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.getH()),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.getW()),
                          )
                      ),
                      onPressed:(){
                        if(emailController.text==StorageRepository.getString(key:'email') && passwordController.text==StorageRepository.getString(key:'password')){
                         Navigator.push(context,MaterialPageRoute(builder: (context){
                           return const EmptyScreen();
                         }));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Something is error${StorageRepository.getString(key:'email')}",
                                textAlign: TextAlign.end, style: TextStyle(fontSize: 16.0, fontWeight:
                                FontWeight.bold),), duration: Duration(seconds: 2), backgroundColor: Colors.red,)
                          );
                        }
                      },
                      child:Text('Validate')),
                ),
                SizedBox(height: 40.getH(),),
                TextButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return CreateAccountScreen();
                    }));
                  },
                  child: Text('Don’t have an account? Sign-up',style: AppTextStyle.interSemiBold.copyWith(
                      color:AppColors.c_FBDF00
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
