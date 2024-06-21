import 'package:flutter/material.dart';

class upcoming_events extends StatelessWidget {
  const upcoming_events({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
            child: Text(
              'upcoming Event',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
    );
  }
}