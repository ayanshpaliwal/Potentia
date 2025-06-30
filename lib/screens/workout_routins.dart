import 'package:flutter/material.dart';

class WorkoutRoutinesPage extends StatefulWidget {
  @override
  _WorkoutRoutinesPageState createState() => _WorkoutRoutinesPageState();
}

class _WorkoutRoutinesPageState extends State<WorkoutRoutinesPage> {
  // Form controllers for log workout section
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String _selectedSets = '3';
  String _selectedReps = '10';
  String _selectedWeights = '50 lbs';

  // Plan creation state
  String? _selectedWorkoutType;
  int? _selectedDuration;
  String? _selectedTargetArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D2D),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2D2D),
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text(
          'Workout\nRoutines',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  suffixIcon: Icon(Icons.close, color: Colors.grey[400]),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Predefined Routines Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Predefined Routines',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildRoutineButton(
                          'Basketball\nWorkouts',
                          '🏀',
                              () => _navigateToRoutine('Basketball'),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildRoutineButton(
                          'Football\nWorkouts',
                          '⚽',
                              () => _navigateToRoutine('Football'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildRoutineButton(
                          'Mobility\nExercises',
                          '🤸',
                              () => _navigateToRoutine('Mobility'),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildRoutineButton(
                          'Strength\nTraining',
                          '🏋️',
                              () => _navigateToRoutine('Strength'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Custom Routine Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Custom Routine',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: _showCreatePlanDialog,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF8B4513),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '▷ Create Your Plan! ▷',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Log Workout Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Log Workout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.settings, color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Add notes button
                      Container(
                        width: 120,
                        height: 120,
                        child: ElevatedButton(
                          onPressed: _showNotesDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[600],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Add notes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      // Right side - Form fields and calendar
                      Expanded(
                        child: Column(
                          children: [
                            _buildDropdownField('Exercise Name', _exerciseController.text.isEmpty ? 'Select Exercise' : _exerciseController.text),
                            SizedBox(height: 8),
                            _buildDropdownField('Sets', _selectedSets),
                            SizedBox(height: 8),
                            _buildDropdownField('Reps', _selectedReps),
                            SizedBox(height: 8),
                            _buildDropdownField('Weights', _selectedWeights),
                            SizedBox(height: 16),
                            // Calendar widget
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'JANUARY                    2024',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GridView.builder(
                                      padding: EdgeInsets.all(4),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        childAspectRatio: 1,
                                      ),
                                      itemCount: 31,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
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

  Widget _buildRoutineButton(String title, String emoji, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label: $value',
            style: TextStyle(fontSize: 12),
          ),
          Icon(Icons.arrow_drop_down, size: 20),
        ],
      ),
    );
  }

  void _navigateToRoutine(String routineType) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to $routineType routine')),
    );
    // Navigate to specific routine page
  }

  void _showNotesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Workout Notes'),
        content: TextField(
          controller: _notesController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Enter your workout notes here...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notes saved!')),
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showCreatePlanDialog() {
    setState(() {
      _selectedWorkoutType = null;
      _selectedDuration = null;
      _selectedTargetArea = null;
    });

    _showStep1Dialog();
  }

  void _showStep1Dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF8B4513),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Create Your Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'STEP 1\nSELECT WORKOUT TYPE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              _buildWorkoutTypeOption(
                'Strength Training:',
                ['Weightlifting', 'Bodyweight Exercises', 'Powerlifting', 'Olympic Lifting', 'Functional Training'],
                '🏋️',
                'Strength Training',
              ),
              SizedBox(height: 12),
              _buildWorkoutTypeOption(
                'Mobility:',
                ['Stretching', 'Yoga', 'Pilates', 'Foam Rolling / Self-Myofascial', 'Release Flexibility'],
                '🤸',
                'Mobility',
              ),
              SizedBox(height: 12),
              _buildWorkoutTypeOption(
                'Sport Specific:',
                ['Football', 'Basketball'],
                '⚽🏀',
                'Sport Specific',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutTypeOption(String title, List<String> items, String emoji, String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedWorkoutType = type;
        });
        Navigator.pop(context);
        _showStep2Dialog();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF8B4513),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  ...items.map((item) => Text(
                    '• $item',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  )).toList(),
                ],
              ),
            ),
            Text(
              emoji,
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }

  void _showStep2Dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.purple, width: 3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF8B4513),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Create Your Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'STEP 2\nSET WORKOUT DURATION',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              _buildDurationOption(30),
              SizedBox(height: 12),
              _buildDurationOption(60),
              SizedBox(height: 12),
              _buildDurationOption(90),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDurationOption(int minutes) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDuration = minutes;
        });
        Navigator.pop(context);
        _showStep3Dialog();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF8B4513),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Center(
                child: Text(
                  '$minutes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Text(
              'MINUTES',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStep3Dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF8B4513),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Create Your Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'STEP 3\nADD TARGET AREA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              _buildTargetAreaOption(
                'Upper Body',
                ['Arms', 'Shoulders', 'Chest'],
                ['💪', '🤲', '👤'],
                'Upper Body',
              ),
              SizedBox(height: 12),
              _buildTargetAreaOption(
                'Lower Body',
                ['Legs', 'Glutes', 'Calves'],
                ['🦵', '🏋️', '🤸'],
                'Lower Body',
              ),
              SizedBox(height: 12),
              _buildTargetAreaOption(
                'Full Body',
                ['Upper body', 'Core and Stability', 'Lower body'],
                ['🏋️', '🤸', '🏋️'],
                'Full Body',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTargetAreaOption(String title, List<String> areas, List<String> emojis, String targetArea) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTargetArea = targetArea;
        });
        Navigator.pop(context);
        _showStep4Dialog();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF8B4513),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(areas.length, (index) {
                return Column(
                  children: [
                    Text(
                      emojis[index],
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(height: 4),
                    Text(
                      areas[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _showStep4Dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF8B4513),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Create Your Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'STEP 4\nYOU\'RE ALL DONE!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF8B4513),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YOUR PLAN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Workout Type: ${_selectedWorkoutType ?? "Not selected"}\n'
                          'Duration: ${_selectedDuration ?? "Not selected"} minutes\n'
                          'Target Area: ${_selectedTargetArea ?? "Not selected"}\n\n'
                          'A brief summary of all the selected options',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  _buildActionButton('Save Plan', Colors.white, Colors.black, () {
                    Navigator.pop(context);
                    _savePlan();
                  }),
                  SizedBox(height: 8),
                  _buildActionButton('Sync With Calendar', Colors.white, Colors.black, () {
                    Navigator.pop(context);
                    _syncWithCalendar();
                  }),
                  SizedBox(height: 8),
                  _buildActionButton('Delete Plan', Color(0xFF8B4513), Colors.black, () {
                    Navigator.pop(context);
                    _deletePlan();
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, Color backgroundColor, Color textColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[400]!),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _savePlan() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Plan saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _syncWithCalendar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Plan synced with calendar!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _deletePlan() {
    setState(() {
      _selectedWorkoutType = null;
      _selectedDuration = null;
      _selectedTargetArea = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Plan deleted!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    _exerciseController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}