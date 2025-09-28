//page 27

import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/progress_tracker_icon.png',
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Progress\nTracker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C1C1C),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          TabText('Workout'),
                          TabText('Skills', isSelected: true, selectedColor: Colors.black),
                          TabText('Metrics'),
                        ],
                      ),

                      const SizedBox(height: 24),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/basketball_icon.png',
                                height: 60,
                                width: 60,
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Shooting Accuracy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  value: 0.3,
                                  strokeWidth: 8,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ),
                              const Text(
                                '30%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      Row(
                        children: [
                          const Text(
                            'Shooting Form Improvement',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/icons/basketball_player_shooting.png',
                            height: 40,
                            width: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(
                          value: 0.65,
                          minHeight: 16,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD3D3D3)),
                        ),
                      ),

                      const SizedBox(height: 32),


                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/footwork.png',
                            height: 36,
                            width: 36,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Improvement in Footwork',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(
                          value: 0.3,
                          minHeight: 16,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD3D3D3)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),


              Center(
                child: Image.asset(
                  'assets/icons/potentia_logo.png',
                  height: 64, 
                  width: 64,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabText extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color selectedColor;

  const TabText(
    this.text, {
    this.isSelected = false,
    this.selectedColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: isSelected ? selectedColor : Colors.white,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
        decoration: isSelected ? TextDecoration.underline : null,
        decorationColor: Colors.black,
        decorationThickness: 2.0,
        fontSize: 16,
      ),
    );
  }
}