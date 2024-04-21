import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/services/service_locator.dart';

import 'blocs/game/game_bloc.dart';
import 'game_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GameBloc()..add(LoadQuestions()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const GameScreen(),
      ),
    );
  }
}
