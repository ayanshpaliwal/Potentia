import 'package:flutter/material.dart';
import 'package:potentia/widgets/app_drawer.dart';
import 'package:potentia/widgets/app_bar.dart';
import 'package:potentia/services/navigation_service.dart';

class DietScreen extends StatelessWidget {
  DietScreen({super.key});

  final Color backgroundColor = const Color(0xFF232323);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(
        title: "Your Diet",
        showDrawer: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDietCard(
              title: "meal plan",
              onTap: () {
                NavigationService.safeNavigateTo(AppRoutes.mealPlan, featureName: "Meal Plan");
              },
            ),
            _buildDietCard(
              title: "supplements",
              onTap: () {
                NavigationService.safeNavigateTo(AppRoutes.supplements, featureName: "Supplements");
              },
            ),
            _buildDietCard(
              title: "calorie\ntracker",
              onTap: () {
                NavigationService.safeNavigateTo(AppRoutes.calorieTracker, featureName: "Calorie Tracker");
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildDietCard({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 160,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5DC), // Beige background for your images
                borderRadius: BorderRadius.circular(16),
              ),
              // You can add your Image.asset here like:
              // child: Image.asset('your_image_path'),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}