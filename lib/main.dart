import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FinTrackApp());
}

class FinTrackApp extends StatelessWidget {
  const FinTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinTrack',
      theme: ThemeData(
        primaryColor: Color(0xFF1D3557),
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF4A4E69)),
      ),
      home: const HomeScreen(),
    );
  }
}
