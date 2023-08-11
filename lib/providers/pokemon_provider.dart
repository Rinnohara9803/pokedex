import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import 'package:pokedex/data/repositories/pokemon_repo.dart';

// state notifier for list of pokemons available

class PokemonListNotifier extends StateNotifier<List<PokemonDetailsModel>> {
  PokemonListNotifier() : super([]);

  PokemonRepo pokemonRepo = PokemonRepo();

  bool hasFetched = false;

  List<PokemonDetailsModel> pokemonList = [];

  Future<void> loadPokemons() async {
    if (!hasFetched) {
      await pokemonRepo.fetchListOfPokemons().then((value) async {
        for (var i in value) {
          await pokemonRepo.fetchPokemonDetails(i.url).then((value) {
            pokemonList = [...state, value];
            state = pokemonList;
          }).catchError((e) {
            throw Exception('Failed to fetch data.');
          });
        }
        hasFetched = !hasFetched;
      }).catchError((e) {
        throw Exception('Failed to fetch data.');
      });
    }
  }

  void searchPokemons(String searchTerm) {
    state = [
      ...pokemonList.where((pokemon) =>
          pokemon.name.toLowerCase().contains(searchTerm.toLowerCase()))
    ];
  }
}

final pokemonListProvider =
    StateNotifierProvider<PokemonListNotifier, List<PokemonDetailsModel>>(
        (ref) {
  return PokemonListNotifier();
});
