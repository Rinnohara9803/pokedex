import 'package:pokedex/data/data-providers/pokemon_api.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import '../models/initial_pokemon_model.dart';

class PokemonRepo {
  final PokemonApi pokeApi = PokemonApi();

  Future<List<InitialPokemonListModel>> fetchListOfPokemons() async {
    List<InitialPokemonListModel> pokemonList = [];

    await pokeApi.fetchListOfPokemons().then((data) {
      for (var i in data['results']) {
        pokemonList
            .add(InitialPokemonListModel(name: i['name'], url: i['url']));
      }

      return pokemonList;
    }).catchError((e) {
      throw Exception('Failed to fetch data.');
    });
    return pokemonList;
  }

  Future<PokemonDetailsModel> fetchPokemonDetails(String url) async {
    late PokemonDetailsModel pokemon;
    await pokeApi.fetchPokemonDetails(url).then((data) {
      List<String> types = [];
      List<String> abilites = [];
      for (var i in data['types']) {
        types.add(i['type']['name']);
      }

      for (var i in data['abilities']) {
        abilites.add(i['ability']['name']);
      }

      pokemon = PokemonDetailsModel(
        id: data['id'],
        order: data['order'],
        baseExperience: data['base_experience'],
        name: data['name'],
        imageUrl: data['sprites']['front_default'],
        types: types,
        abilities: abilites,
      );
      return pokemon;
    }).catchError((e) {
      throw Exception('Failed to fetch data');
    });
    return pokemon;
  }
}
