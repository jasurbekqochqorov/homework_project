import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/cubits/password/check_password.dart';
import 'package:homework12/screens/payme/register/enter_password_screen.dart';
import 'cubits/currency/currency_cubit.dart';
import 'data/local/storage_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.instance;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrenciesCubit()..fetchCurrencies()),
        BlocProvider(create: (_)=>CheckPassword())
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
      theme: ThemeData(useMaterial3: false),
      home: const EnterPasswordScreen(),
    );
  }
}
