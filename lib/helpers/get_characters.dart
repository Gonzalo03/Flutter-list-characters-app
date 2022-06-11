import 'dart:convert';

import 'package:gotobun_app/models/character.dart';
import 'package:http/http.dart' as http;

Future<List<Character>> getCharacters() async {
  final res = await http
      .get(Uri.parse('https://api.jikan.moe/v4/anime/38101/characters'));

  final data = jsonDecode(res.body)['data'];

  List<Character> characters = [];

  for (var qq in data) {
    if (qq['character']['name'].contains('Nakano') &&
        !qq['character']['name'].contains('Maruo')) {
      characters.add(Character.fromJson(qq));
    }
  }

  return characters;
}
