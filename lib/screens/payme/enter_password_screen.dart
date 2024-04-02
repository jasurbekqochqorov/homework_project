import 'package:flutter/material.dart';
import 'package:homework12/data/local/storage_repository.dart';
import 'package:homework12/screens/payme/register/comfirmation_password_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';



class CheckPasswordScreen extends StatefulWidget {
  const CheckPasswordScreen({super.key});

  @override
  State<CheckPasswordScreen> createState() => _CheckPasswordScreenState();
}

class _CheckPasswordScreenState extends State<CheckPasswordScreen> {
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
            if(passwordController.text.isNotEmpty){
              StorageRepository.setString(key: 'password', value:passwordController.text);
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return const ConfirmationPasswordScreen();

              }));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                      backgroundColor:Colors.red,
                      content:Text('Password not entered',style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,fontSize:20
                      ),)));
            }

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
