import 'package:flutter/material.dart';

class Styles {
  // Colors

  static const Color grey = Color(0xFF1E1E1E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color mainColor = Color(0xFFFE8200);
  static const Color green = Color(0xFF71B440);
  static const Color red = Color(0xFFE25643);
  static const Color darkGrey = Color(0xFF334D5C);
  static const Color brandBlue = Color(0xFF0062CC);
  static const Color orangeLight = Color(0xFFF99104);
  static const Color pinkLight = Color(0xFFFF4F81);
  static const Color pinkDark = Color(0xFFD15369);
  static const Color darkBlue = Color(0xFF5AB1FF);
  static const Color textColor = Colors.white;
  static const Color textColor2 = Color(0xffBDBDBD);
  static const Color inActiveColor = Color(0xFFCFCFCF);
  static const Color backgroundColor = Color(0xff011D29);

  // sizes

  static getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  // textStyles

  static TextStyle ts16(Color color,
          {FontWeight? fontWeight,
          TextDecoration? textDecoration,
          String fontFamily = 'MontserratRegular'}) =>
      TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: fontFamily);
  static TextStyle ts14(Color color,
          {FontWeight? fontWeight,
          TextDecoration? textDecoration,
          String fontFamily = 'MontserratRegular'}) =>
      TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: fontFamily);
  static TextStyle ts24(Color color,
          {FontWeight? fontWeight,
          TextDecoration? textDecoration,
          String fontFamily = 'MontserratRegular'}) =>
      TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: fontFamily);

  static TextStyle ts18(Color color,
          {FontWeight? fontWeight,
          TextDecoration? textDecoration,
          String fontFamily = 'MontserratRegular'}) =>
      TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: fontFamily);
  static TextStyle ts28(Color color,
          {FontWeight? fontWeight,
          TextDecoration? textDecoration,
          String fontFamily = 'MontserratRegular'}) =>
      TextStyle(
          color: color,
          fontSize: 28,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: fontFamily);
  static TextStyle ts32(Color color,
          {FontWeight? fontWeight,
          TextDecoration? textDecoration,
          String fontFamily = 'MontserratRegular'}) =>
      TextStyle(
          color: color,
          fontSize: 32,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: fontFamily);
          static TextStyle ts12(Color color,
          {FontWeight? fontWeight,
          TextDecoration? textDecoration,
          String fontFamily = 'MontserratRegular'}) =>
      TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: fontWeight,
          decoration: textDecoration,
          fontFamily: fontFamily);
}
