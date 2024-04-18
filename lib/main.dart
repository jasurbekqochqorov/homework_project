import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:homework12/screens/pin_put_screen.dart';
import 'package:homework12/utils/translations/messages.dart';

void main() {
  runApp(
    GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const  PinPutScreen(),
    ),
  );
}
