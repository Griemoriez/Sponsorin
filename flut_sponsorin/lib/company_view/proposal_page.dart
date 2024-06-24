import 'package:flut_sponsorin/company_view/event_details.dart';
import 'package:flut_sponsorin/components/EventData.dart';
import 'package:flut_sponsorin/components/EventDataGlobals.dart';
import 'package:flutter/material.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({super.key});

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _search = TextEditingController();
  late TabController _tabController;

  List<EventData> filteredSubmittedEvents = [];
  List<EventData> filteredOfferedEvents = [];
  List<EventData> filteredAcceptedEvents = [];
  List<EventData> filteredDeclinedEvents = [];

  final List<EventData> listAccepted = [];
  final List<EventData> listDeclined = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      _handleTabSelection();
    });
    _search.addListener(_filterEvents);
    filteredSubmittedEvents = listSubmitted;
    filteredOfferedEvents = listOffered;
    filteredAcceptedEvents = listAccepted;
    filteredDeclinedEvents = listDeclined;
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
    List<EventData> results = [];
    List<EventData> sourceList;

    switch (_tabController.index) {
      case 0:
        sourceList = listSubmitted;
        break;
      case 1:
        sourceList = listOffered;
        break;
      case 2:
        sourceList = listAccepted;
        break;
      case 3:
        sourceList = listDeclined;
        break;
      default:
        sourceList = listSubmitted;
    }

    if (_search.text.isEmpty) {
      results = sourceList;
    } else {
      results = sourceList
          .where((event) =>
              event.title.toLowerCase().contains(_search.text.toLowerCase()))
          .toList();
      print("Filtered results: $results");
    }

    setState(() {
      switch (_tabController.index) {
        case 0:
          filteredSubmittedEvents = results;
          break;
        case 1:
          filteredOfferedEvents = results;
          break;
        case 2:
          filteredAcceptedEvents = results;
          break;
        case 3:
          filteredDeclinedEvents = results;
          break;
      }
    });
  }

  void _acceptProposal(EventData event) {
    setState(() {
      listSubmitted.remove(event);
      listOffered.remove(event);
      listAccepted.add(event);
      event.status = 1;
      _filterEvents();
    });
  }

  void _declineProposal(EventData event) {
    setState(() {
      listSubmitted.remove(event);
      listOffered.remove(event);
      listDeclined.add(event);
      event.status = 0;
      _filterEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Hi, PT Mandiri!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  focusColor: Colors.green.shade100,
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.green.shade100),
                  ),
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "Submitted Proposals"),
                Tab(text: "Offered Proposals"),
                Tab(text: "Accepted Proposals"),
                Tab(text: "Declined Proposals"),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.green,
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProposalListView(
                    events: filteredSubmittedEvents,
                    onAccept: _acceptProposal,
                    onDecline: _declineProposal,
                  ),
                  ProposalListView(
                    events: filteredOfferedEvents,
                    // onAccept: _acceptProposal,
                    // onDecline: _declineProposal,
                  ),
                  ProposalListView(
                    events: filteredAcceptedEvents,
                    onAccept: _acceptProposal,
                  ),
                  ProposalListView(
                    events: filteredDeclinedEvents,
                    onDecline: _declineProposal,
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

class ProposalListView extends StatelessWidget {
  final List<EventData> events;
  final Function(EventData)? onAccept;
  final Function(EventData)? onDecline;

  const ProposalListView({
    super.key,
    required this.events,
    this.onAccept,
    this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(
        child: Text(
          'No Available Proposal',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      );
    }
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];

        return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EventDetail(event: event),
                //   ),
                // );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(
                    color: Colors.grey, // Warna border
                    width: 2.0, // Lebar border
                  ),
                ),
                elevation: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              event.title.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            event.type.toUpperCase(),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Venue: ' + event.venue,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        'Event Date: ' + event.time,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      if (onAccept != null &&
                          onDecline != null &&
                          event.status == -1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 120,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  onAccept!(event);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  'ACCEPT',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 20), // Add space between the buttons
                            SizedBox(
                              width: 120,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  onDecline!(event);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  'DECLINE',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (onAccept == null && onDecline == null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (event.status == -1)
                              SizedBox(
                                width: 120,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Pending status
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'PENDING',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            if (event.status == 0)
                              SizedBox(
                                width: 120,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Pending status
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'DECLINED',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            if (event.status == 1)
                              SizedBox(
                                width: 120,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Pending status
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    'accepted'.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      if (onAccept != null && event.status == 1)
                        Center(
                            child: Text(
                          'Accepted'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.green),
                        )),
                      if (onDecline != null && event.status == 0)
                        Center(
                            child: Text(
                          'declined'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.red),
                        ))
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
