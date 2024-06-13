import 'package:flutter/material.dart';

class upload_status extends StatelessWidget {
  const upload_status({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
            child: Text(
              'Upload Status',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
    );
  }
}