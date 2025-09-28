import 'package:flutter/material.dart';
import 'package:potentia/widgets/app_drawer.dart';
import 'package:potentia/widgets/app_bar.dart';
import 'package:potentia/services/navigation_service.dart';

class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      drawer: const AppDrawer(),
      appBar: CustomAppBar(
        title: "Personal Profile",
        showDrawer: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.settings, color: Color(0xFFED5E0D)),
              onPressed: () => NavigationService.showComingSoon("Settings"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Color.fromARGB(255, 208, 52, 4)),
              label: const Text('Edit', style: TextStyle(color: Color.fromARGB(255, 208, 52, 4))),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Name:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Bio:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryCard(Icons.fitness_center, "Strength", Colors.red),
                _buildCategoryCard(Icons.bolt, "Speed", Colors.blueAccent),
                _buildCategoryCard(Icons.directions_run, "Agility", Colors.orange),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[700]),
              child: const Text('View Detailed Stats'),
            ),
            const SizedBox(height: 16),
            _buildPersonalRecords(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildGoalsCard(
                    "Short Term Goals",
                    ["Run a 5k", "Deadlift 100kg", "Increase speed to xyz"],
                    ["Run a 10k", "Deadlift 120kg", "Eat healthy"],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildGoalsCard(
                    "Long Term Goals",
                    ["Run a 5k", "Deadlift 100kg", "Increase speed to xyz"],
                    ["Run a 10k", "Deadlift 120kg", "Eat healthy"],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Image.asset(
              'assets/icons/potentia_logo.png',
              height: 209,
              width: 123,
            ),

          ],
        ),
      ),
    );
  }

  static Widget _buildCategoryCard(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  static Widget _buildPersonalRecords() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Colors.grey, Colors.blueGrey],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Row(
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 28),
              const SizedBox(width: 8),
              const Text(
                "Your personal records", 
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 24, 
                  color: Colors.white
                ),
              ),
              const Spacer(),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, 
                ),
                child: const Center(
                  child: Icon(Icons.add, size: 18, color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text('1.', style: TextStyle(color: Colors.white70)),
          Text('2.', style: TextStyle(color: Colors.white70)),
          Text('3.', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildGoalsCard(String title, List<String> completedGoals, List<String> pendingGoals) {
  return Container(
    width: 160,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.grey[400],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Text(title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/dart_target.png', 
                height: 32,
                width: 32,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...completedGoals.map((goal) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Row(
            children: [
              const Icon(Icons.check_circle, size: 16, color: Colors.green),
              const SizedBox(width: 6),
              Flexible(
                child: Text(goal,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )),
        ...pendingGoals.map((goal) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Row(
            children: [
              const Icon(Icons.check, size: 16, color: Colors.red),
              const SizedBox(width: 6),
              Flexible(
                child: Text(goal,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        )),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 8),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 16, color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );
}
}