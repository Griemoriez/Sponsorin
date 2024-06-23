import 'package:flutter/material.dart';

class profile_company extends StatefulWidget {
  const profile_company({super.key});

  @override
  State<profile_company> createState() => _profile_companyState();
}

class _profile_companyState extends State<profile_company>
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
                        Padding(
                          padding: const EdgeInsets.all(16.0),
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
                                              Expanded(
                                                child: Text(
                                                  'Informatics Rally Games and Logic',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11,
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
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
  }) : super(key: key);

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
                    style: TextStyle(
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
                      Icon(Icons.star, color: Colors.green, size: 20.0),
                      const SizedBox(width: 4.0),
                      Text(
                        rating.toString(),
                        style: TextStyle(
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
                        child: Text(
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
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

class AboutCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 8.0),
            Text(
              'Berdiri sejak tahun 1968, PT Mandiri telah menjadi Bank Swasta terbesar kedua di Indonesia. Berkomitmen untuk memberikan pelayanan terbaik kepada nasabah dan menjadi bank yang dapat dipercaya oleh seluruh nasabah.',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Mandira terus bertumbuh dengan puluhan ribu karyawan yang tersebar di berbagai cabang yang ada di seluruh Indonesia.',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Website',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 4.0),
            Text('http://www.mandira.co.id'),
            const SizedBox(height: 8.0),
            Text(
              'Email',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 4.0),
            Text('mandira@gmail.co.id'),
            const SizedBox(height: 8.0),
            Text(
              'Nomor Telepon',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 4.0),
            Text('+6281123456789'),
          ],
        ),
      ),
    );
  }
}
