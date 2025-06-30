import 'package:flutter/material.dart';
import 'package:potentia/screens/muscle_gain_page.dart';
import 'package:potentia/screens/endurance_gain_page.dart';
import 'package:potentia/screens/recovery_gain_page.dart';

class SupplimentsPage extends StatelessWidget {
  SupplimentsPage({super.key});

  final Color backgroundColor = const Color(0xFF232323);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "MENU",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const Divider(color: Colors.white),
              _buildDrawerItem('assets/home.png', "Home"),
              _buildDrawerItem('assets/settings.png', "Settings"),
              _buildDrawerItem('assets/personal.png', "Personal"),
              _buildDrawerItem('assets/activity.png', "Your activity"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MuscleGainPage()),
              ),
            ),
            const SizedBox(height: 20),
            _buildGoalButton(
              context,
              imagePath: 'assets/recovery.png',
              label: "Recovery",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecoveryGainPage()),
              ),
            ),
            const SizedBox(height: 20),
            _buildGoalButton(
              context,
              imagePath: 'assets/endurance.png',
              label: "Endurance",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EnduranceGainPage()),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String imagePath, String title) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 24,
        height: 24,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {},
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
