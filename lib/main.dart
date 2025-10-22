import 'package:flutter/material.dart';
import 'package:ui_design/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Design',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF101010),
      ),
      home: const HomePage(),
    );
  }
}