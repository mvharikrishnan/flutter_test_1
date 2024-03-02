import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/constants.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/repositories/shared_preferences_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttermachine_test_1/app_config/routes.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _prefs = SharedPreferencesRepo.instance;
  @override
  void initState() {
    initRoute();
    super.initState();
  }

  initRoute() async {
    bool? isUserLoggedIn = _prefs.checkLogIn;
    if (isUserLoggedIn == null) {
      //navigate to login screen
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacementNamed(route.kLoginScreen);
      });
    } else {
      //navigate to home screen
    }
  }

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
