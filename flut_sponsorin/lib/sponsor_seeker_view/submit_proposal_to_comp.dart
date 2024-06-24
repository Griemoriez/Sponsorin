import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/discovery_sponsor_home.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/list_company.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/list_submission.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/profile_sponsor.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/submit_proposal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class submit_proposal_to_comp extends StatefulWidget {
  @override
  _SubmitProposalState createState() => _SubmitProposalState();
}

class _SubmitProposalState extends State<submit_proposal_to_comp> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedEvent;
  String? _selectedSponsorType;
  TextEditingController _nominalController = TextEditingController();

  int _page = 0;
  final List<Widget> _pages = [
    discover_sponsor_home(),
    list_company(),
    submit_proposal(),
    list_submission(),
    ProfileSponsor(),
  ];

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

  void _showSubmissionMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.green[200],
          title: Text('Submission Successful'),
          content: Text('Waiting for news from the company!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
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
              centerTitle: true,
              title: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Color(0xff008037),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    text: 'Sponsor',
                    children: [
                      TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                        text: 'in',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Pilih Proposal',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedEvent,
                      items: ['IRGL 2021', 'IRGL 2022', 'IRGL 2023']
                          .map((event) {
                        return DropdownMenuItem(
                          value: event,
                          child: Text(event),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Event',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedEvent = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select an event' : null,
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedSponsorType,
                      items: ['Bebas', 'Produk', 'Tunai']
                          .map((sponsorType) {
                        return DropdownMenuItem(
                          value: sponsorType,
                          child: Text(sponsorType),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Bentuk Sponsor',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedSponsorType = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a sponsor type' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _nominalController,
                      decoration: InputDecoration(
                        labelText: 'Nominal (Rp)',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a nominal value';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showSubmissionMessage();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}