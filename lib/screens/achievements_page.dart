import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Achievements 🏆',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildRecordsSection(),
            const SizedBox(height: 20),
            _buildCategoryCard(
              title: 'Workout',
              imagePath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/workout.png',
              items: ['Title: Description', 'Title: Description', 'Title: Description'],
            ),
            const SizedBox(height: 20),
            _buildCategoryCard(
              title: 'Diet',
              imagePath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/diet.png',
              items: ['Title: Description', 'Title: Description', 'Title: Description'],
            ),
            const SizedBox(height: 20),
            _buildCategoryCard(
              title: 'Skills',
              imagePath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/sport.png',
              items: ['Title: Description', 'Title: Description', 'Title: Description'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.grey, Colors.white70],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white24,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.emoji_events, size: 50, color: Colors.amber),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Your personal records',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text('1.\n2.\n3.', style: TextStyle(color: Colors.black87)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline, color: Colors.black87),
            splashRadius: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String imagePath,
    required List<String> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF79241C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400, width: 3),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        const Icon(Icons.verified, color: Colors.white, size: 24),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 120,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
