// import 'package:flutter/material.dart';

// class list_company extends StatelessWidget {
//   const list_company({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//             child: Text(
//               'List Company',
//               style: TextStyle(fontSize: 24, color: Colors.black),
//             ),
//           ),
//     );
//   }
// }

import 'package:flut_sponsorin/sponsor_seeker_view/detail_company.dart';
import 'package:flutter/material.dart';

class list_company extends StatelessWidget {
  const list_company({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            const Text(
              'Company List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => detail_company()));
                    },
                    child: companyCard('PT Mandira', 'Surabaya, Indonesia'),
                  ),
                  
                  companyCard('PT Lamuda', 'Jakarta, Indonesia'),
                  companyCard('PT Corknews', 'Surabaya, Indonesia'),
                  companyCard('PT Alpha', 'Surabaya, Indonesia'),
                  companyCard('PT Beta', 'Surabaya, Indonesia'),
                  companyCard('PT Charlie', 'Surabaya, Indonesia'),
                  // Add more cards as needed
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget companyCard(String name, String location) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Text(name),
        subtitle: Text(location),
      ),
    );
  }
}

