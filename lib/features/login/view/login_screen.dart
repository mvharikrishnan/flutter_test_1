import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermachine_test_1/app_config/constants.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/features/login/view_model/auth_view_model.dart';
import 'package:fluttermachine_test_1/widgets/common_text_form_field.dart';
import 'package:fluttermachine_test_1/widgets/custom_submit_button.dart';
import 'package:fluttermachine_test_1/widgets/two_action_dialog.dart';
import 'package:provider/provider.dart';

import '../../../app_config/ui_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        final bool? value = await showDialog(
          context: context,
          builder: (ctx) => const TwoActionDialogue(
              description: 'Do you want to close ?', buttonTitle: 'Close'),
        );
        if (value != null && value) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColours.white,
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  child: Image.asset(
                    AppConstants().loginLogoFrame,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenWidth * 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: SizeConfig.screenWidth / 6,
                  left: SizeConfig.screenWidth / 3,
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.3,
                    height: SizeConfig.screenWidth * 0.3,
                    child: Image.asset(
                      AppConstants().appLogo,
                      width: SizeConfig.screenWidth * 0.5,
                      height: SizeConfig.screenWidth * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            vsBox2,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings().loginText,
                    style: AppTheme().customTextBold(
                      AppColours.black,
                      24,
                    ),
                  ),
                  vsBox1,
                  CustomTextField(
                    controller: auth.loginEmailController,
                    title: 'Email',
                    hintText: 'Enter your email',
                  ),
                  vsBox1,
                  CustomTextField(
                    controller: auth.loginPassController,
                    title: 'Password',
                    hintText: 'Enter Password',
                  ),
                  vsBox5,
                  CustomTinyActionButton(
                    title: "Login",
                    height: 45,
                    width: SizeConfig.screenWidth,
                    cornerRadius: 3,
                    isLoading: auth.isLoading,
                    onPressed: auth.isLoading
                        ? null
                        : () {
                            FocusScope.of(context).unfocus();
                            auth.loginUsingEmail(context);
                          },
                  ),
                  vsBox4,
                  const Text.rich(
                    TextSpan(
                      text:
                          'By creating or logging into an account you are agreeing with our ',
                      style:
                          TextStyle(color: Colors.black), // Default text color
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(color: AppColours.blueGradEnd),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: AppColours.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: AppColours.blueGradEnd),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                              color: Colors.black), // Default text color
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
