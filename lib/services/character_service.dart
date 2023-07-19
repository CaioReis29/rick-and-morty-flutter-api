import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rick_and_morty_app/model/character.dart';

Future<List<Character>> fetchCaracters(int page) async {
  var response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<Character> characters = [];

    for (var characterData in data['results']) {
      Character character = Character(
        id: characterData["id"],
        name: characterData["name"],
        status: characterData["status"],
        species: characterData["species"],
        type: characterData["type"],
        gender: characterData["gender"],
        origin: CharacterOrigin(
          name: characterData["origin"]["name"],
          url: characterData["origin"]["url"],
        ),
        location: CharacterLocation(
          name: characterData["location"]["name"],
          url: characterData["location"]["url"],
        ),
        image: characterData["image"],
        episodes: List<String>.from(characterData["episode"]),
        url: characterData["url"],
        created: characterData["created"],
      );

      characters.add(character);
    }

    return characters;
  } else {
    throw Exception('Failed to load information');
  }
}
