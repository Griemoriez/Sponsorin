import 'package:flut_sponsorin/company_view/offered_proposal.dart';
import 'package:flut_sponsorin/company_view/submitted_proposal.dart';
import 'package:flutter/material.dart';

class list_submitted_events extends StatefulWidget {
  list_submitted_events({super.key});

  @override
  State<list_submitted_events> createState() => _list_submitted_eventsState();
}

class _list_submitted_eventsState extends State<list_submitted_events>
    with SingleTickerProviderStateMixin {
  TextEditingController _search = TextEditingController();
  late TabController _tabController;
  List<Map<String, dynamic>> filteredSubmittedEvents = [];
  List<Map<String, dynamic>> filteredOfferedEvents = [];
  final List<Map<String, dynamic>> list_submitted = [
    {
      'nama': 'IRGL 2023',
      'type': 'COMPETITION',
      'location': 'Universitas Kristen Petra, Surabaya',
      'date': 'Oktober 2023',
      'status': -1
    },
    {
      'nama': 'Bharatika 2023',
      'type': 'COMPETITITON',
      'date': 'Oktober 2023',
      'location': 'Universitas Kristen Petra, Surabaya',
      'status': 1
    }
  ];
  final List<Map<String, dynamic>> list_offered = [
    {
      'nama': 'IRGL 2023',
      'type': 'COMPETITION',
      'date': 'Oktober 2023',
      'location': 'Universitas Kristen Petra, Surabaya',
      'status': 0
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _handleTabSelection();
    });
    _search.addListener(_filterEvents);
    filteredSubmittedEvents = list_submitted;
    filteredOfferedEvents = list_offered;
  }

  @override
  void dispose() {
    _search.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (!_tabController.indexIsChanging) {
      _filterEvents();
      print("Tab index: ${_tabController.index}");
    }
  }

  void _filterEvents() {
    List<Map<String, dynamic>> results = [];
    List<Map<String, dynamic>> sourceList =
        _tabController.index == 0 ? list_submitted : list_offered;

    if (_search.text.isEmpty) {
      results = sourceList;
    } else {
      results = sourceList
          .where((event) =>
              event['nama'].toLowerCase().contains(_search.text.toLowerCase()))
          .toList();
      print("Filtered results: $results");
    }

    setState(() {
      if (_tabController.index == 0) {
        filteredSubmittedEvents = results;
      } else {
        filteredOfferedEvents = results;
      }
    });
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
                "Hi, PT Mandiri!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextField(
                controller: _search,
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
                  submitted_proposal(
                    list_submitted: filteredSubmittedEvents,
                  ),
                  offered_proposal(
                    list_offered: filteredOfferedEvents,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
