import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding:EdgeInsets.only(left: 27.getW(),right: 27.getW(),top: 52.getH()),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(onPressed:(){}, icon:Icon(Icons.arrow_back_ios_new,color: AppColors.white,),),
            Text('Transfer',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,fontSize: 24.getW()
            ),),
            Text('\t\t\t\t\t\t'),
          ],),
            SizedBox(height: 47.getH(),),
              Text('Form',style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize: 20.getW()
              ),),
            SizedBox(height: 25.getH(),),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(vertical:18.getH()),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.getW()),
                color: AppColors.c_7485B4,
              ),
              child: Column(children: [
                Text('Account',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_F9F9F9,fontSize:20.getW(),
                ),),
                SizedBox(height: 2.getH(),),
                Text('00342745928',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_F9F9F9,fontSize: 16.getW(),
                ),)
              ],),
            ),
            SizedBox(height:  30.getH(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white
                ),
              )
            ],),
            SizedBox(height: 43.getH(),),
            Text('To',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.c_EEEEEE.withOpacity(0.8),fontSize:20.getW()
            ),),
            SizedBox(height: 31.getH(),),
            Row(children: [
              TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  )
                ),
                child: Container(
                  width: 52.getW(),height:52.getH(),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDBE3F8)
                  ),
                  child: Icon(Icons.add),
                ),
              ),
              Container(
                width: 52.getW(),height:52.getH(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
                child:Image.asset(AllIcon.user1,width: 52.getW(),height: 52.getH(),fit: BoxFit.cover,),
              ),
            ],)
        ],),
      ),
    );
  }
}
