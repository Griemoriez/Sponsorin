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

  void showDetailModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROPOSAL DITERIMA',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Dimohon untuk pihak acara dapat mengirimkan pesan pada Whatsapp yang tertera untuk melanjutkan ke proses selanjutnya',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'CP : 081-XXX-XXX-XXX',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  '(Kevin Sadino)',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showInfoDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
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
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProposalCard(String companyName, String location, String status, BuildContext context) {
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
        onTap: () {
          if (status == 'ACCEPTED') {
            showDetailModal(context);
          } else if (status == 'PENDING') {
            showInfoDialog(context, "Proposal anda sudah terkirim dan sedang dalam proses.");
          } else if (status == 'DECLINED') {
            showInfoDialog(context, "Proposal anda sudah ditolak oleh perusahaan.");
          }
        },
      ),
    );
  }
}
