import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../model/pokemon.dart';

class PokemonApi {
  static Future<Pokemon?> getPokemonDetails(String name) async {
    try {
      final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$name");
      final response = await http.get(url);
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      return Pokemon.fromJson(decoded);
    } catch (eror) {
      throw HttpException(eror.toString());
    }
  }

  static Future<String> getPokemonFlavourText(String name) async {
    try {
      final url = Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$name");
      final response = await http.get(url);
      final decoder = jsonDecode(response.body) as Map<String, dynamic>;
      return decoder["flavor_text_entries"][0]["flavor_text"];
    } catch (errore) {
      throw HttpException(errore.toString());
    }
  }
}
