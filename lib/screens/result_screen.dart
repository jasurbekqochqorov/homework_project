import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/data/models/product_model.dart';
import 'package:homework12/screens/qr_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/images/app_images.dart';
import 'package:homework12/utils/size/size_utils.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'package:share_plus/share_plus.dart';


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.products, required this.globalKey});
  final ProductModel products;
  final GlobalKey globalKey;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new,color:AppColors.c_FDB623,),
        ),
        elevation: 0,
        backgroundColor: AppColors.c_333333.withOpacity(0.84),
      ),
      backgroundColor: AppColors.c_333333.withOpacity(0.84),
      body: Column(children: [
        SizedBox(height: 20.h,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.c_000000.withOpacity(0.2)
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          margin: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
        child: Column(children: [
          Row(children: [
            SvgPicture.asset(AppImages.scaner,width: 40.w,height: 40.h,),
            SizedBox(width: 20.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Data',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.white,fontSize: 16.w
              ),),
              SizedBox(height: 8.h,),
              Text(widget.products.description.substring(0,16),style: AppTextStyle.interRegular.copyWith(
                  color: AppColors.white,fontSize: 12.w
              ),),
            ],)
          ],),
          SizedBox(height: 20.h,),
          Container(width: width,color: AppColors.white.withOpacity(0.1),height: 1.h,),
          SizedBox(height: 20.h,),
          Text(widget.products.qrCode,style: AppTextStyle.interRegular.copyWith(
            color: AppColors.white,fontSize: 14.w
          ),),
          TextButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return QRScreen(product: widget.products,globalKey: widget.globalKey,);
            }));
          }, child:Text("show QR Code",style: AppTextStyle.interRegular.copyWith(
            color: AppColors.c_FDB623,fontSize: 14
          ),)),
        ],),
        ),
        SizedBox(height: 30.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(onPressed: ()async{
            final uri=widget.products.qrCode;
            // has its position and size after it's built.
            final box = context.findRenderObject() as RenderBox?;

            if (uri.isNotEmpty) {
              await Share.shareUri(
                Uri.parse(uri),
                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
              );
            }
          },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.c_FDB623,
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 14)
              ),
              child:const Icon(Icons.share,color: AppColors.c_000000,)),
          SizedBox(width: 30.w,),
            TextButton(onPressed: (){},
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.c_FDB623,
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 14)
              ),
              child:const Icon(Icons.copy,color: AppColors.c_000000,)),
        ],)
      ],),
    );
  }
}
