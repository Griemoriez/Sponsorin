import 'package:flut_sponsorin/sponsor_seeker_view/detail_company.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user.dart';

class ListCompany extends StatefulWidget {
  const ListCompany({super.key});

  @override
  _ListCompanyState createState() => _ListCompanyState();
}

class _ListCompanyState extends State<ListCompany> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> companies = [];
  List<Map<String, String>> filteredCompanies = [];

  @override
  void initState() {
    super.initState();
    _loadCompanies();
    _searchController.addListener(_filterCompanies);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCompanies() async {
    var userBox = await Hive.openBox<User>('userBox');
    List<Map<String, String>> tempCompanies = [];

    for (var userKey in userBox.keys) {
      var user = userBox.get(userKey) as User;
      if (user.role == 'sponsor') {
        tempCompanies.add({
          'name': user.name ?? 'Unknown Company',
          'address': user.address ?? 'No Address',
          'picture': user.picture ?? 'lib/assets/logo.png',
        });
      }
    }

    setState(() {
      companies = tempCompanies;
      filteredCompanies = companies;

      // Debug print to check loaded companies
      print("Loaded Companies: $companies");
    });
  }

  void _filterCompanies() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCompanies = companies
          .where((company) =>
          (company['name'] ?? '').toLowerCase().contains(query))
          .toList();

      // Debug print to check filtered companies
      print("Filtered Companies: $filteredCompanies");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
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
          const SizedBox(height: 16),
          const Text(
            'Company List',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filteredCompanies.isEmpty
                ? const Center(child: Text('No companies found'))
                : ListView.builder(
              itemCount: filteredCompanies.length,
              itemBuilder: (context, index) {
                var company = filteredCompanies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const detail_company()),
                    );
                  },
                  child: companyCard(
                    company['name'] ?? 'Unknown Company',
                    company['address'] ?? 'No Address',
                    company['picture'] ?? 'lib/assets/logo.png',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget companyCard(String name, String location, String picture) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(picture),
              fit: BoxFit.cover,
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
