import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flut_sponsorin/company_view/list_overall_events.dart';
import 'package:flut_sponsorin/models/event.dart';
import 'package:flut_sponsorin/components/upcoming_event_card.dart';

class upcoming_events extends StatefulWidget {
  const upcoming_events({super.key});

  @override
  State<upcoming_events> createState() => _upcoming_eventsState();
}

class _upcoming_eventsState extends State<upcoming_events> {
  List<Event> cardData = [];
  List<Event> filteredCardData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    var eventBox = await Hive.openBox<Event>('eventBox');
    List<Event> tempCardData = eventBox.values.toList();

    setState(() {
      cardData = tempCardData;
      filteredCardData = List.from(cardData); // Make a copy of cardData
    });
  }

  void _filterCards(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCardData = List.from(cardData); // Reset to original data
      });
    } else {
      final results = cardData.where((event) {
        final title = event.name.toLowerCase();
        final description = event.description.toLowerCase();
        final searchLower = query.toLowerCase();

        return title.contains(searchLower) || description.contains(searchLower);
      }).toList();

      setState(() {
        filteredCardData = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 15),
              child: TextField(
                onChanged: (value) {
                  _filterCards(value);
                },
                decoration: const InputDecoration(
                  focusColor: Colors.orange,
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Upcoming Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff008037),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              list_overall_events(events: cardData),
                        ),
                      );
                    },
                    child: const Text(
                      "All Events",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 550, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredCardData.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // Handle event card tap action
                  },
                  child: upcoming_events_card(
                    cardData: filteredCardData[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
