import 'package:flutter/material.dart';
import 'package:jmp_3/home_page.dart';
import 'package:jmp_3/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: LoginPage()),
    );
  }
}
