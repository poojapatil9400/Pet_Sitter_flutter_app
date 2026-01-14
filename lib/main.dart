import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';


void main() {
  runApp(const PetSitterApp());
}

class PetSitterApp extends StatelessWidget {
  const PetSitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Sitter',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
      ),
      home: const HomeScreen(),
    );
  }
}
