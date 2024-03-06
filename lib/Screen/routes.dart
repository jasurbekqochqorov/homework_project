import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework12/Screen/splash/splash_screen.dart';

import 'About/about_screen.dart';
import 'Home/home_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RouteNames.splashScreen:
        {
          return navigate(const SplashScreen());
        }

      case RouteNames.homeScreen:
        {
          return navigate(const HomeScreen());
        }

      case RouteNames.aboutScreen:
        {
          return navigate(const AboutScreen());
        }

      default:{
        return navigate(const Scaffold(body: Center(child: Text('Bunday screen yoq'),),));
      }

    }
  }
  static navigate(Widget widget){
    return MaterialPageRoute(builder: (context)=>widget);
  }
}

class RouteNames{
  static const String splashScreen='/';
  static const String homeScreen='/first_route';
  static const String aboutScreen='/second_route';
}