import 'package:flutter/material.dart';

class upcoming_events_card extends StatelessWidget {
  upcoming_events_card({super.key});

    final List<Map<String, String>> cardData = [
    {
      'title': 'IRGL 2023',
      'type': 'competition',
      'time': 'Oktober 2023',
      'description': 'Onsite: Universitas Kristen Petra, Surabaya',
      'imagePath': 'lib/assets/irgl.png'
    },
    {
      'title': 'Bharatika 2023',
      'type': 'exhibition',
      'time': 'November 2024',
      'description': 'Tunjungan Plaza, Surabaya',
      'imagePath': 'lib/assets/irgl.png'
    },
    {
     'title': 'Adiwarna 2023',
      'type': 'exhibition',
      'time': 'Maret 2023',
      'description': 'Onsite: Universitas Kristen Petra, Surabaya',
      'imagePath': 'lib/assets/irgl.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 4.0,
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
                        child: Text(
                          "COMPETITION",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const Image(
                      image: AssetImage('lib/assets/irgl.png'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "IRGL 2023",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Onsite : Universitas Kristen Petra, Surabaya",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Oktober 2023",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                        child: const Center(
                          child: Text(
                            'REGISTER HERE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
