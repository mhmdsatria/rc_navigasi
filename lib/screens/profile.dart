import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Color(0xFF2F2D2C)), // Arrow Icon
        //   onPressed: () {
        //     Navigator.pop(context); // This will pop the current screen from the navigation stack
        //   },
        // ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2F2D2C), // Color of the title
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Make the body scrollable
        child: Center( // Center the entire content horizontally
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
              children: [
                // Profile Section
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/icon.jpg'), // Profile image
                ),
                SizedBox(height: 20),
                Text(
                  'Muhammad Satria',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2F2D2C),
                  ),
                ),
                Text(
                  'muhamadsatria@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),

                // Edit Profile Button
                ElevatedButton(
                  onPressed: () {
                    // No functionality yet for edit button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Equivalent to primary
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Options List (no navigation for now)
                Column(
                  children: [
                    _buildOption('My Orders'),
                    _buildOption('Payment Methods'),
                    _buildOption('Settings'),
                  ],
                ),
                SizedBox(height: 30),

                // Logout Button
                ElevatedButton(
                  onPressed: () {
                    // Add logout functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE74C3C), // Equivalent to primary
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String text) {
    return GestureDetector(
      onTap: () {
        // Handle option tap (e.g., navigate to a new screen later)
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFEAEAEA))),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2F2D2C),
          ),
        ),
      ),
    );
  }
}
