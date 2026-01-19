import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/portfolio_screen.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF00E5FF), // Cyan accent
        scaffoldBackgroundColor: const Color(0xFF0A0E21), // Deep dark blue
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF2979FF),
          surface: Color(0xFF1D1E33),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default, can be changed
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PortfolioScreen(),
      },
    );
  }
}
