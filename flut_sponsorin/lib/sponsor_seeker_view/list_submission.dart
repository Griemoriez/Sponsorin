// import 'package:flutter/material.dart';

// class list_submission extends StatelessWidget {
//   const list_submission({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//             child: Text(
//               'List Submission TEST',
//               style: TextStyle(fontSize: 24, color: Colors.red),
//             ),
//           ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class list_submission extends StatefulWidget {
  @override
  _ListSubmissionState createState() => _ListSubmissionState();
}

class _ListSubmissionState extends State<list_submission> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> proposals = [
    {
      'companyName': 'PT Mandira',
      'location': 'Surabaya, Indonesia',
      'status': 'ACCEPTED'
    },
    {
      'companyName': 'PT Lamuda',
      'location': 'Jakarta, Indonesia',
      'status': 'PENDING'
    },
    {
      'companyName': 'PT Corknews',
      'location': 'Surabaya, Indonesia',
      'status': 'DECLINED'
    },
  ];
  List<Map<String, String>> filteredProposals = [];

  @override
  void initState() {
    super.initState();
    filteredProposals = proposals;
    _searchController.addListener(_filterProposals);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterProposals() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredProposals = proposals
          .where((proposal) =>
              proposal['companyName']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search here...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Proposal Submissions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProposals.length,
              itemBuilder: (context, index) {
                var proposal = filteredProposals[index];
                return buildProposalCard(
                  proposal['companyName']!,
                  proposal['location']!,
                  proposal['status']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProposalCard(String companyName, String location, String status) {
    Color statusColor;
    // Menentukan warna berdasarkan nilai status
    if (status == 'ACCEPTED') {
      statusColor = Colors.green;
    } else if (status == 'PENDING') {
      statusColor = Colors.orange;
    } else if (status == 'DECLINED') {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.grey; // Warna default jika status tidak dikenali
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        title: Text(companyName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Submitted 1d ago',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        trailing: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 17, 88, 146),
          ),
          child: Center(
            child: Icon(
              Icons.business,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
