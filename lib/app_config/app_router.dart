import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/routes.dart' as route;
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
    }
    return null;
  }
}
