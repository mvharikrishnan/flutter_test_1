import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/constants.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColours.splashBackgroundColor,
      body: Image.asset(
        AppConstants().splashScreenImage,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}
