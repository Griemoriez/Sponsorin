import 'package:flutter/material.dart';
import 'package:flut_sponsorin/models/event.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart'; // Import Hive for box operations

class EventDetail extends StatelessWidget {
  final Event? event;

  const EventDetail({super.key, this.event});

  @override
  Widget build(BuildContext context) {
    Event? _event = event;

    if (_event == null) {
      // Fetch the first event from eventBox if event is null
      var eventBox = Hive.box<Event>('eventBox');
      _event = eventBox.get(1) as Event?;
    }

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
            elevation: 4,
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
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            _event?.name ?? 'Event Name', // Handle null event case
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Center(
                          child: Image(image: AssetImage(_event?.poster ?? 'lib/assets/placeholder.jpg')), // Handle null poster case
                        ),
                        const SizedBox(height: 12.0),
                        Center(
                          child: Text(
                            _event?.description ?? 'Event Description', // Handle null description case
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        const Text(
                          'Venue',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                        ),
                        Text(
                          _event?.venue ?? 'Unknown Venue', // Handle null venue case
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 12.0),
                        const Text(
                          'Time',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                        ),
                        Text(
                          _event != null ? DateFormat('dd MMMM, yyyy').format(_event.startDate) : 'Unknown Date', // Handle null start date case
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
