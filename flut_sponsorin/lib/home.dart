import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
                child: Text(
              "Sponsorin",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        body : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.green.shade100,
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            Icon(
              Icons.business,
              color: Colors.white,
            ),
            Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            Icon(
              Icons.insert_drive_file,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
          color: Colors.black87,
          backgroundColor: Colors.transparent,
        ));
  }
}
