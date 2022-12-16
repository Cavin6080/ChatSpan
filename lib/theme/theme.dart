import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: const MaterialColor(4283026635, {
    50: const Color(0xffebf9f9),
    100: const Color(0xffd7f4f4),
    200: const Color(0xffafe9e8),
    300: const Color(0xff87dedd),
    400: const Color(0xff60d2d1),
    500: const Color(0xff38c7c6),
    600: const Color(0xff2d9f9e),
    700: const Color(0xff217877),
    800: const Color(0xff16504f),
    900: const Color(0xff0b2828)
  }),
  brightness: Brightness.light,
  primaryColor: const Color(0xff49cccb),
  primaryColorLight: const Color(0xffd7f4f4),
  primaryColorDark: const Color(0xff217877),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  bottomAppBarColor: const Color(0xffffffff),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  buttonColor: const Color(0xffe0e0e0),
  toggleableActiveColor: const Color(0xff2d9f9e),
  secondaryHeaderColor: const Color(0xffebf9f9),
  backgroundColor: const Color(0xffafe9e8),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xff38c7c6),
  hintColor: const Color(0x8a000000),
  errorColor: const Color(0xffd32f2f),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xff49cccb),
      secondary: Color(0xff38c7c6),
      surface: Color(0xffffffff),
      background: Color(0xffafe9e8),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xff000000),
      onSecondary: Color(0xff000000),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
);
