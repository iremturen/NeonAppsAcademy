import 'package:objectbox/objectbox.dart';

@Entity()
class CoralMemoryFragment {
  @Id()
  int id;

  String title;
  String species;
  String category;
  String imageUrl;

  @Property(type: PropertyType.date)
  DateTime discoveredAt;

  String location;
  String description;

  CoralMemoryFragment({
    this.id = 0,
    required this.title,
    required this.species,
    required this.category,
    this.imageUrl = '',
    required this.discoveredAt,
    required this.location,
    required this.description,
  });
}