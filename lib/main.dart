import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermachine_test_1/app_config/app_router.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/features/home/view_model/home_view_model.dart';
import 'package:fluttermachine_test_1/features/login/view_model/auth_view_model.dart';
import 'package:fluttermachine_test_1/repositories/shared_preferences_repo.dart';
import 'package:provider/provider.dart';
import 'package:fluttermachine_test_1/app_config/routes.dart' as route;

void main(List<String> args) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesRepo.initialize();
    runApp(const MyApp());
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
      ],
      child: const MyAppState(),
    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({super.key});

  @override
  State<MyAppState> createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ayurvedic Centre",
      debugShowCheckedModeBanner: true,
      initialRoute: route.kSplashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: AppColours.white.withOpacity(0.98),
        primaryColor: AppColours.primary,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColours.primary,
          selectionColor: AppColours.primary,
          selectionHandleColor: AppColours.primary,
        ),
      ),
    );
  }
}
