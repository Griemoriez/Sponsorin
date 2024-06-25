import 'package:flutter/material.dart';
import 'package:flut_sponsorin/company_view/profile_company_about.dart';
import 'package:flut_sponsorin/company_view/profile_company_event.dart';
import 'package:flut_sponsorin/company_view/profile_company_home.dart';
import 'package:flut_sponsorin/company_view/profile_company_past.dart';

class ProfileCompany extends StatelessWidget {
  const ProfileCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'lib/assets/mandira.png'), // Replace with your image URL
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'PT Mandira',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Banking\nSurabaya, East Java, Indonesia',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.green,
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'About'),
                Tab(text: 'Past Sponsorship'),
                Tab(text: 'Events')
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ProfileCompanyHome(),
                  ProfileCompanyAbout(),
                  ProfileCompanyPast(),
                  ProfileCompanyEvent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
