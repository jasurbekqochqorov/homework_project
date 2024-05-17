import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/cubit/counter_cubit.dart';
import 'package:homework12/game_screen.dart';

import 'blocs/game/game_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GameBloc()..add(GetAllNumber()),
        ),
        BlocProvider(
          create: (_) => CounterCubit(),
        )
      ],
      child: const MyApp(),
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
      home: GameScreen(),
    );
  }
}
