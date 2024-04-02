import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homework12/screens/splash/splash_screen.dart';
import 'package:homework12/view_models/addressess_view_model.dart';
import 'package:homework12/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MapsViewModel()),
      ChangeNotifierProvider(create: (_) => AddressesViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const SplashScreen(),
    );
  }
}
