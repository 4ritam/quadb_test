import 'package:flutter/material.dart';
import 'package:quadb_test/config/theme/color_scheme.dart';

import 'src/views/splash_screen.dart';

/// The main entry point for the application.
void main() {
  runApp(const MainApp());
}

/// The root widget of the application.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: colorScheme),
      home: const SplashScreen(),
    );
  }
}
