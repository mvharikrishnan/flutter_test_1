import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/routes.dart' as route;
import 'package:fluttermachine_test_1/features/home/view/home_screen.dart';
import 'package:fluttermachine_test_1/features/login/view/login_screen.dart';
import 'package:fluttermachine_test_1/features/register/view/register_screen.dart';
import 'package:fluttermachine_test_1/features/splash_screen/view/splash_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case route.kSplashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );

      case route.kLoginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );

      case route.kHomeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case route.kRegisterScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const RegisterScreen();
          },
        );
    }
    return null;
  }
}
