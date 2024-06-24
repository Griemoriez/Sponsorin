import 'package:flut_sponsorin/company_view/discover_company.dart';
import 'package:flut_sponsorin/company_view/upload_status.dart';
import 'package:flut_sponsorin/home.dart';
import 'package:flut_sponsorin/signup.dart';
import 'package:flut_sponsorin/splashscreen.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/detail_company.dart';
import 'package:flutter/material.dart';
import 'package:flut_sponsorin/login.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/discover_sponsor.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'models/post.dart';
import 'models/user.dart';
import 'models/event.dart';
import 'models/penawaran.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(PenawaranAdapter());
  Hive.registerAdapter(PostAdapter());

  var userBox = await Hive.openBox<User>('userBox');
  // userBox.clear();
  if (userBox.isEmpty) {
    await populateUserBox();
  }

  var eventBox = await Hive.openBox<Event>('eventBox');
  // eventBox.clear();
  if (eventBox.isEmpty) {
    await populateEvents();
  }

  await Hive.openBox('penawaranBox');

  var postBox = await Hive.openBox<Post>('postBox');
  // postBox.clear();
  if (postBox.isEmpty) {
    await populatePosts();
  }


  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SponsorIn',
      home: LoginScreen(),
    );
  }
}

Future<void> populateUserBox() async {
  var userBox = await Hive.openBox<User>('userBox');
  var startIndex = Hive.box<User>('userBox').length;
  

  final users = [
    User(
      id: startIndex+1,
      role: 'sponsor',
      picture: 'lib/assets/picture_user1.png',
      name: 'Admin',
      password: 'qwerty',
      company: 'UK Petra',
      email: 'admin@mail.com',
      phone: '081234561111',
      website: null,
    ),
    User(
      id: startIndex+2,
      role: 'sponsor',
      picture: 'lib/assets/picture_user2.jpeg',
      name: 'Petra Christian University',
      password: '12345',
      company: 'UK Petra',
      email: 'petra@mail.com',
      phone: '081234562222',
      website: 'petra.ac.id',
    ),
    User(
      id: startIndex+3,
      role: 'sponsor',
      picture: 'lib/assets/picture_user3.jpg',
      name: 'Informatics Rally Games and Logic',
      password: '12345',
      company: 'UK Petra',
      email: 'irgl@mail.com',
      phone: '081234563333',
      website: 'irgl.petra.ac.id',
    ),
    User(
      id: startIndex+4,
      role: 'seeker',
      picture: 'lib/assets/picture_user4.jpg',
      name: 'Savio Enoson',
      password: '1212',
      company: 'UK Petra',
      email: 'C14210278@john.petra.ac.id',
      phone: null,
      website: null,
    ),
  ];

  for (var user in users) {
    await userBox.put(user.id, user);
  }
}

Future<void> populatePosts() async {
  var postBox = await Hive.openBox<Post>('postBox');
  var startIndex = Hive.box<Post>('postBox').length;

  final posts = [
    Post(
      id: startIndex+1,
      poster: 3,
      title: "INFORMATICS RALLY GAMES AND LOGIC",
      description: "Berkembangnya teknologi membuka banyak peluang karir. Jadinya, semakin banyak lowongan baru di bidang teknologi yang bisa dijalani deh! Buat kamu yang tertarik jadi hashtag",
      time_posted: DateTime.timestamp()
    ),
    Post(
        id: startIndex+2,
        poster: 2,
        title: "TECHNOLOGY EXHIBITION AND SEMINAR",
        description: "Acara ini akan menghadirkan pembicara dari berbagai perusahaan teknologi terkemuka. Ayo datang dan tambahkan wawasanmu tentang teknologi terbaru!",
        time_posted: DateTime.timestamp()
    ),
    Post(
        id: startIndex+3,
        poster: 2,
        title: "ARTIFICIAL INTELLIGENCE SUMMIT",
        description: "Diskusikan perkembangan terbaru dalam bidang kecerdasan buatan bersama para ahli dan praktisi di AI Summit 2024.",
        time_posted: DateTime.timestamp()
    ),
  ];

  for (var post in posts) {
    await postBox.put(post.id, post);
  }
}

Future<void> populateEvents() async {
  var eventBox = await Hive.openBox<Event>('eventBox');
  var startIndex = Hive.box<Event>('eventBox').length;

  final events = [
    Event(
        id: startIndex + 1,
        name: "IRGL 2023",
        contact: "081234567890",
        venue: "Universitas Kristen Petra",
        type: 'Competition',
        seeker: 4,
        startDate: DateTime(2023, 10, 1), // October 1, 2023
        endDate: DateTime(2023, 10, 2),   // October 2, 2023
        poster: "lib/assets/irgl.png",
        description: "IRGL 2023 adalah kompetisi tahunan yang menguji kemampuan logika dan pemrograman. Acara ini diselenggarakan di Universitas Kristen Petra dan diikuti oleh peserta dari seluruh Indonesia.",
        amount: 25000000,
        terms: null,
        status: -1
    ),
    Event(
        id: startIndex + 2,
        name: "Bharatika 2023",
        contact: "082345678901",
        venue: "Tunjungan Plaza",
        type: 'Exhibition',
        seeker: 4,
        startDate: DateTime(2023, 11, 15), // November 15, 2023
        endDate: DateTime(2023, 11, 20),   // November 20, 2023
        poster: "lib/assets/bharatika.jpg",
        description: "Bharatika 2023 adalah pameran seni dan budaya yang menampilkan karya seni dari berbagai seniman lokal. Acara ini bertujuan untuk mempromosikan seni dan budaya lokal kepada masyarakat luas.",
        amount: 30000000,
        terms: null,
        status: -1
    ),
    Event(
        id: startIndex + 3,
        name: "Adiwarna 2023",
        contact: "083456789012",
        venue: "Universitas Kristen Petra",
        type: 'Exhibition',
        seeker: 4,
        startDate: DateTime(2023, 3, 10), // March 10, 2023
        endDate: DateTime(2023, 3, 12),  // March 12, 2023
        poster: "lib/assets/adiwarna.jpg",
        description: "Adiwarna 2023 adalah pameran teknologi yang menampilkan inovasi terbaru di bidang teknologi informasi dan komunikasi. Acara ini menghadirkan berbagai perusahaan teknologi terkemuka.",
        amount: 15000000,
        terms: null,
        status: -1
    ),
    Event(
        id: startIndex + 4,
        name: "Tutorial Programming 2023",
        contact: "084567890123",
        venue: "Universitas Kristen Petra",
        type: 'Tutorial',
        seeker: 4,
        startDate: DateTime(2023, 7, 1), // July 1, 2023
        endDate: DateTime(2023, 7, 5),  // July 5, 2023
        poster: null,
        description: "Tutorial Programming 2023 adalah serangkaian workshop yang bertujuan untuk meningkatkan keterampilan pemrograman para peserta. Acara ini akan diisi oleh pembicara-pembicara yang ahli di bidangnya.",
        amount: 8000000,
        terms: null,
        status: -1
    ),
  ];

  for (var event in events) {
    await eventBox.put(event.id, event);
  }
}
