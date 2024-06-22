import 'package:flutter/material.dart';

class list_company extends StatelessWidget {
  const list_company({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
            child: Text(
              'List Company',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
    );
  }
}