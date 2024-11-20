import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homework12/data/api_provider.dart';
import 'package:homework12/data/models/network_response.dart';
import 'package:homework12/data/user_repository.dart';
import 'package:http/http.dart' as http;

import '../data/models/model.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserRepository userRepository=UserRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body:FutureBuilder(
        future:userRepository.getAll(),
        builder: (BuildContext context, AsyncSnapshot<NetworkResponse> snapshot) {
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          else if(snapshot.hasData){
            List<DataModel> dataModels=(snapshot.data as NetworkResponse).data as List<DataModel>;
            return ListView(
              children:List.generate(dataModels.length, (index){
                DataModel dataModel=dataModels[index];
                  return ListTile(
                    title: Text(dataModel.title),
                    subtitle: Text(dataModel.userId.toString()),
                  );

              }),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
