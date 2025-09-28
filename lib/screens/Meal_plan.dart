import 'package:flutter/material.dart';
import 'package:potentia/widgets/app_drawer.dart';
import 'package:potentia/widgets/app_bar.dart';
import 'package:potentia/services/navigation_service.dart';

class WeeklyMealPlanScreen extends StatelessWidget {
  WeeklyMealPlanScreen({super.key});

  final Color backgroundColor = const Color(0xFF232323);
  final List<String> weekDays = const [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(
        title: "Weekly meal plan",
        showDrawer: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: weekDays.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: _buildDayCard(weekDays[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildDayCard(String day) {
    return GestureDetector(
      onTap: () {
        NavigationService.safeNavigateTo(AppRoutes.dayMealPlan, featureName: "$day Meal Plan");
      },
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}