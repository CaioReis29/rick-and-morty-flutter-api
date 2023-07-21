import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/model/detail_episodes.dart';

class EpisodeService {
  static const String resource = "episode/";
  String baseUrl = "https://rickandmortyapi.com/api/";
  http.Client client = http.Client();

  String getUrl(String endpoint) {
    return "$baseUrl$endpoint";
  }

  Future<List<EpisodesDetail>> fetchEpisodeDetails(List<String> episodeUrls) async {
  List<EpisodesDetail> episodesDetail = [];

  for (String url in episodeUrls) {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      EpisodesDetail episodeDetail = EpisodesDetail.fromJson(data);
      episodesDetail.add(episodeDetail);
    } else {
      throw Exception('Failed to load episode detail');
    }
  }

  return episodesDetail;
}
}
