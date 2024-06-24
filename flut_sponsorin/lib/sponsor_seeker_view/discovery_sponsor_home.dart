import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class discover_sponsor_home extends StatefulWidget {
  const discover_sponsor_home({super.key});

  @override
  State<discover_sponsor_home> createState() => _discover_sponsor_homeState();
}

class _discover_sponsor_homeState extends State<discover_sponsor_home> {
  bool isFavorite = false;

  final List<Map<String, dynamic>> cardData = [
    {
      'title': 'PT Bank Central Asia',
      'time': '3h ago',
      'description':
          'Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh! Buat kamu yang tertarik jadi hashtag',
      'imagePath': 'assets/logo.png',
      'isFavorite': false
    },
    {
      'title': 'PT Asia',
      'time': '5h ago',
      'description':
          'Acara ini akan menghadirkan pembicara dari berbagai perusahaan teknologi terkemuka. Ayo datang dan tambahkan wawasanmu tentang teknologi terbaru!',
      'imagePath': 'assets/logo.png',
      'isFavorite': false
    },
    {
      'title': 'PT Mandira',
      'time': '1d ago',
      'description':
          'Diskusikan perkembangan terbaru dalam bidang kecerdasan buatan bersama para ahli dan praktisi di AI Summit 2024.',
      'imagePath': 'assets/logo.png',
      'isFavorite': false
    }
  ];

  List<Map<String, dynamic>> filteredCardData = [];

  @override
  void initState() {
    super.initState();
    filteredCardData = cardData;
  }

  void _filterCards(String query) {
    final results = cardData.where((card) {
      final title = card['title']?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return title.contains(searchLower);
    }).toList();

    setState(() {
      filteredCardData = results;
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      filteredCardData[index]['isFavorite'] = !filteredCardData[index]['isFavorite'];
    });
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
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 45.0,
                    width: double.infinity,
                    child: TextField(
                      onChanged: (value) {
                        _filterCards(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredCardData.length,
                  itemBuilder: (context, index) {
                    final item = filteredCardData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7.5),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Colors.grey,
                              width: 1), // Menambahkan border
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage(item['imagePath']), // Ganti dengan path gambar Anda
                                    radius: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        item['title'] ?? 'No Title',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        item['time'] ?? 'No Time',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.more_vert),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                item['description'] ?? 'No Description',
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      item['isFavorite']
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: item['isFavorite']
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      _toggleFavorite(index);
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Like',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => upload_status()),
          // );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }}