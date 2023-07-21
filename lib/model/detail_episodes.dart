class EpisodesDetail {

  final int id;
  final String name;
  final String airDate;
  final String episode;

  EpisodesDetail({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  factory EpisodesDetail.fromJson(Map<String, dynamic> json) {
    return EpisodesDetail(
      id: json["id"], 
      name: json["name"], 
      airDate: json["air_date"], 
      episode: json["episode"]);
  }
}