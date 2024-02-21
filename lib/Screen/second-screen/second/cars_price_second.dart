import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homework12/models/car_models2.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:http/http.dart' as http;

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';
class CarPriceSecond extends StatefulWidget {
  const CarPriceSecond({super.key, required this.id});
  final int id;
  @override
  State<CarPriceSecond> createState() => _CarPriceSecondState();
}

class _CarPriceSecondState extends State<CarPriceSecond> {
  CarModels2? carModels2;
  Future<CarModels2?> _fetchData(int id) async{
    http.Response response;
    try{
      response=await http.get(
        Uri.parse('https://easyenglishuzb.free.mockoapp.net/companies/$id'),
      );
      if(response.statusCode==200){
        return carModels2=CarModels2.fromJson(jsonDecode(response.body));

      }
    }
    catch(error){
      throw Exception(error.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Welcome to our market',
            style: AppTextStyle.interSemiBold
                .copyWith(color: AppColors.black, fontSize: 24.getW()),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<CarModels2?>(
                  future:_fetchData(widget.id),
                  builder:(BuildContext context,AsyncSnapshot<CarModels2?> snapshot){
                    if(snapshot.data!=null){
                      return Column(
                        children: [
                          SizedBox(height: 30.getH(),),
                          CarouselSlider(
                              items:List.generate(carModels2!.pics.length, (index){
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20.getW()),
                                  child: Image.network(carModels2!.pics[index],width:300.getW(),fit: BoxFit.cover,),);
                              }),
                              options: CarouselOptions(
                                aspectRatio:1.8,
                                // viewportFraction: 0.8,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval:const Duration(seconds: 3),
                                autoPlayAnimationDuration:const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              )
                          ),
                          Padding(padding:EdgeInsets.symmetric(
                              horizontal: 20.getW(),vertical:20.getH()
                          ),
                            child:Column(children: [
                              Image.network(carModels2!.logo.toString(),width: 200.getW(),height: 100.getH(),),
                              SizedBox(height: 10.getH(),),
                              Text('Year:${carModels2!.establishedYear.toString()}',style: AppTextStyle.interSemiBold.copyWith(
                                  color: AppColors.c_090F47,fontSize:24.getW()),),
                              Text('Price:${carModels2!.averagePrice.toString()}\$',style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.c_090F47,fontSize: 24.getW(),
                              ),),
                              Text('Description: '+carModels2!.description,style: AppTextStyle.interRegular.copyWith(
                                  color: AppColors.black,fontSize: 20.getW()
                              ),)
                            ],),)
                        ],
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
            ],
          ),
        ));
  }
}
