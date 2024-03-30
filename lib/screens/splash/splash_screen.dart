import 'package:flutter/material.dart';
import 'package:homework12/utils/images/app_images.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/app_colors.dart';
import '../../view_models/maps_view_model.dart';
import '../addresses/addresses_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const AddressesScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<MapsViewModel>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child:Lottie.asset(AppImages.test),
      ),
    );
  }
}
