import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/images/app_images.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import '../../view_models/addressess_view_model.dart';
import '../maps/google_maps_screen.dart';
import '../maps/update_address_screen.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade200,
      appBar: AppBar(
        title:Text("My Addresses",style: AppTextStyle.interMedium.copyWith(
          color: AppColors.black,fontSize:18
        ),),
        centerTitle: true,
        backgroundColor:Colors.grey.shade200,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddressesViewModel>(
              builder: (context, viewModel, child) {
                return ListView(children: [
                  ...List.generate(viewModel.myAddresses.length, (index) {
                    var myAddress = viewModel.myAddresses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateScreen(
                                placeModel: myAddress,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        margin: const EdgeInsets.all(12),
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(3, 3),
                              color: Colors.black12,
                              spreadRadius: 0,
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(getImage(myAddress.placeCategory),width: 50,height: 50,),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(myAddress.placeCategory,style: AppTextStyle.interBold.copyWith(
                                    color: AppColors.black,fontSize:16
                                  ),),
                                  const SizedBox(height:6,),
                                  SizedBox(
                                    width:200,
                                    child: Text(
                                      maxLines: 2,
                                      myAddress.placeName,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.interMedium.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],),
                                Spacer(),
                                IconButton(onPressed: (){
                                  showDialog(context: context, builder:(context){
                                    return AlertDialog(
                                     content: Text("Are you sure",style: AppTextStyle.interBold.copyWith(
                                       color: AppColors.black,fontSize:24
                                     ),),
                                     actions: [
                                       TextButton(onPressed: (){
                                         context.read<AddressesViewModel>().deleteAddress(myAddress);
                                         Navigator.pop(context);
                                       },child: const Text('ok'),),
                                       TextButton(onPressed: (){
                                         Navigator.pop(context);
                                       },child: const Text('cancel'),),
                                     ],
                                    );
                                  });
                                }, icon: const Icon(Icons.delete))
                              ],
                            ),

                          ],
                        ),

                      ),
                    );
                  })
                ]);
              },
            ),
          ),
          Container(
            margin:const EdgeInsets.symmetric(horizontal:24,vertical:24),
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const GoogleMapsScreen();
                      },
                    ),
                  );
                },
                child:  Text("Yangi address qo'shish",style: AppTextStyle.interSemiBold.copyWith(
                  color: AppColors.white,fontSize: 18
                ),)),
          )
        ],
      ),
    );
  }
}

String getImage(String name){
  switch(name){
    case "home":
      {
        return AppImages.home;
      }

    case "work":{
      return AppImages.work;
    }
    default:{
      return AppImages.other;
    }
  }
  return "";
}
