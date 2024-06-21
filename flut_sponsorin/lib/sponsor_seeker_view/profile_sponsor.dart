import 'package:flutter/material.dart';
import 'profile_sponsor_home.dart';
import 'profile_sponsor_about.dart';
import 'profile_sponsor_past.dart';


class ProfileSponsor extends StatelessWidget {
  const ProfileSponsor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.green[100]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with your image URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    'PT Mandira',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Banking',
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
                Tab(text: 'Events'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProfileSponsorHome(),
                  // ProfileSponsorAbout(),
                  // ProfileSponsorPast(),
                  Center(child: Text('Events Content')), // Placeholder for Events content
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
