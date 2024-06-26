import 'package:flut_sponsorin/sponsor_seeker_view/submit_proposal_to_comp.dart';
import 'package:flutter/material.dart';

class detail_company extends StatefulWidget {
  const detail_company({super.key});

  @override
  _DetailCompanyState createState() => _DetailCompanyState();
}

class _DetailCompanyState extends State<detail_company>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      body: Stack(
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
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Header
                  Container(
                    padding:  const EdgeInsets.all(16.0),
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
                          backgroundImage:
                              AssetImage('lib/assets/company_logo.jpg'),
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
                  SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'lib/assets/profile_picture.jpg'),
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
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: AboutCompany(),
                        ),
                        // Past Sponsorship Tab
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SponsorCard(
                                imageUrl: 'lib/assets/event_logo.jpg',
                                title: 'IRGL 2023',
                                subtitle:
                                    'Universitas Kristen Petra\nSurabaya, Indonesia',
                                rating: 5.0,
                              ),
                              SponsorCard(
                                imageUrl: 'lib/assets/event_logo.jpg',
                                title: 'Dies Natalis',
                                subtitle:
                                    'Universitas Ciputra\nSurabaya, Indonesia',
                                rating: 5.0,
                              ),
                              // Additional Cards...
                            ],
                          ),
                        ),
                        // Events Tab
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double
                                      .infinity, // Make the card take up the full width
                                  child: Card(
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: const Padding(
                                      padding:  EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'lib/assets/profile_picture.jpg'),
                                              ),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  'Informatics Rally Games and Logic',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
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
                                          // Event Image
                                          Center(
                                            child: Image(
                                              image: AssetImage(
                                                  'lib/assets/irgl.png'),
                                              fit: BoxFit.contain,
                                              width: double.infinity,
                                            ),
                                          ),
                                          SizedBox(height: 16.0),
                                          // Event Description
                                          Text(
                                            'Jadi pemimpin dengan anggota yang banyak ',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Additional Cards...
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const submit_proposal_to_comp()),
                    );},
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double rating;

  const SponsorCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.green, size: 20.0),
                      const SizedBox(width: 4.0),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'See Comments',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

class AboutCompany extends StatelessWidget {
  const AboutCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PT Mandira',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Berdiri sejak tahun 1968, PT Mandiri telah menjadi Bank Swasta terbesar kedua di Indonesia. Berkomitmen untuk memberikan pelayanan terbaik kepada nasabah dan menjadi bank yang dapat dipercaya oleh seluruh nasabah.',
            ),
            SizedBox(height: 8.0),
            Text(
              'Mandira terus bertumbuh dengan puluhan ribu karyawan yang tersebar di berbagai cabang yang ada di seluruh Indonesia.',
            ),
            SizedBox(height: 8.0),
            Text(
              'Website',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 4.0),
            Text('http://www.mandira.co.id'),
            SizedBox(height: 8.0),
            Text(
              'Email',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 4.0),
            Text('mandira@gmail.co.id'),
            SizedBox(height: 8.0),
            Text(
              'Nomor Telepon',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 4.0),
            Text('+6281123456789'),
          ],
        ),
      ),
    );
  }
}
