import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flut_sponsorin/company_view/upload_status.dart';
import '../models/user.dart';
import '../models/post.dart';

class DiscoverCompanyHome extends StatefulWidget {
  const DiscoverCompanyHome({super.key});

  @override
  State<DiscoverCompanyHome> createState() => _DiscoverCompanyHomeState();
}

class _DiscoverCompanyHomeState extends State<DiscoverCompanyHome> {
  bool isFavorite = false;
  bool isLoading = true;
  List<Map<String, String>> cardData = [];
  List<Map<String, String>> filteredCardData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    var postBox = await Hive.openBox<Post>('postBox');
    var userBox = await Hive.openBox<User>('userBox');

    List<Map<String, String>> tempCardData = [];

    for (var postKey in postBox.keys) {
      var post = postBox.get(postKey) as Post;
      var user = userBox.get(post.poster) as User;

      tempCardData.add({
        'title': user.name,
        'time': DateFormat('dd MMM yyyy, HH:mm').format(post.time_posted),
        'event': post.title,
        'description': post.description,
        'imagePath': user.picture ?? 'lib/assets/logo.png', // Use placeholder if null,

      });
    }

    setState(() {
      cardData = tempCardData;
      filteredCardData = cardData;
      isLoading = false;
    });
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
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
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
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0)),
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
                              color: Colors.grey, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0,
                              left: 20.0,
                              right: 20.0,
                              bottom: 18.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          item['imagePath']!),
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
                MaterialPageRoute(builder: (context) => upload_status()),
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
