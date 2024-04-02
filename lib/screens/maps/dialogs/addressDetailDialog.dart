import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homework12/data/models/place_category.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'package:homework12/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';
import '../../../data/models/place_model.dart';

addressDetailDialog({
  required BuildContext context,
  required ValueChanged<PlaceModel> placeModel,
}) {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController stageController = TextEditingController();
  final TextEditingController flatNumberController = TextEditingController();
  final TextEditingController orientAddressController = TextEditingController();
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        addressController.text=context.watch<MapsViewModel>().currentPlaceName;
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal:24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10,),
                Text('Address',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.black,fontSize:24
                ),),
                const SizedBox(height:10,),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    hintText: 'Enter address'
                  ),
                ),
                const SizedBox(height: 10,),
                Row(children: [
                  Expanded(
                    child: TextField(
                      controller:entranceController,
                      decoration: const InputDecoration(
                          hintText: 'entrance'
                      ),
                    ),
                  ),
                  const SizedBox(width:15,),
                  Expanded(
                    child: TextField(
                      controller: stageController,
                      decoration: const InputDecoration(
                          hintText: 'stage'
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: flatNumberController,
                      decoration: const InputDecoration(
                          hintText: 'flat number'
                      ),
                    ),
                  ),
                ],),
                const SizedBox(height: 10,),
                TextField(
                  controller: orientAddressController,
                  decoration: const InputDecoration(
                      hintText: 'Enter orient address'
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () async{
                        PlaceModel newPlaceModel=PlaceModel(
                          entrance: entranceController.text,
                          flatNumber:flatNumberController.text,
                          orientAddress:orientAddressController.text,
                          placeCategory:PlaceCategory.home.name,
                          lat:0.0,
                          long: 0.0,
                          placeName:addressController.text.toString(),
                          stage: stageController.text,
                        );
                        placeModel.call(newPlaceModel);
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:Colors.amberAccent,
                      ),
                      child:  Text("SAVE PLACE",style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,fontSize:18
                      ),)),
                ),
                const SizedBox(height:10,),
              ],
            ),
          ),
        );
      });
}
