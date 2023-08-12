import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final List<String> types;

  @HiveField(4)
  final int timeStamp;

  Pokemon(this.id, this.name, this.imageUrl, this.types, this.timeStamp);
}
