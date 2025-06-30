import 'package:flutter/material.dart';

class MealPlanScreen extends StatelessWidget {
  MealPlanScreen({super.key});

  final Color backgroundColor = const Color(0xFF232323);

  // Editable meal data - you can modify these for different days
  final List<MealData> meals = [
    MealData(
      mealType: "BREAKFAST",
      foodName: "greek yogurt\nwith fruits",
      calories: "200",
      proteins: "15g",
      carbs: "24g",
      fats: "5g",
      imagePath: "assets/breakfast.png", // Replace with your image
    ),
    MealData(
      mealType: "MID-MORNING SNACK",
      foodName: "banana and\nalmonds",
      calories: "180",
      proteins: "4g",
      carbs: "18g",
      fats: "8g",
      imagePath: "assets/snack1.png", // Replace with your image
    ),
    MealData(
      mealType: "LUNCH",
      foodName: "ceaser salad",
      calories: "350",
      proteins: "35g",
      carbs: "15g",
      fats: "12g",
      imagePath: "assets/lunch.png", // Replace with your image
    ),
    MealData(
      mealType: "AFTERNOON SNACK",
      foodName: "Protein Bar",
      calories: "200",
      proteins: "15g",
      carbs: "20g",
      fats: "10g",
      imagePath: "assets/snack2.png", // Replace with your image
    ),
    MealData(
      mealType: "DINNER",
      foodName: "Grill chicken and\nvegetables",
      calories: "500",
      proteins: "45g",
      carbs: "70g",
      fats: "12g",
      imagePath: "assets/dinner.png", // Replace with your image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "MENU",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const Divider(color: Colors.white),
              _buildDrawerItem(Icons.home, "Home"),
              _buildDrawerItem(Icons.settings, "Settings"),
              _buildDrawerItem(Icons.person, "Personal"),
              _buildDrawerItem(Icons.access_time, "Your activity"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          "Monday",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 18,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _buildMealCard(meals[index]),
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {},
    );
  }

  Widget _buildMealCard(MealData meal) {
    return GestureDetector(
      onTap: () {
        // Handle meal card tap
        print("Tapped on ${meal.mealType}");
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Meal Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[700], // Placeholder background
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.fastfood,
                color: Colors.white54,
                size: 40,
              ),
              // Uncomment below to use actual images:
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(12),
              //   child: Image.asset(
              //     meal.imagePath,
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            const SizedBox(width: 16),
            // Meal Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.mealType,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    meal.foodName,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Nutrition Info
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Calories: ${meal.calories}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "carbs:${meal.carbs}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Protiens: ${meal.proteins}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "Fats: ${meal.fats}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
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
          ],
        ),
      ),
    );
  }
}

// Data model for meals - easy to edit and customize
class MealData {
  final String mealType;
  final String foodName;
  final String calories;
  final String proteins;
  final String carbs;
  final String fats;
  final String imagePath;

  MealData({
    required this.mealType,
    required this.foodName,
    required this.calories,
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.imagePath,
  });
}