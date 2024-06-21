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

class list_submission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search here...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Proposal Submissions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: [
                buildProposalCard(
                    'PT Mandira', 'Surabaya, Indonesia', 'ACCEPTED'),
                buildProposalCard('PT Lamuda', 'Jakarta, Indonesia', 'PENDING'),
                buildProposalCard(
                    'PT Corknews', 'Surabaya, Indonesia', 'DECLINED'),
              ],
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Submitted 1d ago',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                //   decoration: BoxDecoration(
                //     color: statusColor,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   child: Text(
                //     status,
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
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
