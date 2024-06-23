import 'package:flut_sponsorin/company_view/detail_submitted_events.dart';
import 'package:flut_sponsorin/components/overall_event_card.dart';
import 'package:flutter/material.dart';

class submitted_proposal extends StatelessWidget {
  final List<Map<String, dynamic>> list_submitted;
  submitted_proposal({Key? key, required this.list_submitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: ListView.builder(
            itemCount: list_submitted.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detail_submitted_events(
                                  data: list_submitted[index],
                                )));
                  },
                  child: overall_event_card(
                      event_name: list_submitted[index]['nama'],
                      event_type: list_submitted[index]['type'],
                      event_location: list_submitted[index]['location'],
                      event_date: list_submitted[index]['date'],
                      event_status: list_submitted[index]['status'],),
                )));
  }
}
