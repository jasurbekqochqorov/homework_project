import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:http/http.dart' as http;

import '../../data/models/Cars/examle_models.dart';


class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}


class _ExampleState extends State<Example> {
   List<ExampleModels>? exampleModels;

  Future<void> _check()async{
    http.Response response;
    try{
      response=await http.get(
        Uri.parse('https://www.freetogame.com/api/games'),
      );
      if(response.statusCode==200){
        exampleModels=(jsonDecode(response.body) as List).map((e) =>ExampleModels.fromJson(e)).toList();
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
    _check();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
        centerTitle: true,
      ),
      body: Column(children: [
        (exampleModels![0]!=null)? ListTile(
          title: Text(exampleModels![0].title,style: AppTextStyle.interRegular.copyWith(
            color: AppColors.black,fontSize: 20.getW()
          ),),
        ):
        Center(child: SizedBox(
          height:100.getH(),width: 100.getW(),
          child: CircularProgressIndicator(
            strokeWidth:10.getW(),
          ),
        ),)
      ],),
    );
  }
}
