import 'package:flutter/material.dart';

class detail_company extends StatelessWidget {
  const detail_company({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            // actions: [
            //   IconButton(onPressed: () {
            //   Navigator.pop(context);
            //   }, icon: Icon(Icons.arrow_back))
            // ],
            title: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Sponsorin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          body: Text("detail Company")
        ),
      ],
    );
  }
}