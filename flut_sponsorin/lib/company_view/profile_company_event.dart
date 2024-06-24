import 'package:flutter/material.dart';

class ProfileCompanyEvent extends StatelessWidget {
  const ProfileCompanyEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
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
                            backgroundImage: AssetImage('lib/assets/profile_picture.jpg'),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'Informatics Rally Games and Logic',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
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
                      SizedBox(height: 20.0),
                      // Event Image
                      Center(
                        child: Image(
                          image: AssetImage('lib/assets/irgl.png'),
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Event Description
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'IRGL 2023 adalah kompetisi tahunan yang menguji kemampuan logika dan pemrograman. Acara ini diselenggarakan di Universitas Kristen Petra dan diikuti oleh peserta dari seluruh Indonesia.',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Additional Cards...
          ],
        ),
      ),
    );
  }
}