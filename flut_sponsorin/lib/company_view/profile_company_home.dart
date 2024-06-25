import 'package:flutter/material.dart';

class ProfileCompanyHome extends StatelessWidget {
  const ProfileCompanyHome({super.key});

  final List<Map<String, String>> posts = const [
    {
      'avatar': 'lib/assets/profile_picture.jpg',
      'name': 'PT Mandira',
      'time': '1h ago',
      'description': 'Jadi pemimpin dengan anggota yang banyak dan tersebar merupakan sebuah keahlian yang harus dimiliki oleh seluruh mahasiswa. Yuk, simak cerita Akmal untuk tahu tips dan tricks mencari sponsor yang baik dan mudah!!!',
    },
    {
      'avatar': 'lib/assets/profile_picture.jpg',
      'name': 'PT Mandira',
      'time': '2h ago',
      'description': 'Menjadi panitia sponsor merupakan salah satu keahlian yang penting. Simak cerita Akmal untuk tahu tips dan tricks mencari sponsor yang baik dan mudah!!!',
    },
    {
      'avatar': 'lib/assets/profile_picture.jpg',
      'name': 'PT Mandira',
      'time': '5h ago',
      'description': 'Pemimpin yang baik harus bisa mengelola anggota yang banyak. Pelajari lebih lanjut dari pengalaman Akmal mencari sponsor!',
    },
    {
      'avatar': 'lib/assets/profile_picture.jpg',
      'name': 'PT Mandira',
      'time': '1d ago',
      'description': 'Simak tips dan tricks dari Akmal tentang cara mencari sponsor yang baik dan mudah. Informasi penting bagi seluruh mahasiswa!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        var post = posts[index];
        return Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(post['avatar']!),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      post['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      post['time']!,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(Icons.more_vert),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(post['description']!),
              ],
            ),
          ),
        );
      },
    );
  }
}
