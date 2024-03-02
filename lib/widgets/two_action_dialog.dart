import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/constants.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/resources/styles.dart';
import 'package:fluttermachine_test_1/widgets/custom_submit_button.dart';

class TwoActionDialogue extends StatelessWidget {
  const TwoActionDialogue(
      {Key? key,
      required this.description,
      this.buttonTitle = 'Confirm',
      this.imageSize = 70})
      : super(key: key);
  final String description;
  final String buttonTitle;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: EdgeInsets.all(SizeConfig.screenWidth * .08),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context, rootNavigator: false).pop(false),
                  child: Image.asset(
                    AppConstants().appLogo,
                    height: 28,
                    width: 28,
                    color: AppColours.secondary,
                  ),
                )
              ],
            ),
            Image.asset(
              AppConstants().appLogo,
              height: imageSize,
              width: imageSize,
            ),
            if (imageSize < 70)
              const SizedBox(
                height: 10,
              ),
            Text(
              description,
              style: Styles.of(context).headStyle1.copyWith(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            vsBox2,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomTinyActionButton(
                cornerRadius: 3,
                height: 40,
                width: double.infinity,
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(true),
                title: buttonTitle,
              ),
            ),
            vsBox1
          ],
        ),
      ),
    );
  }
}
