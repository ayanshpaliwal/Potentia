import 'package:flutter/material.dart';

class RecoveryGainPage extends StatelessWidget {
  const RecoveryGainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: AppBar(
        title: Text(
          'Muscle gain',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MuscleItem(
              imagePath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/Whey.png',
              title: 'Whey Protein',
              benefits: 'Supports muscle recovery and growth',
              dosage: '30g post-workout or as advised',
              price: 'Rs. 1000-3000 per kg',
              buyLink: 'https://example.com/whey',
            ),
            MuscleItem(
              imagePath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/creatine.png',
              title: 'Creatine',
              benefits: 'Helps increase muscle power and strength',
              dosage: '20-25g per day, divided into 4-5 smaller doses',
              price: 'Rs. 500-1100 per kg',
              buyLink: 'https://example.com/creatine',
            ),
            MuscleItem(
              imagePath: '/Users/ashishpaliwal/AndroidStudioProjects/Potentia/lib/assets/glutamine.png',
              title: 'Glutamine',
              benefits: 'Supports muscle recovery and immune function',
              dosage: '30g post-workout or as advised',
              price: 'Rs. 500-1500 per kg',
              buyLink: 'https://example.com/glutamine',
            ),
          ],
        ),
      ),
    );
  }
}

class MuscleItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String benefits;
  final String dosage;
  final String price;
  final String buyLink;

  const MuscleItem({super.key,
    required this.imagePath,
    required this.title,
    required this.benefits,
    required this.dosage,
    required this.price,
    required this.buyLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4),
                  Text('Benefits: $benefits', style: TextStyle(color: Colors.white)),
                  Text('Dosage: $dosage', style: TextStyle(color: Colors.white)),
                  Text('Price: $price', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 4),
                  GestureDetector(
                    child: Text(
                      'buy now',
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
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
