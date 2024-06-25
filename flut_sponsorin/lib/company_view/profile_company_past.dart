import 'package:flutter/material.dart';

class ProfileCompanyPast extends StatelessWidget {
  const ProfileCompanyPast({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SponsorCard(
            imageUrl: 'lib/assets/event_logo.jpg',
            title: 'IRGL 2023',
            subtitle: 'Universitas Kristen Petra\nSurabaya, Indonesia',
            rating: 5.0,
          ),
          SponsorCard(
            imageUrl: 'lib/assets/event_logo.jpg',
            title: 'Dies Natalis',
            subtitle: 'Universitas Ciputra\nSurabaya, Indonesia',
            rating: 5.0,
          ),
        ],
      ),
    ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double rating;

  const SponsorCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(imageUrl),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.green, size: 20.0),
                        const SizedBox(width: 4.0),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'See Comments',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ),
    );
  }
}
