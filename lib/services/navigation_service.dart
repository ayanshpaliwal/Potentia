import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigation methods
  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateAndReplace(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateAndRemoveUntil(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void goBack() {
    return navigatorKey.currentState!.pop();
  }

  static bool canGoBack() {
    return navigatorKey.currentState!.canPop();
  }

  static void showComingSoon(String featureName) {
    final context = navigatorKey.currentState!.context;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$featureName feature coming soon!'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFFED5E0D),
      ),
    );
  }

  // Show error message
  static void showError(String message) {
    final context = navigatorKey.currentState!.context;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Show success message
  static void showSuccess(String message) {
    final context = navigatorKey.currentState!.context;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Safe navigation with error handling
  static void safeNavigateTo(String routeName, {Object? arguments, String? featureName}) {
    try {
      navigateTo(routeName, arguments: arguments);
    } catch (e) {
      showComingSoon(featureName ?? 'This');
    }
  }
}

// Route names constants
class AppRoutes {
  static const String login = '/login';
  static const String createAccount = '/create_account';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String workouts = '/workouts';
  static const String diet = '/diet';
  static const String goals = '/goals';
  static const String achievements = '/achievements';
  static const String featured = '/featured';
  static const String profile = '/profile';
  static const String supplements = '/supplements';
  static const String calorieTracker = '/calorie-tracker';
  static const String mealPlan = '/meal-plan';
  static const String dayMealPlan = '/day-meal-plan';
  static const String settings = '/settings';
  static const String safety = '/safety';
  static const String metrics = '/metrics';
  static const String muscleGain = '/muscle-gain';
  static const String recovery = '/recovery';
  static const String endurance = '/endurance';
  static const String workoutProgress = '/workout-progress';
  static const String skillsProgress = '/skills-progress';
  static const String restDays = '/rest-days';
  static const String welcomeBack = '/welcome-back';
}