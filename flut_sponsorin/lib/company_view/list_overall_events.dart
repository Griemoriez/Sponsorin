import 'package:flut_sponsorin/components/EventData.dart';
import 'package:flut_sponsorin/components/overall_event_card.dart';
import 'package:flutter/material.dart';

class list_overall_events extends StatelessWidget {
  final List<EventData> events;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All Events",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff008037),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(12)),
                      onPressed: () {},
                      child: const Text(
                        "Sort By",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return overall_event_card(cardData : events[index]);
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
