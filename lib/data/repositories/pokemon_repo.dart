import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/data/data-providers/pokemon_api.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import '../models/initial_pokemon_model.dart';

import '../models/pokemon.dart';

class PokemonRepo {
  final PokemonApi pokeApi = PokemonApi();

  Future<List<InitialPokemonListModel>> fetchListOfPokemons() async {
    List<InitialPokemonListModel> pokemonList = [];

    await pokeApi.fetchListOfPokemons().then((data) {
      for (var i in data['results']) {
        pokemonList.add(
          InitialPokemonListModel(
            name: i['name'],
            url: i['url'],
          ),
        );
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
        name: data['name'],
        imageUrl: data['sprites']['front_default'],
        types: types,
      );
      return pokemon;
    }).catchError((e) {
      throw Exception('Failed to fetch data');
    });
    return pokemon;
  }

  Future<void> storePokemonsInHiveBox(List<Pokemon> pokemonlist) async {
    final box = await Hive.openBox<Pokemon>('pokemon_box');
    for (final pokemon in pokemonlist) {
      final existingPokemon =
          box.values.firstWhereOrNull((p) => p.id == pokemon.id);
      if (existingPokemon == null) {
        box.add(pokemon);
      }
    }
    await box.close();
  }

  Future<List<Pokemon>> fetchPokemonListViaHive() async {
    final box = await Hive.openBox<Pokemon>('pokemon_box');

    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final pokemonList = box.values.toList();
    List<Pokemon> pokeList = [];

    for (var pokemon in pokemonList) {
      if (currentTime - pokemon.timeStamp <= 3600000) {
        pokeList.add(pokemon);
      } else {
        pokemon.delete();
      }
    }

    await box.close();
    return pokeList;
  }
}
