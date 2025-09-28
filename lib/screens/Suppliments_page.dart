import 'package:flutter/material.dart';
import 'package:potentia/screens/muscle_gain_page.dart';
import 'package:potentia/screens/endurance_gain_page.dart';
import 'package:potentia/screens/recovery_gain_page.dart';
import 'package:potentia/widgets/app_drawer.dart';
import 'package:potentia/widgets/app_bar.dart';
import 'package:potentia/services/navigation_service.dart';

class SupplimentsPage extends StatelessWidget {
  SupplimentsPage({super.key});

  final Color backgroundColor = const Color(0xFF232323);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(
        title: "Supplements",
        showDrawer: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Recommended\nsuppliments",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w300,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              "Select goal",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 40),
            _buildGoalButton(
              context,
              imagePath: 'assets/muscle_gain.png',
              label: "Muscle gain",
              onTap: () => NavigationService.safeNavigateTo(AppRoutes.muscleGain, featureName: "Muscle Gain"),
            ),
            const SizedBox(height: 20),
            _buildGoalButton(
              context,
              imagePath: 'assets/recovery.png',
              label: "Recovery",
              onTap: () => NavigationService.safeNavigateTo(AppRoutes.recovery, featureName: "Recovery"),
            ),
            const SizedBox(height: 20),
            _buildGoalButton(
              context,
              imagePath: 'assets/endurance.png',
              label: "Endurance",
              onTap: () => NavigationService.safeNavigateTo(AppRoutes.endurance, featureName: "Endurance"),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }


  Widget _buildGoalButton(
      BuildContext context, {
        required String imagePath,
        required String label,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
