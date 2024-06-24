import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String type;

  @HiveField(2)
  int seeker;

  @HiveField(3)
  DateTime startDate;

  @HiveField(4)
  DateTime? endDate;

  @HiveField(5)
  String description;

  @HiveField(6)
  String? poster;

  @HiveField(7)
  int amount;

  @HiveField(8)
  String? terms;

  @HiveField(9)
  String name;

  @HiveField(10)
  String? venue;

  @HiveField(11)
  int status;

  @HiveField(12)
  String contact;

  Event({
    required this.id,
    required this.type,
    required this.seeker,
    required this.startDate,
    this.endDate,
    required this.description,
    this.poster,
    required this.amount,
    this.terms,
    required this.name,
    this.venue,
    required this.status,
    required this.contact,
  });
}
