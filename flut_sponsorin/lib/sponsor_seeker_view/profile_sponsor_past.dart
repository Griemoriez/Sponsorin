import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSponsorPast extends StatelessWidget {
  const ProfileSponsorPast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Setting the background color to transparent
      color: Colors.transparent,
      child: SafeArea(
        child: ListView.builder(
          itemCount: sponsors.length,
          itemBuilder: (context, index) {
            final sponsor = sponsors[index];
            return SponsorCard(sponsor: sponsor);
          },
        ),
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  final Sponsor sponsor;

  const SponsorCard({super.key, required this.sponsor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.9, // Set the width of the card here
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.grey, // Ganti dengan warna border yang diinginkan
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sponsor.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  sponsor.time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Show modal with sponsor description
                        _showDescriptionDialog(context, sponsor);
                      },
                      child: const Text('Description'),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < (sponsor.rating ?? 0)
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDescriptionDialog(BuildContext context, Sponsor sponsor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(sponsor.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(sponsor.description),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _launchURL(sponsor.url);
                },
                child: const Text('Open Link'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Sponsor {
  final String name;
  final String time;
  final String description;
  final String url;
  final int? rating;

  Sponsor({
    required this.name,
    required this.time,
    required this.description,
    required this.url,
    this.rating,
  });
}

List<Sponsor> sponsors = [
  Sponsor(
    name: "PT Bank Central Asia",
    time: "3h ago",
    description:
        "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://youtube.com",
    rating: 5,
  ),
  Sponsor(
    name: "PT ABC",
    time: "3h ago",
    description:
        "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://lnkd.in/gk35qqikt",
    rating: 5,
  ),
  Sponsor(
    name: "PT Bango",
    time: "3h ago",
    description:
        "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://lnkd.in/gk35qqikt",
    rating: 2,
  ),
  // Add more sponsors with ratings here
];
