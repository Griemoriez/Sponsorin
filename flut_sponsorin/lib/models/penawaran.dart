import 'package:hive/hive.dart';

part 'penawaran.g.dart';

@HiveType(typeId: 2)
class Penawaran extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  int event;

  @HiveField(2)
  int? seeker;

  @HiveField(3)
  int? sponsor;

  @HiveField(4)
  int status;

  @HiveField(5)
  DateTime sentDate;

  @HiveField(6)
  DateTime lastAction;

  Penawaran({
    required this.id,
    required this.event,
    this.seeker,
    this.sponsor,
    required this.status,
    required this.sentDate,
    required this.lastAction,
  });
}
