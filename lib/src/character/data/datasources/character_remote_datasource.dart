import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kdigital_test/src/character/data/models/character_model.dart';

class CharacterRemoteDataSource {
  CharacterRemoteDataSource(this.client);
  final http.Client client;

  Future<List<CharacterModel>> fetchCharacters(int page) async {
    try {
      final response = await client.get(
        Uri.parse("https://rickandmortyapi.com/api/character/?page=$page"),
      );

      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body) as Map<String, dynamic>;

        return (jsonMap['results'] as List<dynamic>).map((json) => CharacterModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load characters: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Error fetching characters: $e');
    }
  }
}
