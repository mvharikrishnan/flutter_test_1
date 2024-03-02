import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/app_config/validators_and_formatters.dart';

class AuthViewModel with ChangeNotifier {
  AuthViewModel() {
    isLoading = false;
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();

  bool isLoading = false;

  loginUsingEmail(BuildContext context) {
    if (loginEmailController.text.isEmpty) {
      ShowAlert.showStyledToast('Please enter a mobile number', context);
      return;
    }
    if (loginPassController.text.isEmpty) {
      ShowAlert.showStyledToast('Please enter your password', context);
      return;
    }
    if ((ValidatorAndFormatters.isEmail(loginEmailController.text.trim()))) {
      //verify email
    } else {
      ShowAlert.showStyledToast('Please enter a Valid Email', context);
      return;
    }
  }
}
