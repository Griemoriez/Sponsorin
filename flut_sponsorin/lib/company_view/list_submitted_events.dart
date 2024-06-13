import 'package:flutter/material.dart';

class list_submitted_events extends StatelessWidget {
  const list_submitted_events({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
            child: Text(
              'List Submitted',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
    );
  }
}