import 'package:flutter/material.dart';

class ProfileCompanyHome extends StatelessWidget {
  const ProfileCompanyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 0; i < 4; i++)
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/assets/profile_picture.jpg'),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'PT Mandira',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '3h ago',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.more_vert),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Jadi pemimpin dengan anggota yang banyak dan tersebar merupakan sebuah keahlian yang harus dimiliki oleh seluruh mahasiswa. Salah satunya menjadi panitia sponsor merupakan salah satu keahlian yang penting\n\nYuk, simak cerita Akmal untuk tahu tips dan tricks mencari sponsor yang baik dan mudah!!!',
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
