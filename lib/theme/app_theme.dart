import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 192, 67, 96),
    background: Colors.white,
    secondary: Colors.black12,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontWeight: FontWeight.w500),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    constraints: BoxConstraints(maxHeight: 50.0),
    contentPadding: EdgeInsets.all(5.0),
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    labelStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      disabledBackgroundColor: const Color.fromARGB(225, 221, 221, 221),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      fixedSize: const Size(double.maxFinite, 50.0),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      side: const BorderSide(color: Colors.black),
      fixedSize: const Size(double.maxFinite, 50.0),
    ),
  ),
);
