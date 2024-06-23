import 'package:flutter/material.dart';

class list_submission extends StatefulWidget {
  @override
  _ListSubmissionState createState() => _ListSubmissionState();
}

class _ListSubmissionState extends State<list_submission> with SingleTickerProviderStateMixin{
  late TabController _tabController;
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
  List<Map<String, String>> incoming_proposals = [
    {
      'companyName': 'PT Mandira',
      'location': 'Surabaya, Indonesia',
      'status': 'ACCEPTED'
    },
    {
      'companyName': 'PT Lamuda',
      'location': 'Jakarta, Indonesia',
      'status': 'PENDING'
    }
  ];
  List<Map<String, String>> filteredProposals = [];
  List<Map<String, String>> filteredIncomingProposals = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _handleTabSelection();
    });
    filteredProposals = proposals;
    filteredIncomingProposals = incoming_proposals;
    _searchController.addListener(_filterProposals);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (!_tabController.indexIsChanging) {
      _filterProposals();
      print("Tab index: ${_tabController.index}");
    }
  }

  void _filterProposals() {
    List<Map<String, String>> results = [];
    List<Map<String, String>> sourceList =
        _tabController.index == 0 ? proposals : incoming_proposals;

    if (_searchController.text.isEmpty) {
      results = sourceList;
    } else {
      results = sourceList
          .where((event) =>
              event['companyName']!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
      print("Filtered results: $results");
    }

    setState(() {
      if (_tabController.index == 0) {
        filteredProposals = results;
      } else {
        filteredIncomingProposals = results;
      }
    });
  }

  void showDetailModal(BuildContext context, String status) {
    Color backgroundColor;
    if (status == 'ACCEPTED') {
      backgroundColor = Colors.green;
    } else if (status == 'PENDING') {
      backgroundColor = Colors.yellow;
    } else if (status == 'DECLINED') {
      backgroundColor = Colors.red;
    } else {
      backgroundColor = Colors.white; // Default color if status is unknown
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Proposal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor.',
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

  void showInfoDialog(BuildContext context, String message, String status) {
    Color backgroundColor;
    if (status == 'PENDING') {
      backgroundColor = Colors.yellow;
    } else if (status == 'DECLINED') {
      backgroundColor = Colors.red;
    } else {
      backgroundColor = Colors.white; // Default color if status is unknown
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Hi, IRGL!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  focusColor: Colors.green.shade100,
                  labelText: 'Search',
                  hintText: 'irgl, ...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.green.shade100),
                  ),
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Submitted Proposals"),
                Tab(text: "Offered Proposals"),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.green,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: filteredProposals.length,
                    itemBuilder: (context, index) {
                      var proposal = filteredProposals[index];
                      return buildProposalCard(
                        proposal['companyName']!,
                        proposal['location']!,
                        proposal['status']!,
                        context
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: filteredIncomingProposals.length,
                    itemBuilder: (context, index) {
                      var proposal = filteredIncomingProposals[index];
                      return buildProposalCard(
                        proposal['companyName']!,
                        proposal['location']!,
                        proposal['status']!,
                        context
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       TextField(
    //         controller: _searchController,
    //         decoration: InputDecoration(
    //           prefixIcon: const Icon(Icons.search),
    //           hintText: 'Search here...',
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(15.0),
    //           ),
    //           contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
    //           fillColor: Colors.white,
    //           filled: true,
    //         ),
    //       ),
    //       SizedBox(height: 16),
    //       Text(
    //         'Proposal Submissions',
    //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //       ),
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: filteredProposals.length,
    //           itemBuilder: (context, index) {
    //             var proposal = filteredProposals[index];
    //             return buildProposalCard(
    //               proposal['companyName']!,
    //               proposal['location']!,
    //               proposal['status']!,
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
            showDetailModal(context, status);
          } else if (status == 'PENDING') {
            showInfoDialog(context, "Proposal anda sudah terkirim dan sedang dalam proses.", status);
          } else if (status == 'DECLINED') {
            showInfoDialog(context, "Proposal anda sudah ditolak oleh perusahaan.", status);
          }
        },
      ),
    );
  }
}
