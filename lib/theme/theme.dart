import 'package:flutter/material.dart';

const primaryColor = Colors.white;
const secondryColor = Color(0XFFff3a44);
// const secondryColor = Colors.black;

final loginFocuseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: secondryColor));

final loginBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: secondryColor));

const loginContentPadding = EdgeInsets.all(15);

const boldTextStyle = TextStyle(
  color: secondryColor,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

final theme = ThemeData(
  backgroundColor: primaryColor,
  primaryColor: primaryColor,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
  ),
  scaffoldBackgroundColor: primaryColor,
  textTheme: TextTheme(),
  focusColor: secondryColor,
);
