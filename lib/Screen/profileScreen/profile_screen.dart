import 'package:flutter/material.dart';
import 'package:homework12/Screen/profileScreen/widget/list_widget_profile.dart';
import 'package:homework12/Screen/profileScreen/widget/user_widget.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onTap!.call();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.white,),
          ),
        title: Text('Transfer',style: AppTextStyle.interMedium.copyWith(
          color: AppColors.white,fontSize: 24.getW()
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 27.getW(), right: 27.getW(), top: 52.getH()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 47.getH(),),
            Text('Form', style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_EEEEEE.withOpacity(0.8), fontSize: 20.getW()
            ),),
            SizedBox(height: 25.getH(),),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(vertical: 18.getH()),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.getW()),
                color: AppColors.c_7485B4,
              ),
              child: Column(children: [
                Text('Account', style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_F9F9F9, fontSize: 20.getW(),
                ),),
                SizedBox(height: 2.getH(),),
                Text('00342745928', style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_F9F9F9, fontSize: 16.getW(),
                ),)
              ],),
            ),
            SizedBox(height: 30.getH(),),
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
                SizedBox(width: 5.getW(),),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white
                  ),
                ),
                SizedBox(width: 5.getW(),),
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
            Text('To', style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_EEEEEE.withOpacity(0.8), fontSize: 20.getW()
            ),),
            SizedBox(height: 31.getH(),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ),
                  child: Container(
                    width: 52.getW(), height: 52.getH(),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFDBE3F8)
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                UserWidget(image: AllIcon.user1, title: 'Aliya',),
                UserWidget(image: AllIcon.user2, title: 'Calira',),
                UserWidget(image: AllIcon.user3, title: 'Bob',),
                UserWidget(image: AllIcon.user4, title: 'Samy',),
                UserWidget(image: AllIcon.user5, title: 'Sara',),
              ],),
            SizedBox(height: 43.getH(),),
            const ListWidgetProfile(title: 'Amount', subTitle: '\$0.00',),
            SizedBox(height: 21.getH(),),
            const ListWidgetProfile(title: 'Purpose', subTitle: 'Education',),
          ],),
      ),
    );
  }
}
