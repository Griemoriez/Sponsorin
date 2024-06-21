import 'package:flut_sponsorin/components/upcoming_event_card.dart';
import 'package:flutter/material.dart';

class discover_company_home extends StatefulWidget {
  const discover_company_home({super.key});

  @override
  State<discover_company_home> createState() => _discover_company_homeState();
}

class _discover_company_homeState extends State<discover_company_home> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
            child: Text(
              'Discovery Home',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
    );
  }
}
