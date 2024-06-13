import 'package:flut_sponsorin/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
<<<<<<< Updated upstream
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
=======
      debugShowCheckedModeBanner: false,
      title: 'SponsorIn',
      home: homePage(),
>>>>>>> Stashed changes
    );
  }
}
