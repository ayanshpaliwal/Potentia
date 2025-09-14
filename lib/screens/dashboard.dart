import 'package:flutter/material.dart';



class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<String> weekDays = const ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final List<int> dates = const [8, 9, 10, 11, 12, 13, 14];
  final Color backgroundColor = const Color(0xFF232323);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
              radius: 18,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(
            height: 80, // Increased height to accommodate content
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekDays.length,
              itemBuilder: (context, index) {
                bool isSelected = dates[index] == 12;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Added to prevent overflow
                    children: [
                      Text(
                        weekDays[index],
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjusted padding
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.red : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          dates[index].toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Recent Activity",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Friday 12, 2024",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildStepsCard(),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildFeatureCard("Diet", "assets/diet.png"),
              _buildFeatureCard("Safety", "assets/safety.png"),
              _buildFeatureCard("Analytics", "assets/analytics.png"),
              _buildFeatureCard("Workout", "assets/workout.png"),
            ],
          ),
        ],
      ),
    );
  }

  

  Widget _buildStepsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "STEPS",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            "3781 STEPS",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 4),
          Text(
            "3:24 PM  /  23456KAL",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(imagePath)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}