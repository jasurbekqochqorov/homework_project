import 'package:flutter/material.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/data/local/storage_repository.dart';
void main(){

  WidgetsFlutterBinding.ensureInitialized();

  StorageRepository.instance;
  runApp(const MyApp());

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
