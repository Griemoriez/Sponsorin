import 'package:flut_sponsorin/components/EventData.dart';
import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  final EventData events;
  const EventDetail({super.key, required this.events});

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
                padding: const EdgeInsets.only(
                    top: 30.0, right: 17.0, left: 17.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                            color: Colors.grey, width: 2), // Menambahkan border
                        color: Colors.white, // Menambahkan warna latar belakang
                      ),
                      padding: const EdgeInsets.all(
                          16.0), // Menambahkan padding di dalam kotak
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(events.title,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w700)),
                          ),
                          const SizedBox(height: 20.0),
                          Center(child: Image(image: AssetImage(events.poster))),
                          const SizedBox(height: 12.0),
                          Center(
                              child: Text(events.description,
                                  style: const TextStyle(fontSize: 16))),
                          const SizedBox(height: 12.0),
                          const Text('Venue',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 19)),
                          Text(events.venue,
                              style: const TextStyle(fontSize: 15)),
                          const SizedBox(height: 12.0),
                          const Text('Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 19)),
                          Text(events.time,
                              style: const TextStyle(fontSize: 15)),
                          const SizedBox(height: 12.0),
                          const Text('Venue',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 19)),
                          Text(events.venue,
                              style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }
}
