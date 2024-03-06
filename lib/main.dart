import 'package:flutter/material.dart';
import 'package:homework12/Screen/Home/main_screen.dart';
import 'package:homework12/Screen/splash/splash_screen.dart';

void main(){
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
