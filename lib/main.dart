import 'package:flutter/material.dart';
import 'screens/getStarted.dart'; // Import file GetStarted
import 'screens/home.dart'; // Import file HomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetStartedPage(), // Menjadikan GetStartedPage sebagai halaman pertama
      routes: {
        '/home': (context) => const CoffeeHomePage(), // Menambahkan rute untuk halaman HomePage
      },
    );
  }
}
