import 'package:flut_sponsorin/company_view/list_overall_events.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/list_company.dart';
import 'package:flutter/material.dart';

class upcoming_events extends StatelessWidget {
  const upcoming_events({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 15.0, right: 15.0, bottom: 18.0),
            child: SizedBox(
              height: 45.0,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 20.0, right: 15.0, bottom: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        // Use Navigator.push for navigation
                        context,
                        MaterialPageRoute(
                            builder: (context) => const list_overall_events()),
                      );
                    },
                    child: Text(
                      'All Events',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[300],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
