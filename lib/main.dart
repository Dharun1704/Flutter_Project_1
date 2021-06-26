import 'package:flutter/material.dart';
import 'package:induction_21_task1/screens/home_screen.dart';
import 'screens/lorrentz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.yellow,
      ),
      home: HomeScreen(),
    );
  }
}

