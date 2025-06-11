import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                meal,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                onPressed: () {
                  // TODO: handle button press
                  print('Add item to $meal');
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 28,
                ),
                splashRadius: 24, // Optional: makes tap area cleaner
              ),
            ),
          ],
        ),
      ),
    );
  }
}