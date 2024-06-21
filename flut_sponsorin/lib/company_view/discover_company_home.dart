import 'package:flut_sponsorin/components/upcoming_event_card.dart';
import 'package:flutter/material.dart';

class discover_company_home extends StatelessWidget {
  const discover_company_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: upcoming_events_card()),
    );
  }
}
