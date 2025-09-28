import 'package:flutter/material.dart';
import 'package:potentia/screens/login_page.dart';
import 'package:potentia/screens/create_account_page.dart';
import 'package:potentia/screens/home_page.dart';
import 'package:potentia/screens/dashboard.dart';
import 'package:potentia/screens/workout_routins.dart';
import 'package:potentia/screens/Diet_page.dart';
import 'package:potentia/screens/goals_page.dart';
import 'package:potentia/screens/achievements_page.dart';
import 'package:potentia/screens/featured_page.dart';
import 'package:potentia/screens/personal_profile_page.dart';
import 'package:potentia/screens/Suppliments_page.dart';
import 'package:potentia/screens/calorie_tracker_screen.dart';
import 'package:potentia/screens/Meal_plan.dart';
import 'package:potentia/screens/Day_meal_plan.dart';
import 'package:potentia/screens/Safety.dart';
import 'package:potentia/screens/Metrics_page.dart';
import 'package:potentia/screens/muscle_gain_page.dart';
import 'package:potentia/screens/recovery_gain_page.dart';
import 'package:potentia/screens/endurance_gain_page.dart';
import 'package:potentia/screens/workout_progress.dart';
import 'package:potentia/screens/skills_progress.dart';
import 'package:potentia/screens/rest_days.dart';
import 'package:potentia/screens/welcome_back_screen.dart';
import 'package:potentia/services/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Potentia',
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF232323),
          selectedItemColor: Color(0xFFED5E0D),
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: AppRoutes.login,
      routes: {
        // Authentication routes
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.createAccount: (context) => const CreateAccountPage(),
        
        // Main app routes
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.dashboard: (context) => DashboardScreen(),
        
        // Workout routes
        AppRoutes.workouts: (context) => WorkoutRoutinesPage(),
        AppRoutes.workoutProgress: (context) => const WorkoutProgressTrackerScreen(),
        AppRoutes.skillsProgress: (context) => const SkillsScreen(),
        AppRoutes.restDays: (context) => const RestDaysPage(),
        
        // Diet routes
        AppRoutes.diet: (context) => DietScreen(),
        AppRoutes.mealPlan: (context) => WeeklyMealPlanScreen(),
        AppRoutes.dayMealPlan: (context) => MealPlanScreen(),
        AppRoutes.calorieTracker: (context) => const CalorieTrackerScreen(),
        
        // Goals and achievements routes
        AppRoutes.goals: (context) => const GoalsScreen(),
        AppRoutes.achievements: (context) => const AchievementsPage(),
        
        // Profile and personal routes
        AppRoutes.profile: (context) => const PersonalProfilePage(),
        AppRoutes.featured: (context) => const FeaturedPage(),
        
        // Supplements routes
        AppRoutes.supplements: (context) => SupplimentsPage(),
        AppRoutes.muscleGain: (context) => const MuscleGainPage(),
        AppRoutes.recovery: (context) => const RecoveryGainPage(),
        AppRoutes.endurance: (context) => const EnduranceGainPage(),
        
        // Utility routes
        AppRoutes.safety: (context) => const SafetyPage(),
        AppRoutes.metrics: (context) => const MetricsPage(),
        AppRoutes.welcomeBack: (context) => const WelcomeBackScreen(),
      },
    );
  }
}
