import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';
import 'package:fluttermachine_test_1/app_config/ui_helper.dart';
import 'package:fluttermachine_test_1/resources/styles.dart';
import 'package:fluttermachine_test_1/widgets/custom_progress_indicator.dart';

/// [CustomTinyActionButton] - A custom tiny rounded button widget
///
/// It is specifically designed for Alert Dialog View
class CustomTinyActionButton extends StatelessWidget {
  const CustomTinyActionButton(
      {Key? key,
      required this.title,
      this.isLoading = false,
      this.cornerRadius = 20,
      this.height = 45,
      this.color,
      this.width,
      this.size = const Size(size24, size8),
      this.onPressed,
      this.fontSize = 16,
      this.backgroundGradient = const LinearGradient(
          colors: [AppColours.primary, AppColours.secondary])})
      : super(key: key);

  final String title;
  final bool isLoading;
  final Size size;
  final double height;
  final double? width;
  final double cornerRadius;
  final Color? color;
  final VoidCallback? onPressed;
  final double fontSize;
  final LinearGradient backgroundGradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isLoading ? 45 : height,
        width: isLoading ? 45 : width ?? SizeConfig.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isLoading ? 60 : 10),
            gradient: backgroundGradient),
        alignment: Alignment.center,
        child: isLoading
            ? const CustomProgressIndicator(
                color: AppColours.white,
              )
            : Text(
                title,
                style: Styles.of(context)
                    .headStyle1
                    .copyWith(color: AppColours.white, fontSize: fontSize),
              ),
      ),
    );
  }
}
