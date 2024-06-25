import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flut_sponsorin/company_view/upload_status.dart';
import '../models/user.dart';
import '../models/post.dart';

import '../globals.dart' as globals;

class DiscoverCompanyHome extends StatefulWidget {
  const DiscoverCompanyHome({super.key});

  @override
  State<DiscoverCompanyHome> createState() => _DiscoverCompanyHomeState();
}

class _DiscoverCompanyHomeState extends State<DiscoverCompanyHome> {
  bool isLoading = true;
  List<Map<String, dynamic>> cardData = [];
  List<Map<String, dynamic>> filteredCardData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    var postBox = await Hive.openBox<Post>('postBox');
    var userBox = await Hive.openBox<User>('userBox');

    List<Map<String, dynamic>> tempCardData = [];

    for (var postKey in postBox.keys) {
      var post = postBox.get(postKey) as Post;
      var user = userBox.get(post.poster) as User;

      if (user.role == globals.loggedInUser?.role) {
        continue;
      } else {
        tempCardData.add({
          'title': user.name,
          'time': DateFormat('dd MMM yyyy, HH:mm').format(post.time_posted),
          'event': post.title,
          'description': post.description,
          'imagePath': user.picture ?? 'lib/assets/logo.png', // Use placeholder if null,
          'isFavorite': "false", // Initialize isFavorite as false
        });
      }
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

  void _toggleFavorite(int index) {
    setState(() {
      filteredCardData[index]['isFavorite'] = (filteredCardData[index]['isFavorite'] == 'true')? "false": "true";
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
              ? const Center(child: CircularProgressIndicator())
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
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredCardData.length,
                  itemBuilder: (context, index) {
                    final item = filteredCardData[index];
                    String isFavorite = (item['isFavorite'] == 'true')? "false": "true";

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
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        item['imagePath']!),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          item['title']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          item['time']!,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PopupMenuButton(
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        value: 'Option 1',
                                        child: Text('Option 1'),
                                      ),
                                      const PopupMenuItem(
                                        value: 'Option 2',
                                        child: Text('Option 2'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item['event']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item['description']!,
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  _toggleFavorite(index);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      item['isFavorite'] == 'true'
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: item['isFavorite'] == 'true'
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    const SizedBox(width: 5),
                                    const Expanded(
                                      child: Text(
                                        'Like',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const upload_status()),
              );
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
