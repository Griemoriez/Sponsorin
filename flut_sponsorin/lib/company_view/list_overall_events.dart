import 'package:flutter/material.dart';
import 'package:flut_sponsorin/models/event.dart'; // Import Event class
import 'package:flut_sponsorin/components/overall_event_card.dart'; // Import overall_event_card

class list_overall_events extends StatelessWidget {
  final List<Event> events; // Change EventData to Event
  const list_overall_events({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text.rich(
              TextSpan(
                style: TextStyle(
                  color: Color(0xff008037),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                text: 'Sponsor',
                children: [
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    text: 'in',
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10.0),
                const Text(
                  "All Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return overall_event_card(cardData: events[index]); // Pass Event object
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
