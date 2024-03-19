import 'package:flutter/material.dart';
import 'package:homework12/view_models/calculator_view_model.dart';
import 'package:provider/provider.dart';

import 'Screen/main_screen.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) =>CalculatorViewModel()),
      // ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ],
    child: const MyApp(),
  ));

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
