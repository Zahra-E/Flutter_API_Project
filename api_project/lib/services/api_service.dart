import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const String url =
      'https://rickandmortyapi.com/api/character';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['results'] as List)
          .map((item) => Character.fromJson(item))
          .toList();
    }

    throw Exception('Failed to load characters');
  }
}