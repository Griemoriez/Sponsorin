import 'package:flut_sponsorin/company_view/list_overall_events.dart';
import 'package:flut_sponsorin/components/EventData.dart';
import 'package:flutter/material.dart';
import 'package:flut_sponsorin/components/upcoming_event_card.dart';

class upcoming_events extends StatefulWidget {
  const upcoming_events({super.key});

  @override
  State<upcoming_events> createState() => _upcoming_eventsState();
}

class _upcoming_eventsState extends State<upcoming_events> {
  final List<EventData> cardData =  [
  EventData(
    title: 'IRGL 2023',
    type: 'competition',
    time: 'Oktober 2023',
    poster: 'lib/assets/irgl.png',
    description:
        'IRGL 2023 adalah kompetisi tahunan yang menguji kemampuan logika dan pemrograman. Acara ini diselenggarakan di Universitas Kristen Petra dan diikuti oleh peserta dari seluruh Indonesia.',
    contactPerson: '081234567890',
    venue: 'Universitas Kristen Petra',
    status: -1
  ),
  EventData(
    title: 'Bharatika 2023',
    type: 'exhibition',
    time: 'November 2023',
    poster: 'lib/assets/irgl.png',
    description:
        'Bharatika 2023 adalah pameran seni dan budaya yang menampilkan karya seni dari berbagai seniman lokal. Acara ini bertujuan untuk mempromosikan seni dan budaya lokal kepada masyarakat luas.',
    contactPerson: '082345678901',
    venue: 'Tunjungan Plaza',
    status: -1
  ),
  EventData(
    title: 'Adiwarna 2023',
    type: 'exhibition',
    time: 'Maret 2023',
    poster: 'lib/assets/irgl.png',
    description:
        'Adiwarna 2023 adalah pameran teknologi yang menampilkan inovasi terbaru di bidang teknologi informasi dan komunikasi. Acara ini menghadirkan berbagai perusahaan teknologi terkemuka.',
    contactPerson: '083456789012',
    venue: 'Q 401a, Universitas Kristen Petra',
    status: -1
  ),
  EventData(
    title: 'Tutorial Programming 2023',
    type: 'tutorial',
    time: 'July 2023',
    poster: 'lib/assets/irgl.png',
    description:
        'Tutorial Programming 2023 adalah serangkaian workshop yang bertujuan untuk meningkatkan keterampilan pemrograman para peserta. Acara ini akan diisi oleh pembicara-pembicara yang ahli di bidangnya.',
    contactPerson: '084567890123',
    venue: 'Gedung P Universitas Kristen Petra',
    status: -1
  )
];


  List filteredCardData = [];

  @override
  void initState() {
    super.initState();
    filteredCardData = cardData;
  }

  void _filterCards(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCardData = cardData;
      });
    } else {
      final results = cardData.where((card) {
        final title = card.title.toLowerCase();
        final event = card.description.toLowerCase();
        final searchLower = query.toLowerCase();

        return title.contains(searchLower) || event.contains(searchLower);
      }).toList();

      setState(() {
        filteredCardData = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
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
                        borderSide: BorderSide(color: Colors.orange)),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
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
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    list_overall_events(events: cardData)),
                          );
                        },
                        child: const Text(
                          "All Events",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 550, // Sesuaikan tinggi sesuai kebutuhan
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredCardData.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: upcoming_events_card(
                      cardData: filteredCardData[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
