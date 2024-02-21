import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/car_models2.dart';

class CarsPrice extends StatefulWidget {
  const CarsPrice({super.key, required this.id});

  final int id;

  @override
  State<CarsPrice> createState() => _CarsPriceState();
}

class _CarsPriceState extends State<CarsPrice> {
  CarModels2? carModels2;

  Future<void> _fetchData(int id) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse('https://easyenglishuzb.free.mockoapp.net/companies/$id'),
      );
      if (response.statusCode == 200) {
        carModels2 = CarModels2.fromJson(jsonDecode(response.body));
        setState(() {});
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    _fetchData(widget.id);
    super.initState();
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
              color: AppColors.blue,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Welcome to our market',
            style: AppTextStyle.interSemiBold
                .copyWith(color: AppColors.blue, fontSize: 24.getW()),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              (carModels2 != null)
                  ? Column(
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
                    )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 300.getH()),
                    child: Center(
                        child: SizedBox(
                          height: 100.getH(),
                          width: 100.getW(),
                          child: CircularProgressIndicator(
                            strokeWidth: 10.getW(),
                          ),
                        ),
                      ),
                  )
            ],
          ),
        ));
  }
}
