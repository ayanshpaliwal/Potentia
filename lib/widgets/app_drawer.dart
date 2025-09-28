import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = const Color(0xFF232323);
    
    return Drawer(
      backgroundColor: backgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // App Logo and Title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFED5E0D),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.fitness_center,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "POTENTIA",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              
              const Divider(color: Colors.white30),
              
              // Navigation Items
              _buildDrawerItem(
                context,
                Icons.dashboard,
                "Dashboard",
                '/home',
              ),
              _buildDrawerItem(
                context,
                Icons.fitness_center,
                "Workouts",
                '/workouts',
              ),
              _buildDrawerItem(
                context,
                Icons.restaurant,
                "Diet",
                '/diet',
              ),
              _buildDrawerItem(
                context,
                Icons.track_changes,
                "Goals",
                '/goals',
              ),
              _buildDrawerItem(
                context,
                Icons.star,
                "Achievements",
                '/achievements',
              ),
              _buildDrawerItem(
                context,
                Icons.trending_up,
                "Featured",
                '/featured',
              ),
              _buildDrawerItem(
                context,
                Icons.person,
                "Profile",
                '/profile',
              ),
              _buildDrawerItem(
                context,
                Icons.medical_services,
                "Supplements",
                '/supplements',
              ),
              _buildDrawerItem(
                context,
                Icons.calculate,
                "Calorie Tracker",
                '/calorie-tracker',
              ),
              _buildDrawerItem(
                context,
                Icons.calendar_month,
                "Meal Plan",
                '/meal-plan',
              ),
              
              const Divider(color: Colors.white30),
              
              // Settings and Help
              _buildDrawerItem(
                context,
                Icons.settings,
                "Settings",
                '/settings',
              ),
              _buildDrawerItem(
                context,
                Icons.security,
                "Safety",
                '/safety',
              ),
              _buildDrawerItem(
                context,
                Icons.analytics,
                "Metrics",
                '/metrics',
              ),
              _buildDrawerItem(
                context,
                Icons.logout,
                "Logout",
                null,
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title,
    String? route, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon, 
        color: isLogout ? Colors.red : Colors.white,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer first
        
        if (isLogout) {
          _handleLogout(context);
        } else if (route != null) {
          // Check if route exists before navigating
          try {
            Navigator.pushNamed(context, route);
          } catch (e) {
            // If route doesn't exist, show snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title feature coming soon!'),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        }
      },
    );
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF232323),
          title: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}