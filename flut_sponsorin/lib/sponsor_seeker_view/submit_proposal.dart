import 'package:flutter/material.dart';

class submit_proposal extends StatelessWidget {
  const submit_proposal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
            child: Text(
              'submit proposal',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
    );
  }
}