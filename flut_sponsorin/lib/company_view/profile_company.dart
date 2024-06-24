import 'package:flut_sponsorin/company_view/profile_company_about.dart';
import 'package:flut_sponsorin/company_view/profile_company_event.dart';
import 'package:flut_sponsorin/company_view/profile_company_home.dart';
import 'package:flut_sponsorin/company_view/profile_company_past.dart';
import 'package:flutter/material.dart';

class ProfileCompany extends StatelessWidget {
  const ProfileCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            // decoration: BoxDecoration(
            //   color: Colors.white.withOpacity(1), // Making the container transparent
            // ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'lib/assets/irgl.png'), // Replace with your image URL
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
                  textAlign: TextAlign.center,  // Center the text
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
    );
  }
}