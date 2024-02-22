import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/secondscreen/second_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.c_0001FC,
        body: Padding(
          padding:EdgeInsets.only(top: 160.getH()),
          child: Column(children: [
            Padding(padding:EdgeInsets.symmetric(horizontal:99.getW()),
            child: Column(
              children: [
              Text('LATECH',style: AppTextStyle.interBold.copyWith(
                color: AppColors.white,fontSize: 42.getW()
              ),),
              Text('T E C H M A R K E T',style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,fontSize: 12.getW(),
              ),),
              SizedBox(height: 57.getH(),),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 33.getW(),vertical: 66.getH()),
                  decoration: BoxDecoration(
                    color: AppColors.c_0001FC,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF1F53E4),
                        AppColors.c_0001FC,
                      ]
                    ),
                    boxShadow:[
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.1),
                        offset: Offset(30,30),
                        blurRadius: 80,
                        spreadRadius: 0
                      ),
                      BoxShadow(
                          color:Colors.white.withOpacity(0.25),
                          offset: Offset(-30,30),
                          blurRadius: 80,
                          spreadRadius: 0
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(AllIcon.light,width: 148.getW(),height: 83.getH(),),
                ),
              )
            ],),),
            SizedBox(height:72.getH(),),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 32.getW()),
              child: TextButton(
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return SecondScreen();
                  }));
                },
                style:TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.getH()),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.getW()),
                  ),
                  backgroundColor: AppColors.white
                ),
                child: Center(child: Text('Let’s start',style: AppTextStyle.interSemiBold.copyWith(
                  color: AppColors.c_0001FC,fontSize: 18.getW(),
                ),)),
              ),
            ),
            SizedBox(height:73.getH()),
            Text('Skip for now',style: AppTextStyle.interRegular.copyWith(
              color: AppColors.white,fontSize: 18.getW()
            ),)
          ],),
        ),
      ),
    );
  }
}
