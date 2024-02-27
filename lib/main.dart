import 'package:flutter/material.dart';
import 'package:nic_project/Screens/StarterScreens/SplashScreen.dart';
// import 'package:nic_project/surah_screen.dart';
// import 'package:your_project_name/surah_screen.dart'; // Assuming surah_screen.dart exists

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        // Apply your desired theme settings here
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        // Add other routes here for AyatScreen or other features
      },
    );
  }
}
