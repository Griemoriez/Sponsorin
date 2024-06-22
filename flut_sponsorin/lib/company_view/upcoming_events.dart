import 'package:flutter/material.dart';
import 'package:flut_sponsorin/components/overall_event_card.dart';
import 'package:flut_sponsorin/components/upcoming_event_card.dart';

class upcoming_events extends StatelessWidget {
  const upcoming_events({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      focusColor: Colors.orange,
                      labelText: 'Search',
                      hintText: 'irgl, ...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.orange)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming Events",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff008037),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(20)),
                          onPressed: () {},
                          child: Text(
                            "All Events",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
                upcoming_events_card(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Events",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff008037),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(20)),
                          onPressed: () {},
                          child: Text(
                            "Sort By",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
                overall_event_card()
              ],
            ),
          )),
    );
  }
}
