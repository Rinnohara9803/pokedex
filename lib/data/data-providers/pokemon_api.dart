import 'dart:convert';

import 'package:http/http.dart' as http;

class PokemonApi {
  Future<dynamic> fetchListOfPokemons() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=20&limit=20'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<dynamic> fetchPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
