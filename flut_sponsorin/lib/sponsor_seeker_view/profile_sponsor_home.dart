import 'package:flutter/material.dart';

class ProfileSponsorHome extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'IRGL 2023',
      'description': 'Journey to the heart of the archipelago',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'IRGL 2022',
      'description': 'The Sacred lalalalalala',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'IRGL 2021',
      'description': 'TEMA',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.44,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2, // Adjust height as needed
                      child: Image.network(
                        items[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        items[index]['title']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
      ),
    );
  }
}
