import 'dart:convert';

import 'package:gotobun_app/models/character_detail.dart';
import 'package:http/http.dart' as http;

Future<CharacterDetail> getCharactersDetail(int malId) async {
  final res =
      await http.get(Uri.parse('https://api.jikan.moe/v4/characters/$malId'));

  final data = jsonDecode(res.body)['data'];

  final characterDetail = CharacterDetail(
      about: data['about'],
      kanji: data['name_kanji'],
      name: data['name'],
      imageUrl: data['images']['jpg']['image_url']);

  return characterDetail;
}
