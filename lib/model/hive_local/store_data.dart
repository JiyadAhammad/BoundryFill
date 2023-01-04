import 'package:hive_flutter/adapters.dart';
part 'store_data.g.dart';

@HiveType(typeId: 1)
class Storageitem extends HiveObject {
  Storageitem({
    this.id,
    required this.dateTime,
    required this.data,
  });

  @HiveField(0)
  int? id;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  String data;
}
