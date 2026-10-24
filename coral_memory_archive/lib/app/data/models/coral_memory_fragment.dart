import 'package:objectbox/objectbox.dart';

@Entity()
class CoralMemoryFragment {
  @Id()
  int id;

  @Index()
  String title;

  @Index()
  String species;

  @Index()
  String category;

  String imageUrl;

  @Index()
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

  CoralMemoryFragment copyWith({
    int? id,
    String? title,
    String? species,
    String? category,
    String? imageUrl,
    DateTime? discoveredAt,
    String? location,
    String? description,
  }) {
    return CoralMemoryFragment(
      id: id ?? this.id,
      title: title ?? this.title,
      species: species ?? this.species,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      discoveredAt: discoveredAt ?? this.discoveredAt,
      location: location ?? this.location,
      description: description ?? this.description,
    );
  }
}
