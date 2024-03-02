import 'package:flutter/material.dart';
import 'package:fluttermachine_test_1/app_config/theme.dart';

class Styles {
  //BuildContext will be needed in the future for making the UI responsive
  static BuildContext? _context;
  static Styles? _styles;

  final TextStyle _mainFont = const TextStyle(fontFamily: 'Nunito');

  static Styles of(BuildContext context) {
    _styles ??= Styles();
    _context = context;
    return _styles!;
  }

  // headStyle 1
  TextStyle get headStyle1 {
    return _mainFont.copyWith(
      color: AppColours.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    );
  }

  // bodyStyle 1
  TextStyle get bodyStyle1 {
    return _mainFont.copyWith(
      color: AppColours.black,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
    );
  }


  // bodyStyle 2
  TextStyle get bodyStyle2 {
    return _mainFont.copyWith(
      color: AppColours.textGrey,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
    );
  }

  // bodyStyle 3
  TextStyle get bodyStyle3 {
    return _mainFont.copyWith(
      color: AppColours.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );
  }

  // bodyStyle 4
  TextStyle get bodyStyle4 {
    return _mainFont.copyWith(
      color: AppColours.textGrey,
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
    );
  }

  // bodyStyle 4
  TextStyle get bodyStyle5 {
    return _mainFont.copyWith(
      color: AppColours.lightBlack,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
    );
  }

  // bodyStyle 6
  TextStyle get bodyStyle6 {
    return _mainFont.copyWith(
      color: AppColours.lightBlack,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    );
  }
}
