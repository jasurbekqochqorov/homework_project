import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/cubits/currency/currency_cubit.dart';
import 'package:homework12/screens/main_screen.dart';
import 'package:homework12/screens/time/save_screen.dart';

import 'cubits/currency/time_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TimeTaskCubit()),
        BlocProvider(create: (_) => CurrencyCubit()..fetchCurrencies()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light))),
        home: const MainScreen());
  }
}
