//page 26

import 'package:flutter/material.dart';

class WorkoutProgressTrackerScreen extends StatelessWidget {
  const WorkoutProgressTrackerScreen({super.key});

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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            TabText('Workout', isSelected: true, selectedColor: Colors.black),
                            TabText('Skills'),
                            TabText('Metrics'),
                          ],
                        ),

                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Weekly:', style: labelStyle),
                            Text('Monthly:', style: labelStyle),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Center(
                          child: Text(
                            'Calories Burnt',
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildChartImage('progress_chart_placeholder.png'),
                            buildChartImage('progress_chart_placeholder.png'),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Center(
                          child: Text(
                            'Weight Lifted',
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildChartImage('bar_chart_placeholder.png'),
                            buildChartImage('bar_chart_placeholder.png'),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Center(
                          child: Text(
                            'Distance Covered',
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildChartImage('progress_chart_placeholder.png'),
                            buildChartImage('progress_chart_placeholder.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Image.asset(
                  'assets/icons/potentia_logo.png',
                  height: 64, width: 64,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildChartImage(String assetName) {
    return Image.asset(
      'assets/icons/$assetName',
      height: 100, 
      width: 100, 
      fit: BoxFit.contain,
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

const labelStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);