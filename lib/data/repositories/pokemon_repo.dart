import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:pokedex/data/data-providers/pokemon_api.dart';
import 'package:pokedex/data/models/pokemon_detail_model.dart';
import '../models/initial_pokemon_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

  // Future<void> storePokemonsInSqfLite(PokemonDetailsModel pokemon) async {
  //   final String path = await getDatabasesPath();
  //   final String dbPath = join(path, 'pokemon_database.db');

  //   final Database database = await openDatabase(dbPath, version: 1,
  //       onCreate: (Database db, int version) async {
  //     await db.execute(
  //       'CREATE TABLE IF NOT EXISTS pokemon (id INTEGER PRIMARY KEY, name TEXT, imageUrl Text, types TEXT, timestamp INTEGER)',
  //     );
  //   });

  //   final currentTime = DateTime.now().millisecondsSinceEpoch;

  //   final existingRow = await database.query(
  //     'pokemon',
  //     where: 'id = ?',
  //     whereArgs: [pokemon.id],
  //   );

  //   if (existingRow.isEmpty) {
  //     await database.insert(
  //       'pokemon',
  //       {
  //         'id': pokemon.id,
  //         'name': pokemon.name,
  //         'imageUrl': pokemon.imageUrl,
  //         'types': jsonEncode(pokemon.types),
  //         'timestamp': currentTime
  //       },
  //     );
  //   }

  //   await database.close();
  // }

  // Future<List<PokemonDetailsModel>> fetchPokemonsFromSqfLite() async {
  //   final String path = await getDatabasesPath();
  //   final String dbPath = join(path, 'pokemon_database.db');

  //   final Database database = await openDatabase(dbPath, version: 1);

  //   final List<Map<String, dynamic>> result = await database.query('pokemon');
  //   final currentTime = DateTime.now().millisecondsSinceEpoch;
  //   final pokemonList = <PokemonDetailsModel>[];

  //   for (var row in result) {
  //     final timestamp = row['timestamp'] as int;
  //     if (currentTime - timestamp <= 3600000) {
  //       pokemonList.add(
  //         PokemonDetailsModel(
  //           id: row['id'],
  //           name: row['name'],
  //           imageUrl: row['imageUrl'],
  //           types: (jsonDecode(row['types']) as List<dynamic>).cast<String>(),
  //         ),
  //       );
  //     }
  //   }

  //   await database.close();
  //   //     final File dbFile = File(dbPath);

  //   // Delete the database file
  //   //     await dbFile.delete();

  //   return pokemonList;
  // }

  Future<void> storePokemonsInHiveBox(List<Pokemon> pokemonlist) async {
    print('store to hive');
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
    print('featch via hive');
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
    print(pokeList.length);
    return pokeList;
  }
}
