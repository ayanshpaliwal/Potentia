import 'package:flutter/material.dart';
import 'package:potentia/screens/Safety.dart';
import 'package:potentia/screens/achievements_page.dart';
import 'package:potentia/screens/calorie_tracker_screen.dart';
import 'package:potentia/screens/MealCard.dart';
import 'package:potentia/screens/Metrics_page.dart';
import 'package:potentia/screens/muscle_gain_page.dart';

void main() {
  runApp(MaterialApp(
    home: YourSafetyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Potentia',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: CalorieTrackerScreen(),
    );
  }
}
