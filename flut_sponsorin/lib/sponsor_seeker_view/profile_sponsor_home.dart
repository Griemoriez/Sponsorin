import 'package:flutter/material.dart';

class ProfileSponsorHome extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'lib/assets/irgl.png',
      'title': 'IRGL 2023',
      'description': 'Journey to the heart of the archipelago',
    },
    {
      'image': 'lib/assets/irgl.png',
      'title': 'IRGL 2022',
      'description': 'The Sacred lalalalalala',
    },
    {
      'image': 'lib/assets/irgl.png',
      'title': 'IRGL 2021',
      'description': 'TEMA',
    },
  ];

  ProfileSponsorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height *
                0.5, // Adjust height of the card
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color:
                      Colors.grey, // Ganti dengan warna border yang diinginkan
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.3, // Increase the height of the image container
                    child: Image.asset(
                      items[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      items[index]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      items[index]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
