import 'package:flutter/material.dart';

class list_submission extends StatelessWidget {
  const list_submission({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
            child: Text(
              'List Submission',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
          ),
    );
  }
}