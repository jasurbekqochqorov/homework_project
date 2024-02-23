import 'package:flutter/material.dart';
import 'package:homework12/Screen/CreateAccount/widget/form_widget.dart';
import 'package:homework12/Screen/EmptyScreen/empty_screen.dart';
import 'package:homework12/data/local/storage_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../Login/login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Padding(
        padding:EdgeInsets.only(top: 67.getH()),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Create an account',style: AppTextStyle.interBold.copyWith(
                  color: AppColors.white,fontSize: 28.getW()
                ),),
                SizedBox(height: 127.getH(),),
                FormWidget(title: 'Full name',controller: nameController,),
                SizedBox(height:32.getH()),
                FormWidget(title: 'Emial',controller: emailController,),
                SizedBox(height:32.getH(),),
                FormWidget(title: 'Password',controller: passwordController,),
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
                        int k=0;
                     if(StorageRepository.getString(key:'password')!=passwordController.text && StorageRepository.getString(key:'email')!=emailController.text){
                       StorageRepository.setString(key:'name', value:nameController.text);
                       StorageRepository.setString(key:'email', value:emailController.text);
                       StorageRepository.setString(key:'password', value:passwordController.text);
                       k=1;
                       setState(() {});
                     }
                      (StorageRepository.getString(key:'email')==emailController.text && StorageRepository.getString(key:'password')==passwordController.text && k==1)?Navigator.push(context,MaterialPageRoute(builder: (context){
                        return const EmptyScreen();
                      })):ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Something is error",
                            textAlign: TextAlign.end, style: TextStyle(fontSize: 16.0, fontWeight:
                            FontWeight.bold),), duration: Duration(seconds: 2), backgroundColor: Colors.red,)
                      );
                      },
                      child:const Text('Validate')),
                ),
                SizedBox(height: 40.getH(),),
                TextButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return const LoginScreen();
                    }));
                  },
                  child: Text('Already have an account ? Login',style: AppTextStyle.interSemiBold.copyWith(
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
