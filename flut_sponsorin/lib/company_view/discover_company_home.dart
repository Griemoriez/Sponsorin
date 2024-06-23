import 'package:flut_sponsorin/company_view/upload_status.dart';
import 'package:flutter/material.dart';

class discover_company_home extends StatefulWidget {
  const discover_company_home({super.key});

  @override
  State<discover_company_home> createState() => _discover_company_homeState();
}

class _discover_company_homeState extends State<discover_company_home> {
  bool isFavorite = false;


  final List<Map<String, String>> cardData = [
    {
      'title': 'IRGL 2023',
      'time': '3h ago',
      'event': 'INFORMATICS RALLY GAMES AND LOGIC',
      'description':
          'Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh! Buat kamu yang tertarik jadi hashtag',
      'imagePath': 'lib/assets/logo.png'
    },
    {
      'title': 'Tech Expo 2024',
      'time': '5h ago',
      'event': 'TECHNOLOGY EXHIBITION AND SEMINAR',
      'description':
          'Acara ini akan menghadirkan pembicara dari berbagai perusahaan teknologi terkemuka. Ayo datang dan tambahkan wawasanmu tentang teknologi terbaru!',
      'imagePath': 'lib/assets/logo.png'
    },
    {
      'title': 'AI Summit 2024',
      'time': '1d ago',
      'event': 'ARTIFICIAL INTELLIGENCE SUMMIT',
      'description':
          'Diskusikan perkembangan terbaru dalam bidang kecerdasan buatan bersama para ahli dan praktisi di AI Summit 2024.',
      'imagePath': 'lib/assets/logo.png'
    }
  ];

  List<Map<String, String>> filteredCardData = [];

  @override
  void initState() {
    super.initState();
    filteredCardData = cardData;
  }

  void _filterCards(String query) {
    final results = cardData.where((card) {
      final title = card['title']!.toLowerCase();
      final event = card['event']!.toLowerCase();
      final searchLower = query.toLowerCase();

      return title.contains(searchLower) || event.contains(searchLower);
    }).toList();

    setState(() {
      filteredCardData = results;
    });
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
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 17.0, top: 20.0, right: 17.0, bottom: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      _filterCards(value);
                    },
                    decoration: const InputDecoration(
                      focusColor: Colors.orange,
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.orange)),
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
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0, bottom: 15.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Colors.grey,
                              width: 1), // Menambahkan border
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 20.0, right: 20.0, bottom: 18.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage(item[
                                          'imagePath']!), // Ganti dengan path gambar Anda
                                      radius: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          item['title']!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          item['time']!,
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
                                SizedBox(height: 10),
                                Text(
                                  item['event']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  item['description']!,
                                ),
                                SizedBox(height: 10),
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Like',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ])
                              ]),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => upload_status()),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
          ),
        )
      ],
    );
  }
}
