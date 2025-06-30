import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedPage extends StatelessWidget {
  const FeaturedPage({Key? key}) : super(key: key);

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Section
              const Text(
                'FEATURED',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),

              // Featured Cards Row
              Row(
                children: [
                  // Tips Card
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _launchURL('https://example.com/tips'),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF4A9B8E),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Container(
                                    color: const Color(0xFF4A9B8E),
                                    child: const Center(
                                      child: Icon(
                                        Icons.lightbulb_outline,
                                        size: 50,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xFF8B4A4A),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Tips',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  // Announcements Card
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _launchURL('https://example.com/announcements'),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  color: Color(0xFF5A6B7A),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.sports_soccer,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xFF8B4A4A),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Announcements',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  // Events Card
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _launchURL('https://example.com/events'),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  color: Color(0xFFD4843A),
                                ),
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Icon(
                                        Icons.sports_football,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'SPORTS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFD4843A),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xFF8B4A4A),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Events',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Trending Section
              const Text(
                'Trending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Trending Card
              GestureDetector(
                onTap: () => _launchURL('https://example.com/trending'),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF4A4A4A),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: const Color(0xFF6B4A4A),
                          child: const Center(
                            child: Icon(
                              Icons.trending_up,
                              size: 60,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '"Unstoppable!\n[Athlete/Team Name]\nbreaks records in a jaw-\ndropping [event name], leaving fans speechless\n—catch the highlights now!"',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Your Challenges Section
              const Text(
                'Your Challenges',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Challenges Row
              Row(
                children: [
                  // Left Column - Challenge Buttons
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        // Follow meal plan button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _launchURL('https://example.com/meal-plan'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B4A4A),
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Follow meal plan\nfor a week',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Complete 3 workouts button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _launchURL('https://example.com/workouts'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B4A4A),
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Complete 3\nworkouts',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Additional challenge buttons
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _launchURL('https://example.com/challenge3'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B4A4A),
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Daily Challenge',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _launchURL('https://example.com/challenge4'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B4A4A),
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Weekly Goal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Right Column - Images
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // Food image
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFF6B4A4A),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const Center(
                              child: Icon(
                                Icons.restaurant,
                                size: 50,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Workout image
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFF6B4A4A),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: const Center(
                              child: Icon(
                                Icons.fitness_center,
                                size: 50,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}