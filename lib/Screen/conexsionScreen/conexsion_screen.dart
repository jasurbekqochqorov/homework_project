import 'package:flutter/material.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';
import '../CreateAccount/create_account_screen.dart';
import '../Login/login_screen.dart';


class ConnextionScreen extends StatefulWidget {
  const ConnextionScreen({super.key});

  @override
  State<ConnextionScreen> createState() => _ConnextionScreenState();
}

class _ConnextionScreenState extends State<ConnextionScreen> {

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 32.getW()),
        child: Column(
          children: [
            Padding(padding:EdgeInsets.symmetric(vertical: 67.getH(),horizontal: 32.getW()),
              child: Text('Connextion',style: AppTextStyle.interBold.copyWith(
                  color: AppColors.white,fontSize: 24.getW()
              ),),),
            SizedBox(height: 150.getH(),),
            Container(
              width: double.infinity,
              child: TextButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const CreateAccountScreen();
                }));
              },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.getH()),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )
                  ),
                  child:Text('Create an account',style: AppTextStyle.interSemiBold.copyWith(
                      color: AppColors.c_0001FC,fontSize: 18.getW()
                  ),)),
            ),
            SizedBox(height: 32.getH(),),
            Container(
              width: double.infinity,
              child: TextButton(onPressed:(){},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.getH()),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AllIcon.google1,width: 25.getW(),height:25.getH(),),
                      SizedBox(width: 24.getW(),),
                      Text('Connect with Google',style: AppTextStyle.interSemiBold.copyWith(
                          color: AppColors.c_0001FC,fontSize: 18.getW()
                      ),)
                    ],)),
            ),
            SizedBox(height: 16.getH(),),
            Container(
              width: double.infinity,
              child: TextButton(onPressed:(){},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.getH()),
                      backgroundColor: AppColors.c_4157FF,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AllIcon.facebook1,width:13.getW(),height: 24.getH(),),
                      SizedBox(width: 24.getW(),),
                      Text('Connect with Facebook',style: AppTextStyle.interSemiBold.copyWith(
                          color: AppColors.white,fontSize: 18.getW()
                      ),)
                    ],)),
            ),
            SizedBox(height:40.getH(),),
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
            SizedBox(height: 40.getH(),),
            TextButton(onPressed: (){}, child:Text(
              'Skip for now',
              style: AppTextStyle.interSemiBold.copyWith(
                  color: AppColors.white, fontSize: 18.getW()),
            ))
          ],
        ),
      ),
    );
  }
}
