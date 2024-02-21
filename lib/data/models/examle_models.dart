// {"id":540,
// "title":"Overwatch 2",
// "thumbnail":"https:\/\/www.freetogame.com\/g\/540\/thumbnail.jpg",
// "short_description":"A hero-focused first-person team shooter from Blizzard Entertainment.",
// "game_url":"https:\/\/www.freetogame.com\/open\/overwatch-2",
// "genre":"Shooter","platform":"PC (Windows)",
// "publisher":"Activision Blizzard",
// "developer":"Blizzard Entertainment",
// "release_date":"2022-10-04",
// "freetogame_profile_url":"https:\/\/www.freetogame.com\/overwatch-2"}
import 'dart:convert';

class ExampleModels {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;

  ExampleModels({
    required this.id,
    required this.title,
    required this.developer,
    required this.freetogameProfileUrl,
    required this.gameUrl,
    required this.genre,
    required this.publisher,
    required this.releaseDate,
    required this.shortDescription,
    required this.thumbnail
});

  factory ExampleModels.fromJson(Map<String,dynamic>json){
    return ExampleModels(
    id: json['id'] as int ?? 0,
    title:json['title'] as String ?? "",
    developer: json['developer'] as String ?? "",
    freetogameProfileUrl: json['freetogame_profile_url'] as String ?? "",
    gameUrl: json['game_url'] as String ?? "",
    genre: json['genre'] as String ?? "",
    publisher: json['publisher'] as String ?? "",
    releaseDate: json['release_date'] as String ?? "",
    shortDescription: json['short_description'] as String ?? "",
    thumbnail: json['thumbnail'] as String ?? "");
  }

}
