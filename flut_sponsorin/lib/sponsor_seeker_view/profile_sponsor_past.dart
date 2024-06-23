import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSponsorPast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Sponsors'),
      ),
      body: ListView.builder(
        itemCount: sponsors.length,
        itemBuilder: (context, index) {
          final sponsor = sponsors[index];
          return SponsorCard(sponsor: sponsor);
        },
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  final Sponsor sponsor;

  SponsorCard({required this.sponsor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sponsor.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              sponsor.time,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Show modal with sponsor description
                    _showDescriptionDialog(context, sponsor);
                  },
                  child: Text('Description'),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < (sponsor.rating ?? 0) ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _launchURL(sponsor.url);
                },
                child: Text('Open Link'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
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
    description: "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://youtube.com",
    rating: 4,
  ),
  Sponsor(
    name: "PT ABC",
    time: "3h ago",
    description: "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://lnkd.in/gk35qqikt",
    rating: 3,
  ),
  Sponsor(
    name: "PT Bango",
    time: "3h ago",
    description: "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh Buat kamu yang tertarik jadi #TeamITBCAslik, klik link ini untuk cari tahu lowongan yang sedang dibuka https://lnkd.in/gk35qqikt",
    url: "https://lnkd.in/gk35qqikt",
    rating: 1,
  ),
  // Add more sponsors with ratings here
];
