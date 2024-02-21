import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homework12/models/data_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:http/http.dart' as http;

import '../second/cars_price_second.dart';

class SecondCars extends StatefulWidget {
  const SecondCars({super.key});

  @override
  State<SecondCars> createState() => _CarsState();
}
class _CarsState extends State<SecondCars> {
  DataModels? dataModels;
  Future<DataModels?> _fetchData() async{
    http.Response response;
    try{
      response=await http.get(
        Uri.parse('https://easyenglishuzb.free.mockoapp.net/companies'),
      );
      if(response.statusCode==200){
        return dataModels=DataModels.fromJson(jsonDecode(response.body));

      }
    }
    catch(error){
    throw Exception(error.toString());
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back_outlined,color:Colors.greenAccent,),),
        title: Text('Cars',style: AppTextStyle.interSemiBold.copyWith(
          color:Colors.greenAccent,fontSize:30.getW(),
        ),),
        centerTitle: true,
      ),
      body:Column(children: [
        FutureBuilder<DataModels?>(
            future:_fetchData(),
            builder:(BuildContext context,AsyncSnapshot<DataModels?> snapshot){
              if(snapshot.data!=null){
                return Expanded(
                  child: ListView(children: [
                    SizedBox(height: 20.getH(),),
                    ...List.generate(dataModels!.data.length, (index){
                      return Padding(
                        padding:EdgeInsets.symmetric(vertical: 5.getH(),horizontal: 20.getW()),
                        child: TextButton(
                            onPressed:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                return CarPriceSecond(id: index+1,);
                              }));
                            },
                            style: TextButton.styleFrom(
                                backgroundColor:Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.getW()),
                                )
                            ),
                            child:Row(children:[
                              Text(dataModels!.data[index].id.toString(),style: AppTextStyle.interSemiBold.copyWith(
                                  color: AppColors.white,fontSize:18.getW()
                              ),),
                              SizedBox(width:10.getW()),
                              Text(dataModels!.data[index].carModel,style: AppTextStyle.interSemiBold.copyWith(
                                  color: AppColors.white,fontSize:18.getW())),
                            ],)),
                      );
                    }),
                  ],),
                );
              }
              else{
                return Padding(
                  padding:EdgeInsets.symmetric(vertical:300.getH()),
                  child: Center(child: SizedBox(
                    height:100.getH(),width: 100.getW(),
                    child: CircularProgressIndicator(
                      strokeWidth:10.getW(),
                    ),
                  ),),
                );
              }
            })
      ],)
    );
  }
}
