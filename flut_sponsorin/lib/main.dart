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

import 'models/user.dart';
import 'models/event.dart';
import 'models/proposal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(ProposalAdapter());

  // Populate userBox if empty
  var userBox = await Hive.openBox<User>('userBox');
  // userBox.clear();
  if (userBox.isEmpty) {
    await populateUserBox();
  }
  await Hive.openBox('eventBox');
  await Hive.openBox('proposalBox');
  // await Hive.openBox('postBox');
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
      picture: 'assets/picture_user1.png',
      name: 'admin',
      password: 'qwerty',
      company: 'UK Petra',
      email: 'admin@mail.com',
      phone: '081234561111',
      website: null,
    ),
    User(
      id: startIndex+2,
      role: 'sponsor',
      picture: 'assets/picture_user2.png',
      name: 'petra',
      password: '12345',
      company: 'UK Petra',
      email: 'petra@mail.com',
      phone: '081234562222',
      website: 'petra.ac.id',
    ),
    User(
      id: startIndex+3,
      role: 'sponsor',
      picture: 'assets/picture_user3.png',
      name: 'irgl',
      password: '12345',
      company: 'UK Petra',
      email: 'irgl@mail.com',
      phone: '081234563333',
      website: 'irgl.petra.ac.id',
    ),
    User(
      id: startIndex+4,
      role: 'seeker',
      picture: 'assets/picture_user4.png',
      name: 'savio',
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
