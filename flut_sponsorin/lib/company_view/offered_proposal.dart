import 'package:flut_sponsorin/company_view/detail_submitted_events.dart';
import 'package:flut_sponsorin/components/EventData.dart';
import 'package:flutter/material.dart';
import 'package:flut_sponsorin/components/overall_event_card.dart';

class offered_proposal extends StatelessWidget {
  final List <EventData> listOffered;
  const offered_proposal({super.key, required this.listOffered});

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.transparent,
        // child: ListView.builder(
        //   itemCount: listOffered.length,
        //   itemBuilder: (context, index) => overall_event_card(cardData: listOffered[index],)
        //   ),
        );
  }
}
