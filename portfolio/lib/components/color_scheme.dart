import 'package:flutter/material.dart';

class MyColors {
  static const Color background = Color(0xff01274A); // Background color
  static const Color heading = Color(0xffFFFFFF); // Maroon for headings
  static const Color text = Color(0xFF7F7D7C); // Black for text
  static const Color accent1 = Color(0xFFFB81B0); // Accent 1 Orange
  static const Color text2 = Color(0xffABC9E3);
  static const Color accent2 = Color(0xffEFBC87);
  static const Color seamless = Color(0xff080D26);
}

final ThemeData myTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: MyColors.background,
  primaryColor: MyColors.accent1,
  appBarTheme: AppBarTheme(
    color: MyColors.heading,
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: MyColors.heading,
      fontFamily: 'montBold',
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: MyColors.heading,
      fontFamily: 'lora',
    ),
    bodyLarge: TextStyle(
      color: MyColors.text2,
      fontSize: 16.0,
      fontFamily: 'montBold',
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: MyColors.text,
      fontFamily: 'lora',
    ),
    labelSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: MyColors.text,
      fontFamily: 'lora',
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(50, 50),
      iconColor: MyColors.heading,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      foregroundColor: MyColors.heading,
      backgroundColor: MyColors.accent2, // Button background color
      textStyle: const TextStyle(
        fontFamily: 'montBold',
        fontSize: 16.0,
      ),
    ),
  ),
  cardColor: MyColors.heading,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: MyColors.heading,
    selectedItemColor: MyColors.accent1, // Color of the selected item
    unselectedItemColor: MyColors.text, // Color of the unselected items
    selectedIconTheme: IconThemeData(color: MyColors.accent1),
    unselectedIconTheme: IconThemeData(color: MyColors.text),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: MyColors.accent1,
    selectionColor: MyColors.accent1.withAlpha(128),
    selectionHandleColor: MyColors.accent1.withAlpha(128),
  ),
);
