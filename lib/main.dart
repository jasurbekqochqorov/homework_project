import 'package:flutter/material.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/utils/global/global.dart';

void main(){
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Global.k=1;
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
