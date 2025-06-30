import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potentia/screens/workout_routins.dart';

void main() {
  runApp(WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Routines App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Primary theme setup
        primarySwatch: Colors.red,
        primaryColor: Color(0xFF8B4513),
        scaffoldBackgroundColor: Color(0xFF2D2D2D),

        // App bar theme
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF2D2D2D),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),

        // Text theme
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        // Button themes
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8B4513),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        // Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF8B4513)),
          ),
        ),

        // SnackBar theme
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Color(0xFF8B4513),
          contentTextStyle: TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      ),

      // Set the home page to WorkoutRoutinesPage
      home: WorkoutRoutinesPage(),
      // Define routes for navigation
      routes: {
        '/home': (context) => WorkoutRoutinesPage(),
        '/basketball': (context) => RoutinePage(routineType: 'Basketball'),
        '/football': (context) => RoutinePage(routineType: 'Football'),
        '/mobility': (context) => RoutinePage(routineType: 'Mobility'),
        '/strength': (context) => RoutinePage(routineType: 'Strength Training'),
      },
    );
  }
}

// Basic RoutinePage class to handle navigation
class RoutinePage extends StatelessWidget {
  final String routineType;

  const RoutinePage({Key? key, required this.routineType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$routineType Workout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$routineType Routines',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This is where $routineType workouts will be displayed.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Main'),
            ),
          ],
        ),
      ),
    );
  }
}