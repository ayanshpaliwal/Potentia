import 'package:flutter/material.dart';
import 'package:potentia/widgets/app_drawer.dart';
import 'package:potentia/widgets/app_bar.dart';
import 'package:potentia/services/navigation_service.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(
        title: "Goals",
        showDrawer: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Goals", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFF6F0DE))),
                  const SizedBox(width: 8),
                  Image.asset("assets/icons/dart_target.png", height: 36)
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: buildGoalsCard(
                      
                      "Short Term Goals",
                      ["Run a 5k", "Deadlift 100kg", "Increase speed to xyz"],
                      ["Run a 10k", "Deadlift 120kg", "Eat healthy"],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildGoalsCard(
                      "Long Term Goals",
                      ["Run a 5k", "Deadlift 100kg", "Increase speed to xyz"],
                      ["Run a 10k", "Deadlift 120kg", "Eat healthy"],
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 20),
              buildProgressSection(),
              const SizedBox(height: 12),
              const SizedBox(height: 24),
              Image.asset(
                'assets/icons/potentia_logo.png',
                height: 209,
                width: 123,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGoalsCard(
    String title,
    List<String> completedGoals,
    List<String> incompleteGoals,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/icons/dart_target.png",
                  height: 22,
                  width: 22,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          ...completedGoals.map((goal) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),
          ...incompleteGoals.map((goal) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Row(
                  children: const [
                    Icon(Icons.check, color: Colors.red, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, bottom: 12),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.add, size: 18, color: Colors.grey[800]),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildProgressSection() {
  return Container(
    height: 600,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 120, 28, 28),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey[300]!),
    ),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 150),
          decoration: BoxDecoration(
            color: Colors.brown[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Goal: Run 5k in 30 minutes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),

        const SizedBox(height: 24),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Progress",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Image.asset("assets/icons/progress_ring.png", width: 175, height: 175),
                ],
              ),
            ),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Prioritize",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildPriorityToggle("High", true),
                  const SizedBox(height: 20),
                  _buildPriorityToggle("Medium", false),
                  const SizedBox(height: 20),
                  _buildPriorityToggle("Low", false),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Target date",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Image.asset("assets/icons/calendar.png", width: 175, height: 175),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Image.asset("assets/icons/checklist_target.png", width: 200, height: 200),
                ],
              )
            )
          ],
        ),


        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Set another goal now!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _buildPriorityToggle(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(selected ? Icons.circle : Icons.circle_outlined, size: 12, color: Colors.brown[900]),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}