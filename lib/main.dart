import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/game/game_bloc.dart';
import 'package:homework12/game/game_event.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>
        GameBloc()
          ..
          add(GetEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(useMaterial3: false),
      home: const MainScreen(),
    );
  }
}