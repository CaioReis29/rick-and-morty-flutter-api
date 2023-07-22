import 'package:rick_and_morty_app/model/detail_episodes.dart';


class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOrigin origin;
  final CharacterLocation location;
  final String image;
  final List<String> episodes;
  final String url;
  final String created;
  final List<EpisodesDetail> episodesDetail;


  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episodes,
    required this.url,
    required this.created, 
    required this.episodesDetail,
  });
}

class CharacterOrigin {
  String name;
  String url;

  CharacterOrigin({
    required this.name,
    required this.url,
  });
}

class CharacterLocation {
  String name;
  String url;

  CharacterLocation({
    required this.name,
    required this.url,
  });


}

