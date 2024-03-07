import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/routes.dart';
import 'package:homework12/utils/color/color.dart';

import '../../utils/icons/icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _init()async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context,RouteNames.homeScreen);
    setState((){});
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body:Column(children: [
          Image.asset(AppImages.onSplash,fit: BoxFit.cover,),
          SizedBox(height: 15.h,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:27.w),
            child: Text("FIND THE BEST COFFEE FOR YOU",textAlign: TextAlign.center,style:Theme.of(context).textTheme.displaySmall),
          ),
          const Spacer(),
          TextButton(onPressed: (){
            Navigator.pushNamed(context,RouteNames.homeScreen);
          },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.blue.withOpacity(0.2),
                padding: EdgeInsets.symmetric(horizontal:32.w,vertical: 16.h),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )
              ),
              child:Text("Proceed",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18.sp,
              ),)),
          SizedBox(height: 64.h,),
        ],),
      ),
    );
  }
}
