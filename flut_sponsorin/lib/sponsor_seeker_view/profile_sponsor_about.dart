import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSponsorAbout extends StatelessWidget {
  final Map<String, String> sponsor = {
    'name': 'IRGL',
    'description': 'Informatics rally games and logic. Lomba untuk anak SMA sederajat blablablablablabla',
    'email': 'contact@irgl.com',
    'website': 'https://www.irgl.com',
    'phone': '+62 123 4567',
    'address': 'Jl. Raya Surabaya No.123, Surabaya, East Java, Indonesia'
  };

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sponsor['name']!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            sponsor['description']!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Contact Information:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => _launchUrl('mailto:${sponsor['email']}'),
            child: Text(
              'Email: ${sponsor['email']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () => _launchUrl(sponsor['website']!),
            child: Text(
              'Website: ${sponsor['website']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Phone: ${sponsor['phone']}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Address: ${sponsor['address']}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
