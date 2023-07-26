import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/model/character.dart';
import 'package:rick_and_morty_app/model/detail_episodes.dart';
import 'package:rick_and_morty_app/services/episodes_service.dart';

class CharacterService {
  static const String resource = "character/";

  String baseUrl = "https://rickandmortyapi.com/api/";

  http.Client client = http.Client();

  String getUrl(String endpoint) {
    return "$baseUrl$endpoint";
  }

  Future<List<Character>> fetchCharacters({ int page = 0, int limit = 10 }) async {
    List<Character> allCharacters = [];
    EpisodeService episodeService = EpisodeService();

    final response = await client.get(Uri.parse(getUrl("$resource?page=$page&limit=$limit")));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data is Map && data.containsKey('results')) {
        final charactersData = data['results'] as List<dynamic>;

        for (var characterData in charactersData) {
          List<String> episodeUrl = List<String>.from(characterData["episode"]);
          List<EpisodesDetail> episodeDetail = await episodeService.fetchEpisodeDetails(episodeUrl);

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
            episodesDetail: episodeDetail,
          );

          allCharacters.add(character);
        }
      } else {
        throw Exception('Invalid API response');
      }
    } else {
      throw Exception('Failed to load information');
    }

    return allCharacters;
  }
}
