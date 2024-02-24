import 'package:flutter/material.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/Screen/tab_box_second.dart';
import 'package:homework12/Screen/tab_box_third.dart';

void main(){
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBoxThird(),
      debugShowCheckedModeBanner: false,
    );
  }
}
