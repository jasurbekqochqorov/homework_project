import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/bloc/chat_bloc.dart';
import 'package:homework12/bloc/chat_event.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>ChatBloc()..add(DownloadAll()))
    ], child:MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
