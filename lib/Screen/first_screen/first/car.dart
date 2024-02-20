import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homework12/models/data_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:http/http.dart' as http;

import '../second/cars_price.dart';
class Cars extends StatefulWidget {
  const Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();
}
class _CarsState extends State<Cars> {
  DataModels? dataModels;
  Future<void> _fetchData() async{
    http.Response response;
    try{
      response=await http.get(
        Uri.parse('https://easyenglishuzb.free.mockoapp.net/companies'),
      );
      if(response.statusCode==200){
        dataModels=DataModels.fromJson(jsonDecode(response.body));
        setState(() {});
      }
    }
    catch(error){
     if(context.mounted){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content:Text(error.toString()))
       );
     }
    }
    setState(() {});
  }
  
  @override
  void initState() {
    _fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back_outlined,color:AppColors.blue,),),
        title: Text('Cars',style: AppTextStyle.interSemiBold.copyWith(
          color: AppColors.blue,fontSize:30.getW(),
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(vertical: 20.getH(),horizontal: 20.getW()),
        child:(dataModels!=null)?ListView(children: [
          ...List.generate(dataModels!.data.length, (index){
            return Padding(
              padding:EdgeInsets.symmetric(vertical: 5.getH()),
              child: TextButton(
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return CarsPrice(id: index,);
                    }));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.c_1987FB,
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
        ],):Center(child: SizedBox(
          height:100.getH(),width: 100.getW(),
          child: CircularProgressIndicator(
            strokeWidth:10.getW(),
          ),
        ),)
      ),
    );
  }
}
