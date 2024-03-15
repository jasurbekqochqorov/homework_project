import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/helper_screen.dart';
import 'package:flutter_nt_ten/view_model/country_view_model.dart';
import 'package:flutter_nt_ten/view_model/user_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'data/network/api_provider.dart';
import 'data/repository/country_repo.dart';
import 'data/repository/user_repo.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  ApiProvider apiProvider = ApiProvider();
  UserRepo userRepo = UserRepo(aapiProvider: apiProvider);


  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                CountriesViewModel(
                    countryRepository:
                    CountryRepository(apiProvider: apiProvider))),
        ChangeNotifierProvider(create: (_) => UserViewModel(userRepo: userRepo))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),

        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            home: HelperScreen(),
          );
        },
        child: HelperScreen()
    );
  }
}

