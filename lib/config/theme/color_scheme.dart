import 'package:flutter/material.dart';

const textColor = Color(0xFFd5e9f8);
const backgroundColor = Color(0xFF091015);
const primaryColor = Color(0xFFcfd4fd);
const primaryFgColor = Color(0xFF091015);
const secondaryColor = Color(0xFF441786);
const secondaryFgColor = Color(0xFFd5e9f8);
const accentColor = Color(0xFF662c8a);
const accentFgColor = Color(0xFFd5e9f8);

// ColorScheme for the whole app
const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
