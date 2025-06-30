import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potentia/screens/Safety.dart';
import 'package:potentia/screens/achievements_page.dart';
import 'package:potentia/screens/calorie_tracker_screen.dart';
import 'package:potentia/screens/MealCard.dart';
import 'package:potentia/screens/Metrics_page.dart';
import 'package:potentia/screens/muscle_gain_page.dart';
import 'package:potentia/screens/dashboard.dart';
import 'package:potentia/screens/Diet_page.dart';
import 'package:potentia/screens/Meal_plan.dart';
import 'package:potentia/screens/Day_meal_plan.dart';
import 'package:potentia/screens/Suppliments_page.dart';
import 'package:potentia/screens/workout_routins.dart';
import 'package:potentia/screens/featured_page.dart';
import 'package:potentia/screens/rest_days.dart';

void main() {
  runApp(MaterialApp(
    home: RestDaysPage(),
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
    );
  }
}
