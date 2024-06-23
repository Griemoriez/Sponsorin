// import 'package:flutter/material.dart';

// class submit_proposal extends StatelessWidget {
//   const submit_proposal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//             child: Text(
//               'submit proposal',
//               style: TextStyle(fontSize: 24, color: Colors.black),
//             ),
//           ),
//     );
//   }
// }
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
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _eventDescriptionController = TextEditingController();
  TextEditingController _eventDateController = TextEditingController();
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _uploadProposalController = TextEditingController();

  
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
    _eventNameController.dispose();
    _eventDescriptionController.dispose();
    _eventDateController.dispose();
    _idCardController.dispose();
    _uploadProposalController.dispose();
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _eventDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
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
              // automaticallyImplyLeading: false,
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih Proposal',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _eventNameController,
                      decoration: InputDecoration(
                        labelText: 'Event Name',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _eventDescriptionController,
                      decoration: InputDecoration(
                        labelText: 'Event Description',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _eventDateController,
                      decoration: InputDecoration(
                        labelText: 'Event Date',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _uploadProposalController,
                      decoration: InputDecoration(
                        labelText: 'Upload Proposal',
                        filled: true,
                        fillColor: Colors.green[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
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
