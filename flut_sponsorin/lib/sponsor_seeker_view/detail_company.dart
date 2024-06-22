import 'package:flutter/material.dart';

class detail_company extends StatefulWidget {
  const detail_company({super.key});

  @override
  _DetailCompanyState createState() => _DetailCompanyState();
}

class _DetailCompanyState extends State<detail_company> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/BG.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Color(0xff008037),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    text: 'Sponsor',
                    children: [
                      TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                        text: 'in',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Header
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage('lib/assets/company_logo.jpg'),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'PT Mandira',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Banking\nSurabaya, East Java, Indonesia',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Tabs
                        TabBar(
                          controller: _tabController,
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.green,
                          tabs: const [
                            Tab(text: 'Home'),
                            Tab(text: 'About'),
                            Tab(text: 'Past Sponsorship'),
                            Tab(text: 'Events'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // TabBarView
                  Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Home Tab
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Card(
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage('lib/assets/profile_picture.jpg'),
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            'PT Mandira',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '3h ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Icon(Icons.more_vert),
                                        ],
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        'Jadi pemimpin dengan anggota yang banyak dan tersebar merupakan sebuah keahlian yang harus dimiliki oleh seluruh mahasiswa. Salah satunya menjadi panitia sponsor merupakan salah satu keahlian yang penting\n\nYuk, simak cerita Akmal untuk tahu tips dan tricks mencari sponsor yang baik dan mudah!!!',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Additional Cards...
                            ],
                          ),
                        ),
                        // About Tab
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Card(
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage('lib/assets/profile_picture.jpg'),
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            'PT Mandira',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '3h ago',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Icon(Icons.more_vert),
                                        ],
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        'Jadi pemimpin dengan anggota yang banyak dan tersebar merupakan sebuah keahlian yang harus dimiliki oleh seluruh mahasiswa. Salah satunya menjadi panitia sponsor merupakan salah satu keahlian yang penting\n\nYuk, simak cerita Akmal untuk tahu tips dan tricks mencari sponsor yang baik dan mudah!!!',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Additional Cards...
                            ],
                          ),
                        ),
                        // Past Sponsorship Tab
                        const Center(child: Text('Past Sponsorship')),
                        // Events Tab
                        const Center(child: Text('Events')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
            ),
          ),
        ],
      );
  }
}


