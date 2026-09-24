
import 'package:flutter/material.dart';
import 'config.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(const DardashApp());

class DardashApp extends StatelessWidget {
  const DardashApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0A15),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7657F0),
          brightness: Brightness.dark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF19172A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF171526),
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}
