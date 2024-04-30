import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/connectivity/connectivity_bloc.dart';
import '../blocs/connectivity/connectivity_event.dart';
import '../blocs/currency/currency_bloc.dart';
import '../blocs/currency/currency_event.dart';
import '../data/repositories/currency_repository.dart';
import '../screens/currencies/currencies_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => CurrencyRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CurrencyBloc()..add(GetCurrenciesEvent())),
          BlocProvider(
              create: (_) => ConnectivityBloc()..add(CheckConnectivity())),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const CurrenciesScreen(),
    );
  }
}
