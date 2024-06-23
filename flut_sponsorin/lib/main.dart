import 'package:flut_sponsorin/company_view/discover_company.dart';
import 'package:flut_sponsorin/home.dart';
import 'package:flut_sponsorin/signup.dart';
import 'package:flut_sponsorin/splashscreen.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/detail_company.dart';
import 'package:flutter/material.dart';
import 'package:flut_sponsorin/login.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/discover_sponsor.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SponsorIn',
      home: login(),
    );
  }
}
