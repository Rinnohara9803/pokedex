import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/presentation/resources/strings_manager.dart';

class PokemonApi {
  Future<dynamic> fetchListOfPokemons() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=20&limit=20'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(ErrorStrings.failedToFetch);
    }
  }

  Future<dynamic> fetchPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(ErrorStrings.failedToFetch);
    }
  }
}
