
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/Screen/register_screen.dart';
import 'package:homework12/bloc/chat_bloc.dart';
import 'package:homework12/bloc/chat_event.dart';
import 'firebase_options.dart';
import 'local/local_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>ChatBloc()..add(DownloadAll()))
    ], child:MaterialApp(
      home: (StorageRepository.getString(key:"name").isNotEmpty)?MainScreen():RegisterScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
