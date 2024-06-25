import 'package:flut_sponsorin/company_view/discover_company.dart';
import 'package:flutter/material.dart';
import 'package:flut_sponsorin/login.dart';

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
    return const MaterialApp(
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
      role: 'seeker',
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
      role: 'seeker',
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
      role: 'seeker',
      picture: 'lib/assets/picture_user3.jpg',
      name: 'Informatics Rally Games and Logic',
      password: '12345',
      company: 'UK Petra',
      email: 'irgl@mail.com',
      phone: '081234563333',
      website: 'irgl.petra.ac.id',
      brief: 'Informatics Rally Games and Logic (IRGL) adalah lomba tahunan dari Universitas Kristen Petra Surabaya untuk tingkat SMA dan sederajat.',
      about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fermentum euismod eros, in tempor lacus laoreet at. Morbi in elit quis leo fermentum suscipit vitae.',
      address: 'Jl. Siwalankerto No.121-131, Siwalankerto'
    ),
    User(
      id: startIndex+4,
      role: 'sponsor',
      picture: 'lib/assets/mandira.png',
      name: 'PT. Mandira',
      password: '1212',
      company: 'Mandira',
      email: 'mandira@gmail.com',
      phone: "081123456789",
      website: "www.mandira.co.id",
      brief: "Mandira terus bertumbuh dengan puluhan ribu karyawan yang tersebar di berbagai cabang yang ada di seluruh Indonesia.",
      about: "Berdiri sejak tahun 1968, PT Mandiri telah menjadi Bank Swasta terbesar kedua di Indonesia. Berkomitmen untuk memberikan pelayanan terbaik kepada nasabah dan menjadi bank yang dapat dipercaya oleh seluruh nasabah.",
      address: 'Jl. Raya Surabaya No.123, Surabaya, East Java, Indonesia'
    ),
    User(
        id: startIndex+5,
        role: 'sponsor',
        picture: 'lib/assets/alpha.jpeg',
        name: 'PT. Alpha',
        password: '1212',
        company: 'Alpha Company',
        email: 'alpha@mail.com',
        phone: "081123456789",
        website: "www.alpha.co.id",
        brief: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit.",
        about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fermentum euismod eros, in tempor lacus laoreet at. Morbi in elit quis leo fermentum suscipit vitae.",
        address: 'Jl. Alpha 1'
    ),
    User(
        id: startIndex+6,
        role: 'sponsor',
        picture: 'lib/assets/beta.jpeg',
        name: 'PT. Beta',
        password: '1212',
        company: 'Beta Company',
        email: 'beta@mail.com',
        phone: "081123456789",
        website: "www.beta.co.id",
        brief: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit.",
        about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fermentum euismod eros, in tempor lacus laoreet at. Morbi in elit quis leo fermentum suscipit vitae.",
        address: 'Jl. Beta 1'
    ),
    User(
        id: startIndex+7,
        role: 'sponsor',
        picture: 'lib/assets/charlie.jpeg',
        name: 'PT. Charlie',
        password: '1212',
        company: 'Charlie Company',
        email: 'charlie@mail.com',
        phone: "081123456789",
        website: "www.charlie.co.id",
        brief: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit.",
        about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fermentum euismod eros, in tempor lacus laoreet at. Morbi in elit quis leo fermentum suscipit vitae.",
        address: 'Jl. Charlie 1'
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
    Post(
        id: startIndex+4,
        poster: 4,
        title: "Peluncuran Produk Baru",
        description: "📢 PT. Mandira dengan bangga mengumumkan peluncuran produk terbaru kami, MandiraFlex! 🎉 Dengan MandiraFlex, Anda dapat menikmati fleksibilitas finansial yang lebih besar dengan bunga kompetitif dan proses persetujuan yang cepat. Segera kunjungi cabang terdekat atau akses melalui aplikasi mobile kami untuk informasi lebih lanjut. Investasikan masa depan Anda bersama MandiraFlex! #MandiraFlex #InvestasiMasaDepan #KeuanganMandira",
        time_posted: DateTime.timestamp()
    ),
    Post(
        id: startIndex+5,
        poster: 4,
        title: "Edukasi Keuangan",
        description: "Tahukah Anda? Mengelola keuangan dengan bijak adalah kunci untuk mencapai stabilitas dan kebebasan finansial. PT. Mandira berkomitmen untuk membantu Anda melalui program edukasi keuangan kami. Ikuti webinar gratis kami tentang Perencanaan Keuangan Pribadi pada hari Sabtu ini pukul 10.00 WIB. Daftar sekarang dan mulailah perjalanan finansial Anda dengan langkah yang tepat! #EdukasiKeuangan #MandiraEdu #WebinarFinansial",
        time_posted: DateTime.timestamp()
    ),
    Post(
        id: startIndex+6,
        poster: 4,
        title: "Program CSR",
        description: "PT. Mandira kembali hadir dengan program Corporate Social Responsibility (CSR) kami yang bertujuan meningkatkan kesejahteraan masyarakat. Kali ini, kami mendukung pendidikan anak-anak kurang mampu dengan menyumbangkan 1.000 paket perlengkapan sekolah. Bersama kita bisa membuat perubahan positif. Terima kasih atas dukungan Anda yang terus menerus! #MandiraPeduli #CSR #PendidikanUntukSemua",
        time_posted: DateTime.timestamp()
    ),
    Post(
        id: startIndex+7,
        poster: 5,
        title: "New Store",
        description: "📸✨ Say hello to your new favorite shopping destination! Alpha Corp’s newest retail store is opening in the heart of Chicago this Saturday. Expect exclusive discounts, fun activities, and a special gift for the first 100 customers. Tag your shopping buddy and mark your calendar! #AlphaCorp #GrandOpening #RetailHeaven #Chicago",
        time_posted: DateTime.timestamp()
    ),
    Post(
        id: startIndex+8,
        poster: 5,
        title: "We Are Hiring",
        description: "We are excited to share that Alpha Corp is expanding! Our latest retail store is set to open in downtown Chicago this Saturday. This new location will feature a wide range of our premium products and exceptional customer service that our brand is known for. We invite you to join us for the grand opening celebration, which includes exclusive discounts, special gifts for the first 100 customers, and various exciting activities. Looking forward to serving the Chicago community! #AlphaCorp #RetailExpansion #GrandOpening #CustomerFirst",
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
