import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/screens/currencies_screen.dart';
import 'blocs/currencies_bloc.dart';
import 'blocs/currencies_event.dart';
import 'data/api_provider.dart';
import 'data/currencies_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (_) => CurrenciesRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CurrenciesBloc(currenciesRepo: context.read<CurrenciesRepo>())
                  ..add(GetCurrenciesEvent()),
          )
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
      home: CurrenciesScreen(),
    );
  }
}
