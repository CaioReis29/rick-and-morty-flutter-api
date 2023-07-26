import 'package:rick_and_morty_app/model/detail_episodes.dart';


class Character {
  final int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  CharacterOrigin origin;
  CharacterLocation location;
  String image;
  List<String> episodes;
  String url;
  String created;
  List<EpisodesDetail> episodesDetail;


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

