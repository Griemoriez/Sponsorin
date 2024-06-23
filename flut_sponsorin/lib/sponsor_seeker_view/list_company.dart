import 'package:flutter/material.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/detail_company.dart';

class list_company extends StatefulWidget {
  const list_company({super.key});

  @override
  _ListCompanyState createState() => _ListCompanyState();
}

class _ListCompanyState extends State<list_company> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> companies = [
    {'name': 'PT Mandira', 'location': 'Surabaya, Indonesia'},
    {'name': 'PT Lamuda', 'location': 'Jakarta, Indonesia'},
    {'name': 'PT Corknews', 'location': 'Surabaya, Indonesia'},
    {'name': 'PT Alpha', 'location': 'Surabaya, Indonesia'},
    {'name': 'PT Beta', 'location': 'Surabaya, Indonesia'},
    {'name': 'PT Charlie', 'location': 'Surabaya, Indonesia'},
  ];
  List<Map<String, String>> filteredCompanies = [];

  @override
  void initState() {
    super.initState();
    filteredCompanies = companies;
    _searchController.addListener(_filterCompanies);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCompanies() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCompanies = companies
          .where((company) => company['name']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
          const Text(
            'Company List',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCompanies.length,
              itemBuilder: (context, index) {
                var company = filteredCompanies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailCompany()),
                    );
                  },
                  child: companyCard(company['name']!, company['location']!),
                );
              },
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

class DetailCompany extends StatelessWidget {
  const DetailCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Company'),
      ),
      body: Center(
        child: Text('Detail Company Page'),
      ),
    );
  }
}
