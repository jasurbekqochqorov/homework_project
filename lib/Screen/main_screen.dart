import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'messagescreen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int active=0;
  double width=0;
  double height=0;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      body:Stack(children: [
        Image.network("https://t4.ftcdn.net/jpg/01/26/08/21/360_F_126082169_KlqWhWjl4QZRtrt9TzwZLt8U8qcBfrsq.jpg",width:width,height: height,fit:BoxFit.fill,),
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical:15,horizontal:27),
            child: Column(children: [
              // Row(children: [
              //   Text("Jasurbek Flutter",style: AppTextStyle.interBold.copyWith(
              //       color: AppColors.white,fontSize: 25
              //   ),),
              //   const Spacer(),
              //   TextButton(
              //     onPressed: (){
              //       active=1;
              //       setState(() {});
              //     },
              //     style: TextButton.styleFrom(
              //         backgroundColor:(active==1)?AppColors.blue:AppColors.white
              //     ),
              //     child: Text("About",style: AppTextStyle.interBold.copyWith(
              //         color:(active==1)?AppColors.white:AppColors.black,fontSize: 25
              //     ),),
              //   ),
              //   const SizedBox(width: 45,),
              //   TextButton(
              //     onPressed: (){
              //       active=2;
              //       setState(() {});
              //     },
              //     style: TextButton.styleFrom(
              //         backgroundColor:(active==2)?AppColors.blue:AppColors.white
              //     ),
              //     child: Text("Passions",style: AppTextStyle.interBold.copyWith(
              //         color: (active==2)?AppColors.white:AppColors.black,fontSize: 25
              //     ),),
              //   ),
              //   const SizedBox(width: 45,),
              //   TextButton(
              //     onPressed: (){
              //       active=3;
              //       setState(() {});
              //     },
              //     style: TextButton.styleFrom(
              //         backgroundColor:(active==3)?AppColors.blue:AppColors.white
              //     ),
              //     child: Text("Portfolio",style: AppTextStyle.interBold.copyWith(
              //         color: (active==3)?AppColors.white:AppColors.black,fontSize: 25
              //     ),),
              //   ),
              //   const SizedBox(width: 45,),
              //   TextButton(
              //     onPressed: (){
              //       active=4;
              //       setState(() {});
              //     },
              //     style: TextButton.styleFrom(
              //         backgroundColor:(active==4)?AppColors.blue:AppColors.white
              //     ),
              //     child: Text("Contact Me",style: AppTextStyle.interBold.copyWith(
              //         color:(active==4)?AppColors.white:AppColors.black,fontSize: 25
              //     ),),
              //   ),
              // ],),
              const SizedBox(height: 41,),
              Column(children: [
                SizedBox(width: 250,height: 250,child: ClipRRect(borderRadius: BorderRadius.circular(2000),child:Image.asset(AppImages.me,fit: BoxFit.cover,),)),
                SizedBox(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Salom",style: AppTextStyle.interRegular.copyWith(
                          fontSize: 20,color: AppColors.white
                      ),),
                      Text("Men Jasurbek Qo'chqorov Flutter dasturchiman",style: AppTextStyle.interSemiBold.copyWith(
                          color: AppColors.white,fontSize:25
                      ),),
                      Text("Men 2024-yilning iyul oyida Najot ta'limning  Flutter kursini tamomladim va shundan buyon flutter dasturchisi sifatida ish yurutmoqdaman.Hozirda Marketing Sohasida ham kursga borayapman.Target sohasidagi bilimlarni ham o'zlashtirmoqdaman",
                        style: AppTextStyle.interRegular.copyWith(fontSize:18,color: AppColors.white),)
                    ],),
                ),

              ],),
              SizedBox(height: 118,),
              Center(child: Text("Mening qiziqishlarim",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize: 35,
              ),),),
              const SizedBox(height: 60,),
              Column(children: [
                Container(
                  width: 347,height: 280,
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network("https://cdn.corporatefinanceinstitute.com/assets/marketing-1024x594.jpeg",fit: BoxFit.cover,height: 210,width: 340,)),
                    const SizedBox(height: 10,),
                    Text("Marketing",style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.white,fontSize:35
                    ),)
                  ],),
                ),
                SizedBox(width: 50,),
                Container(
                  width: 347,height: 280,
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network("https://i1.sndcdn.com/artworks-9u07t6LK92Xxo2gq-FXr5wA-t500x500.jpg",fit: BoxFit.cover,height: 210,width: 340,)),
                    const SizedBox(height: 10,),
                    Text("Flutter",style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.white,fontSize:35
                    ),)
                  ],),
                ),
                SizedBox(width: 50,),
                Container(
                  width: 347,height: 280,
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network("https://play-lh.googleusercontent.com/utNyP5-jVUjmuAzED5v2H-SbOisTOBjiu0FS2qeCJ7l40CEADbQxHxrGtmcurkXs5QJH=w240-h480-rw",fit: BoxFit.cover,height: 210,width: 340,)),
                    const SizedBox(height: 10,),
                    Text("Football",style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.white,fontSize:35
                    ),)
                  ],),
                ),
              ],),
              SizedBox(height: 68,),
              Center(child: Text("Mening Ishlarim",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize: 35,
              ),),),
              const SizedBox(height: 60,),
              Column(children: [
                Container(
                  width: 347,height: 280,
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    ZoomTapAnimation(onTap:(){
                  launchUrl(Uri.parse("https://github.com/jasurbekqochqorov/my_quiz_project"));
                  },child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0pKCWC5ZdFE8YbTwmIFrXSjTe8c8ha4v46w&s",fit: BoxFit.cover,height: 220,width: 340,))),
                    const SizedBox(height: 10,),
                    Text("Quiz app",style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.white,fontSize:35
                    ),)
                  ],),
                ),
                const SizedBox(width: 50,),
                Container(
                  width: 347,height: 280,
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    ZoomTapAnimation(onTap:(){
                      launchUrl(Uri.parse("https://github.com/abdushukur77/e_worker"));
                    },child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network("https://yt3.googleusercontent.com/iT3tLetsKGHKOEWKE7lMHyIQvLqsAv4smgu0SYWHGpB0kgd1mb81-bXgCYHr_CcN21QM2zHTIQ4=s900-c-k-c0x00ffffff-no-rj",fit: BoxFit.cover,height: 220,width: 340,))),
                    const SizedBox(height: 10,),
                    Text("Ish app",style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.white,fontSize:35
                    ),)
                  ],),
                ),
                const SizedBox(width: 50,),
                Container(
                  width: 347,height: 280,
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    ZoomTapAnimation(onTap:(){
                launchUrl(Uri.parse("https://github.com/jasurbekqochqorov/weather_app"));
                },child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBEaUWUbT3i1-chyeQIoqlNNWW9BurGEEdog&s",fit: BoxFit.cover,height: 220,width: 340,))),
                    const SizedBox(height: 10,),
                    Text("Weather app",style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.white,fontSize:35
                    ),)
                  ],),
                ),
              ],),
              const SizedBox(height: 68,),
              Center(child: Text("Men bilan aloqa",style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize: 35,
              ),),),
              SizedBox(height:  60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                ZoomTapAnimation(
                  onTap: (){
                    final github=Uri.parse("https://github.com/jasurbekqochqorov");
                   launchUrl(github);
                  },
                  child:Image.network("https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/collections/github-pages-examples/github-pages-examples.png",width: 60,height: 60,fit: BoxFit.cover,),),
                  ZoomTapAnimation(onTap: (){
                    final instagram=Uri.parse("https://www.instagram.com/jasurbekqochqorov01/");
                    launchUrl(instagram);
                  },child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp3arMTspIRSVpe57WI7EZ_pJqN3fnnXHCag&s",width: 60,height: 60,fit: BoxFit.cover)),
                ZoomTapAnimation(onTap:(){
                  final email=Uri(scheme: "mailto",path: "jasurbekqoochqorov04@gmail.com");
                  launchUrl(email);
                },child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4F4TdtMHnjJ5p8gsDHPoFrIIXUsseI_HO9w&s",width: 60,height: 60,fit: BoxFit.cover)),
                  ZoomTapAnimation(onTap:(){
                    final tel=Uri.parse("tel: +998 93 733 23 35");
                    launchUrl(tel);
                  },child: Image.network("https://st.depositphotos.com/1000407/4780/v/450/depositphotos_47801481-stock-illustration-phone-icon.jpg",width: 60,height: 60,fit: BoxFit.cover)),
              ],)
            ],),
          ),
        )
      ],),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.blue,
        tooltip: 'Increment',
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const MessageScreen();
          }));
        },
        child: const Icon(Icons.message, color: Colors.white, size: 28),
      ),
    );
  }
}
