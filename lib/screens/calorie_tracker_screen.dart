import 'package:flutter/material.dart';
import 'MealCard.dart';

class CalorieTrackerScreen extends StatelessWidget {
  const CalorieTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Declare intake outside the LayoutBuilder
    final double intake = 17000;
    final double goal = 20000;

    return Scaffold(
      backgroundColor: Colors.grey[900], // Set background to dark grey
      appBar: AppBar(
        title: Text(
          'Calorie tracker',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(Icons.menu, color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daily calorie goal:',
                  style: TextStyle(fontSize: 16, color: Colors.white), // Label text in white
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ...[
              'breakfast',
              'Brunch',
              'lunch',
              'afternoon snack',
              'dinner',
            ].map((meal) => MealCard(meal: meal)),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly Calorie Intake',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Title text in white
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double barWidth = constraints.maxWidth * (intake / goal);

                            return Stack(
                              children: [
                                Container(
                                  width: constraints.maxWidth,
                                  height: 50,
                                  color: Colors.grey[700], // darker background for the bar
                                ),
                                Container(
                                  width: barWidth,
                                  height: 50,
                                  color: Colors.red[900],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      // Display the intake value dynamically
                      Text(
                        '$intake', // Now it uses the outer 'intake' variable
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
