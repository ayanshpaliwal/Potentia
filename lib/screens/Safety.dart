import 'package:flutter/material.dart';

class YourSafetyApp extends StatelessWidget {
  const YourSafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Safety',
      debugShowCheckedModeBanner: false,
      home: YourSafetyPage(),
    );
  }
}

class YourSafetyPage extends StatelessWidget {
  YourSafetyPage({super.key});

  final Color backgroundColor = const Color(0xFF232323); // Dark background
  final Color tileColor = const Color(0xFFF8F6ED); // Light cream tile background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: const Drawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              // Centered Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Your Safety',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black45,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Safety Options
              Expanded(
                child: ListView(
                  children: [
                    safetyOption(
                      iconPath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/injury_prevention.png',
                      label: 'injury\nprevention',
                    ),
                    const SizedBox(height: 24),
                    safetyOption(
                      iconPath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/firstaid_chatbot.png',
                      label: 'first aid chatbot',
                    ),
                    const SizedBox(height: 24),
                    safetyOption(
                      iconPath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/common_injuries.png',
                      label: 'common injuries',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget safetyOption({required String iconPath, required String label}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(20),
          height: 140,
          width: 140,
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1.2,
            shadows: [
              Shadow(
                blurRadius: 2.0,
                color: Colors.black38,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}