import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/models/pokemon.dart';
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
      await pokemonRepo.fetchPokemonListViaHive().then((value) async {
        if (value.isNotEmpty) {
          pokemonList = value
              .map((e) => PokemonDetailsModel(
                  id: e.id, name: e.name, imageUrl: e.imageUrl, types: e.types))
              .toList();
          state = pokemonList;
          hasFetched = !hasFetched;
          return;
        }
        await pokemonRepo.fetchListOfPokemons().then((value) async {
          for (var i in value) {
            await pokemonRepo.fetchPokemonDetails(i.url).then((value) async {
              pokemonList = [...state, value];
              state = pokemonList;
              await pokemonRepo
                  .storePokemonsInHiveBox(pokemonList
                      .map(
                        (e) => Pokemon(
                          e.id,
                          e.name,
                          e.imageUrl,
                          e.types,
                          DateTime.now().millisecondsSinceEpoch,
                        ),
                      )
                      .toList())
                  .then((value) {
                log('success');
              }).catchError((e) {
                log('error');
              });
            }).catchError((e) {
              throw Exception(e.toString());
            });
          }
          hasFetched = !hasFetched;
        }).catchError((e) {
          throw Exception(e.toString());
        });
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
