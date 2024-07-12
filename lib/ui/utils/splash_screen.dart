import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../home/product_screen/product_screen_view.dart';
import 'app_colors.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {

      if (mounted) {

        await Navigator.of(context).pushReplacementNamed(ProductScreenView.routeName);
      }else{
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Lottie.asset(
          "assets/animation/splash.json",
          fit: BoxFit.fill,
          width: 500.w,
          height: 500.h,
        ),
      ),
    );
  }
}
