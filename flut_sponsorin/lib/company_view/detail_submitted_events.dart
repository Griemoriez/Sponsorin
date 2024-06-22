import 'package:flutter/material.dart';

class detail_submitted_events extends StatelessWidget {
  const detail_submitted_events({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('EVENT NAME'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: buildSectionContent(
                  'IRGL 2023 Informatics Rally Games and Logic'),
            ),
            SizedBox(height: 16),
            buildSectionTitle('EVENT DATE AND TIME :'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: buildSectionContent(
                'TM : 14 Oktober 2023\n'
                'Eliminasi : 19 Oktober 2023\n'
                'Semifinal : 20 Oktober 2023\n'
                'Final : 21 Oktober 2023',
              ),
            ),
            SizedBox(height: 16),
            buildSectionTitle('EVENT LOCATION'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: buildSectionContent('Universitas Kristen Petra Surabaya'),
            ),
            SizedBox(height: 16),
            buildSectionTitle('TARGET'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: buildSectionContent(
                  '70 team @3 anak SMA/SMK seluruh Indonesia'),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.file_copy,
                  color: Colors.black,
                ),
                label: Text(
                  'PROPOSAL FILE',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'DECLINE',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'ACCEPT',
                        style: TextStyle(color: Colors.black),
                      ),
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

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget buildSectionContent(String content) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
