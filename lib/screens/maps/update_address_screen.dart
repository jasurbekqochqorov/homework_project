import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homework12/data/models/place_category.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import '../../data/models/place_model.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../../view_models/addressess_view_model.dart';
import '../../view_models/maps_view_model.dart';
import 'dialogs/addressDetailDialog.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({
    super.key,
    required placeModel
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  PlaceModel placeModels=PlaceModel.initialValue;
  PlaceCategory category=PlaceCategory.home;
  int k=0;
  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          return Stack(
            children:[
              // GoogleMap(
              //   markers: viewModel.markers,
              //   onCameraIdle: () {
              //     if (cameraPosition != null) {
              //       context
              //           .read<MapsViewModel>()
              //           .changeCurrentLocation(cameraPosition!);
              //     }
              //     // ScaffoldMessenger.of(context)
              //     //     .showSnackBar(const SnackBar(content: Text("IDLE")));
              //   },
              //   onCameraMove: (CameraPosition currentCameraPosition) {
              //     cameraPosition = currentCameraPosition;
              //     debugPrint(
              //         "CURRENT POSITION:${currentCameraPosition.target.longitude}");
              //   },
              //   mapType: viewModel.mapType,
              //   initialCameraPosition: viewModel.initialCameraPosition,
              //   onMapCreated: (GoogleMapController createdController) {
              //     viewModel.controller.complete(createdController);
              //   },
              // ),
              Align(
                child: Image.asset(
                  AppImages.location,
                  width: 50,
                  height: 50,
                ),
              ),
              Positioned(
                top: 100,
                right: 0,
                left: 0,
                child: Text(
                  viewModel.currentPlaceName,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              Positioned(
                  bottom: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:24),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed:(){
                            category=PlaceCategory.home;
                            k=1;
                            setState(() {});
                          },
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal:10,vertical:5),
                                  backgroundColor:(k==1)? Colors.amberAccent:AppColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  )
                              ),
                              child:Row(children: [
                                Image.asset(AppImages.home,width: 40,height: 40,),
                                const SizedBox(width:3,),
                                Text("home",style: AppTextStyle.interRegular.copyWith(
                                    color:(k==1)?AppColors.white:AppColors.black.withOpacity(0.4),fontSize: 14
                                ),),
                              ],)),
                          const SizedBox(width: 20,),
                          TextButton(onPressed:(){
                            category=PlaceCategory.work;
                            k=2;
                            setState(() {});
                          },
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal:10,vertical:5),
                                  backgroundColor:(k==2)? Colors.amberAccent:AppColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  )
                              ),
                              child:Row(children: [
                                Image.asset(AppImages.work,width: 40,height: 40,),
                                const SizedBox(width:3,),
                                Text("work",style: AppTextStyle.interRegular.copyWith(
                                    color:(k==2)?AppColors.white:AppColors.black.withOpacity(0.4),fontSize: 14
                                ),),
                              ],)),
                          const SizedBox(width: 20,),
                          TextButton(onPressed:(){
                            category=PlaceCategory.other;
                            k=3;
                            setState(() {});
                          },
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal:10,vertical:5),
                                  backgroundColor: (k==3)? Colors.amberAccent:AppColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  )
                              ),
                              child:Row(children: [
                                Image.asset(AppImages.other,width: 40,height: 40,),
                                const SizedBox(width:3,),
                                Text("friends",style: AppTextStyle.interRegular.copyWith(
                                    color: (k==3)?Colors.white:AppColors.black.withOpacity(0.4),fontSize: 14
                                ),),
                              ],))
                        ],),
                      const SizedBox(height:30,),
                      SizedBox(
                        child: TextButton(onPressed: (){
                          addressDetailDialog(
                            context: context,
                            placeModel: (newAddressDetails) {
                              placeModels = newAddressDetails;
                              placeModels.copyWith(
                                placeCategory:category.name,
                                lat:viewModel.currentCameraPosition.target.latitude,
                                long:viewModel.currentCameraPosition.target.longitude,
                              );
                              context.read<AddressesViewModel>().updateAddress(placeModels);
                              context.read<AddressesViewModel>().init();
                              Navigator.pop(context);
                            },
                          );
                        },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 130,vertical:10),
                                backgroundColor:Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)
                                )
                            ),
                            child:Text('Save',style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.white,fontSize:24
                            ),)),
                      )
                    ],),
                  ))
            ],
          );
        },
      ),
    );
  }
}
