import 'package:flut_sponsorin/company_view/discover_company.dart';
import 'package:flut_sponsorin/components/EventData.dart';
import 'package:flutter/material.dart';

class detail_submitted_events extends StatelessWidget {
  final EventData detailSubmitted;
  const detail_submitted_events({super.key, required this.detailSubmitted});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/BG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Detail Submitted Proposal",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width:
                            48),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                buildSectionTitle('EVENT NAME'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: buildSectionContent(detailSubmitted.title),
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
                  child: buildSectionContent(detailSubmitted.venue),
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
                          onPressed: () {
                            _showDeclineConfirmationDialog(context);
                          },
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
                          onPressed: () {
                            _showConfirmationDialog(context);
                          },
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
        )
      ],
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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff579371),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ARE YOU SURE WANT TO TAKE SPONSOR OF THIS EVENT?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'NO',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showSucceedAddDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'YES, SURE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeclineConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: Container(
            width: 400,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ARE YOU SURE WANT TO DECLINE SPONSOR OF THIS EVENT?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'NO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showSucceedDeclineDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'YES, SURE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSucceedAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff579371),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: Container(
            height: 200,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'EVENT SPONSORED',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Please daily check your Whatsapp for further information from the sponsor seekers.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => discover_company()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  void _showSucceedDeclineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: Container(
            width: 400,
            height: 200,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'EVENT DECLINE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Thank you for your confirmation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => discover_company()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
