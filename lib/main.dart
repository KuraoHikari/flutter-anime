import 'package:flutter/material.dart'; // Importing material package for Flutter UI.
import 'package:jikan_anime/home_screen.dart'; // Importing http package for making HTTP requests.

void main() {
  runApp(const MyApp()); // Running the Flutter application.
}

// MyApp widget is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Anime Data Fetch', // Setting the title of the application.
      home: HomeScreen(), // Setting the home page of the application.
    );
  }
}
