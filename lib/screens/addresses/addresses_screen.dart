import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homework12/data/local/local_database.dart';
import 'package:homework12/data/models/place_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
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
                              return UpdateAddressScreen(
                                placeModel: myAddress,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        height: 100,
                        width: double.infinity,
                      child: Text(myAddress.placeName,style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.black,fontSize:24
                      ),),),
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
