class PokemonDetailsModel {
  final int id;
  final int order;
  final int baseExperience;
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;

  PokemonDetailsModel({
    required this.id,
    required this.order,
    required this.baseExperience,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
  });
}
