import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 3)
class Post extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  int poster;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  DateTime time_posted;

  Post({
    required this.id,
    required this.poster,
    required this.title,
    required this.description,
    required this.time_posted,
  });
}
