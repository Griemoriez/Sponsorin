import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class discover_sponsor_home extends StatelessWidget {
  const discover_sponsor_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
      itemCount: sponsors.length,
      itemBuilder: (context, index) {
        final Sponsor sponsor = sponsors[index];
        return Center(
          child: Container(
            width:MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.44,
            // height: 20,
            child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sponsor.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      sponsor.time,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      sponsor.description,
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Buka URL lowongan
                            launchUrl(Uri.parse(sponsor.url));
                          },
                          child: Text("Lihat Lowongan"),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}

class Sponsor {
  final String name;
  final String time;
  final String description;
  final String url;

  Sponsor({
    required this.name,
    required this.time,
    required this.description,
    required this.url,
  });
}

List<Sponsor> sponsors = [
  Sponsor(
    name: "PT Bank Central Asia",
    time: "3h ago",
    description: "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://youtube.com",
  ),
  Sponsor(
    name: "PT ABC",
    time: "3h ago",
    description: "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://lnkd.in/gk35qqikt",
  ),
  Sponsor(
    name: "PT Bango",
    time: "3h ago",
    description: "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://lnkd.in/gk35qqikt",
  )
  // Tambahkan data sponsor lain di sini
];
