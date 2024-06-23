import 'package:flut_sponsorin/company_view/detail_submitted_events.dart';
import 'package:flutter/material.dart';
import 'package:flut_sponsorin/components/overall_event_card.dart';

class offered_proposal extends StatelessWidget {
  final List<Map<String, dynamic>> list_offered;
  offered_proposal({Key? key, required this.list_offered}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: list_offered.length,
          itemBuilder: (context, index) => overall_event_card(
            event_name: list_offered[index]['nama'],
            event_type: list_offered[index]['type'],
            event_location: list_offered[index]['location'],
            event_date: list_offered[index]['date'],
            event_status: list_offered[index]['status'],
          ),
        ));
  }
}
