import 'package:flutter/material.dart';

class DietScreen extends StatelessWidget {
  DietScreen({super.key});

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
              _buildDrawerItem(Icons.home, "Home"),
              _buildDrawerItem(Icons.settings, "Settings"),
              _buildDrawerItem(Icons.person, "Personal"),
              _buildDrawerItem(Icons.access_time, "Your activity"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Your Diet",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 18,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDietCard(
              title: "meal plan",
              onTap: () {
                // Navigate to meal plan
              },
            ),
            _buildDietCard(
              title: "supplements",
              onTap: () {
                // Navigate to supplements
              },
            ),
            _buildDietCard(
              title: "calorie\ntracker",
              onTap: () {
                // Navigate to calorie tracker
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {},
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