import 'package:flutter/material.dart';
import 'home.dart'; // Import halaman home

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/kopi.png',
            fit: BoxFit.cover,
          ),
          // Overlay with content
          Container(
            color: Colors.black.withOpacity(0.5), // Transparent black overlay
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Place children at the bottom
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0), // Padding for the text and button
                  child: Column(
                    children: [
                      Text(
                        'Coffee so good, your taste buds will love it.',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'The best grain, the finest roast, the powerful flavor.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Navigasi ke halaman Home
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD2691E), // Coffee color
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
    );
  }
}
