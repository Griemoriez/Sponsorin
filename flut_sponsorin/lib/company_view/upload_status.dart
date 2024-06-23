import 'package:flutter/material.dart';

class upload_status extends StatefulWidget {
  upload_status({super.key});

  @override
  State<upload_status> createState() => _upload_statusState();
}

class _upload_statusState extends State<upload_status> {
  final List<Map<String, dynamic>> list_event = [
    {'id': 1, 'nama': 'IRGL 2023'},
    {'id': 1, 'nama': "Bharatika 2023"}
  ];

  Map<String, dynamic>? selected_event;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "INPUT PROPOSAL",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'EVENT NAME',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<Map<String, dynamic>>(
            items: list_event.map((Map<String, dynamic> item) {
              return DropdownMenuItem<Map<String, dynamic>>(
                  value: item, child: Text(item['nama']));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selected_event = newValue;
              });
            },
            icon: Icon(Icons.arrow_drop_down_rounded),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green[100],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                labelText: 'Pilih Event',
                labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            isExpanded: true,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'TYPE OF SPONSOR',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.green[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'AMOUNT OF SPONSOR',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.green[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
