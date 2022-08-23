import 'package:flutter/material.dart';

const themeColor1 = Color(0xFFF2A007);
const themeColor2 = Color(0xFFF28705);
const themeColor3 = Color(0xFF8C8070);
const themeColor4 = Color(0xFFF2F2F2);
const themeColor5 = Color(0xFF0D0D0D);

ThemeData makeThemeLight() {
  const c1 = Color(0xFFF2A007);
  const c2 = Color(0xFFF28705);
  const c3 = Color(0xFF8C8070);
  const c4 = Color(0xFFF2F2F2);
  const c5 = Color(0xFF0D0D0D);

  const Color textColor = c4;

  TextTheme textTheme = TextTheme(
    titleLarge: const TextStyle(
        fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
    titleMedium: const TextStyle(
        fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
    titleSmall: const TextStyle(
        fontSize: 15, color: textColor, fontWeight: FontWeight.w500),
    bodyLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    bodyMedium: const TextStyle(fontSize: 16, color: textColor),
    bodySmall: TextStyle(
        fontSize: 12, color: c4.withOpacity(0.7), fontStyle: FontStyle.italic),
    labelMedium: TextStyle(
        fontSize: 12, color: c4.withOpacity(0.7), fontStyle: FontStyle.italic),
  );

  CardTheme cardTheme = const CardTheme(
    color: c4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
  );

  ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    primary: c5,
    onPrimary: c4,
    textStyle:
        const TextStyle(color: c4, fontWeight: FontWeight.w600, fontSize: 20),
  ));

  return ThemeData(
    cardTheme: cardTheme,
    scaffoldBackgroundColor: c3,
    colorScheme: ColorScheme.fromSeed(seedColor: c2),
    elevatedButtonTheme: elevatedButtonThemeData,
    textTheme: textTheme,
    useMaterial3: true,
  );
}
