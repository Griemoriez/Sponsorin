import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/discovery_sponsor_home.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/list_company.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/list_submission.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/profile_sponsor.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/submit_proposal.dart';
import 'package:flutter/material.dart';

class discover_sponsor extends StatefulWidget {
  const discover_sponsor({super.key});

  @override
  State<discover_sponsor> createState() => _discover_spponsor_state();
}

class _discover_spponsor_state extends State<discover_sponsor> {
  int _page = 0;
  final List<Widget> _pages = [
    discover_sponsor_home(),
    list_company(),
    submit_proposal(),
    list_submission(),
    profile_sponsor(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Sponsorin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          body: IndexedStack(
            index: _page,
            children: _pages,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            items: const [
              Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
              Icon(
                Icons.business,
                color: Colors.white,
              ),
              Icon(
                Icons.add_box,
                color: Colors.white,
              ),
              Icon(
                Icons.insert_drive_file,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              ),
            ],
            color: Colors.black87,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
