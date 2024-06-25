import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String role;

  @HiveField(2)
  String? picture;

  @HiveField(3)
  String name;

  @HiveField(4)
  String password;

  @HiveField(5)
  String company;

  @HiveField(6)
  String email;

  @HiveField(7)
  String? phone;

  @HiveField(8)
  String? website;

  @HiveField(9)
  String? brief;

  @HiveField(10)
  String? about;

  @HiveField(11)
  String? address;

  User({
    required this.id,
    required this.role,
    this.picture,
    required this.name,
    required this.password,
    required this.company,
    required this.email,
    this.phone,
    this.website,
    this.brief,
    this.about,
    this.address
  });
}
