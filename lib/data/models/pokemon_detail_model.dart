class PokemonDetailsModel {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  PokemonDetailsModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
  });
}
