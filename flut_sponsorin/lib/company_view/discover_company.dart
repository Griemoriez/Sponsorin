import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flut_sponsorin/company_view/discover_company_home.dart';
import 'package:flut_sponsorin/company_view/list_submitted_events.dart';
import 'package:flut_sponsorin/company_view/profile_company.dart';
import 'package:flut_sponsorin/company_view/upcoming_events.dart';
import 'package:flut_sponsorin/company_view/upload_status.dart';
import 'package:flutter/material.dart';

class discover_company extends StatefulWidget {
  const discover_company({super.key});

  @override
  State<discover_company> createState() => _homePageState();
}

class _homePageState extends State<discover_company> {
  int _page = 0;
  final List<Widget> _pages = [
    discover_company_home(),
    upcoming_events(),
    upload_status(),
    list_submitted_events(),
    profile_company(),
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