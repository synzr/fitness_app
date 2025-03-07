import 'package:fitness_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Source Sans 3'),
      title: 'Flutter Demo',
      home: const HomePage(apiBaseUrl: 'http://192.168.1.210:5000'),
    );
  }
}
