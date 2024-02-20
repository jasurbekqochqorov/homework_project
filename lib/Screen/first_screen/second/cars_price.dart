import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:http/http.dart' as http;

import '../../../models/car_models2.dart';

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
                .copyWith(color: AppColors.blue, fontSize: 18.getW()),
          ),
        ),
        body: Column(
          children: [
            (carModels2 != null)
                ? Column(
                    children: [

                      Text(carModels2!.carModel),
                      Text(carModels2!.description),
                    ],
                  )
                : Center(
                    child: SizedBox(
                      height: 100.getH(),
                      width: 100.getW(),
                      child: CircularProgressIndicator(
                        strokeWidth: 10.getW(),
                      ),
                    ),
                  )
          ],
        ));
  }
}
