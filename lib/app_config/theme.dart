import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColours {
  static const primary = Color(0XFF006836);
  static const blueGradEnd = Color.fromARGB(255, 43, 0, 233);
  static const blueGradStart = Color(0XFF9DCEFF);
  static const secondary = Color(0XFF006837);
  static const textBoxColor = Color(0XFFF7F8F8);
  static const categoryTileColor = Color(0XFFF7F7F7);
  static const white = Color(0XFFFFFFFF);
  static const black = Color(0XFF000000);
  static const textGrey = Color(0XFF9B9B9B);
  static const textFieldBackground = Color(0XFFF2FAFD);
  static const hintTextColor = Color(0XFF9fa7a4);
  static const hollowButtonBorderColor = Color(0XFF00A895);
  static const orange = Color(0XFFFFA308);
  static const dividerColor = Color(0xFFE8E8E8);
  static const boxColour = Color(0XFFC0F2ED);
  static const buttonGreen = Color(0XFF00A895);
  static const selected = Color(0XFF53E88B);
  static const bgColor = Color(0XFFF8F8F8);
  static const redColor = Color(0XFFff0000);
  static const serviceBoxColor1 = Color(0xFFE7FFC0);
  static const serviceBoxColor2 = Color(0xFFD4FFDE);
  static const cancelButtonColor = Color(0xFFFF8080);
  static const grey1 = Color(0xFFECECEC);
  static const grey2 = Color(0xFFE1E1E1);
  static const lightGreen = Color(0xFFDFFFDE);
  static const lightGreen2 = Color(0xFFCCFFD4);
  static const lightBlack = Color(0xFF444444);
  static const lightBlue1 = Color(0xFF57B9F0);
  static const lightBlue2 = Color(0xFF23B5E3);
  static const lightOrange1 = Color(0xFFF5A338);
  static const lightOrange2 = Color(0xFFFFB236);
  static const starYellow = Color(0xFFFFC554);
  static const  lightRed = Color(0xFFE93636);
  static const lightOrange3 = Color(0xFFF24E1E);
  static const splashBackgroundColor = Color(0xFFFCFCFF);
}

class AppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColours.primary,
      appBarTheme: theme.appBarTheme.copyWith(
        color: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,
        titleSpacing: 0,
        titleTextStyle: Theme.of(context)
            .textTheme
            .button
            ?.copyWith(color: AppColours.primary, fontSize: 18),
        iconTheme: const IconThemeData(color: AppColours.primary),
      ),
      textTheme: theme.textTheme
          .copyWith(
            //headline5
            headline5: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 24,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold),
            //headline6
            headline6: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 20,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w500),
            //subtitle1
            subtitle1: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 16,
                letterSpacing: 0.15,
                fontWeight: FontWeight.bold),
            //subtitle2
            subtitle2: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 14,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w500),
            //body 1
            bodyText1: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 18,
                letterSpacing: 0.5,
                fontWeight: FontWeight.normal),
            //body 2
            bodyText2: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 14,
                letterSpacing: 0.25,
                fontWeight: FontWeight.normal),
            //button
            button: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 1.25,
                fontWeight: FontWeight.w600),
            // caption
            caption: GoogleFonts.inter(
                color: AppColours.black,
                fontSize: 12,
                letterSpacing: 0.4,
                fontWeight: FontWeight.normal),
          )
          .apply(),
    );
  }

  TextStyle customTextNormal(Color color, double fontSize) {
    return GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        letterSpacing: 0.4,
        fontWeight: FontWeight.normal);
  }

  TextStyle customTextBold(Color color, double fontSize) {
    return GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        letterSpacing: 0.4,
        fontWeight: FontWeight.bold);
  }

  TextStyle mainHeadingBlack() {
    return GoogleFonts.inter(
      color: AppColours.black,
      fontSize: 17,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle headingGrey() {
    return GoogleFonts.inter(
      color: AppColours.textGrey,
      fontSize: 15,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle subTitleBlack() {
    return GoogleFonts.inter(
      color: AppColours.black,
      fontSize: 14,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle subTitleGrey() {
    return GoogleFonts.inter(
      color: AppColours.textGrey,
      fontSize: 14,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle subTitleWhite() {
    return GoogleFonts.inter(
      color: AppColours.white,
      fontSize: 13,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle constentBlack() {
    return GoogleFonts.inter(
      color: AppColours.black,
      fontSize: 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle constentWhite() {
    return GoogleFonts.inter(
      color: AppColours.white,
      fontSize: 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle constentGrey() {
    return GoogleFonts.inter(
      color: AppColours.textGrey,
      fontSize: 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle constentGreySmall() {
    return GoogleFonts.inter(
      color: AppColours.textGrey,
      fontSize: 10,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle constentBlackSmallBold() {
    return GoogleFonts.inter(
      color: AppColours.black,
      fontSize: 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle constentBlackSemiBold15() {
    return GoogleFonts.inter(
      color: AppColours.black,
      fontSize: 15,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle constentBlackSemiBold14() {
    return GoogleFonts.inter(
      color: AppColours.black,
      fontSize: 14,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle constentWhiteSmall() {
    return GoogleFonts.inter(
      color: AppColours.white,
      fontSize: 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    );
  }
}
