import 'package:flutter/material.dart';
import 'profile_sponsor_home.dart';
import 'profile_sponsor_about.dart';
import 'profile_sponsor_past.dart';

class ProfileSponsor extends StatelessWidget {
  const ProfileSponsor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            // decoration: BoxDecoration(
            //   color: Colors.white.withOpacity(1), // Making the container transparent
            // ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/assets/irgl.png'), // Replace with your image URL
                ),
                SizedBox(height: 10),
                Text(
                  'IRGL',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Informatics Rally Games and Logic',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Surabaya, East Java, Indonesia',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'About'),
              Tab(text: 'Past Sponsorship'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ProfileSponsorHome(),
                ProfileSponsorAbout(),
                ProfileSponsorPast(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
