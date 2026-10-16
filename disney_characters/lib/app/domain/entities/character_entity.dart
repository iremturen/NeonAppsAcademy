class CharacterEntity {
  final int id;
  final String name;
  final String? imageUrl;
  final List<String> films;
  final List<String> shortFilms;
  final List<String> tvShows;
  final List<String> videoGames;
  final List<String> parkAttractions;
  final List<String> allies;
  final List<String> enemies;
  final String url;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.films,
    required this.shortFilms,
    required this.tvShows,
    required this.videoGames,
    required this.parkAttractions,
    required this.allies,
    required this.enemies,
    required this.url,
  });
}