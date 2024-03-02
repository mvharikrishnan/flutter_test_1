import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/app_config/validators_and_formatters.dart';
import 'package:fluttermachine_test_1/repositories/shared_preferences_repo.dart';
import 'package:fluttermachine_test_1/rest/repository.dart';
import 'package:fluttermachine_test_1/app_config/routes.dart' as route;

class AuthViewModel with ChangeNotifier {
  AuthViewModel() {
    isLoading = false;
  }
  final _prefs = SharedPreferencesRepo.instance;
  final _repository = Repository();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();

  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  loginUsingEmail(BuildContext context) async {
    if (loginEmailController.text.isEmpty) {
      ShowAlert.showStyledToast('Please enter a mobile number', context);
      return;
    }
    if (loginPassController.text.isEmpty) {
      ShowAlert.showStyledToast('Please enter your password', context);
      return;
    }
    makeLoadingTrue();
    final response = await _repository.checkUserExist(
      loginEmailController.text.trim(),
      loginPassController.text.trim(),
    );
    if (response.data?.message == 'Logged in successfully') {
      savebearertoken(response.data?.token ?? '', context);
      ShowAlert.showStyledToast('Logged in successfully', context);
    }
  }

  savebearertoken(String token, BuildContext context) {
    _prefs.storeFCMToken(token);
    log('Bearer Token: $token');
    Navigator.of(context).pushReplacementNamed(route.kHomeScreen);
    clearFileds();
    makeLoadingFalse();
  }

  clearFileds() {
    loginEmailController.clear();
    loginPassController.clear();
    notifyListeners();
  }
}
