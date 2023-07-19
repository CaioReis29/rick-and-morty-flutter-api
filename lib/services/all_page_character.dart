import 'package:rick_and_morty_app/services/character_service.dart';

import '../model/character.dart';

const int maxPages = 9;

Future<List<Character>> fetchAllCharacters() async {
  List<Character> allCharacters = [];
  int currentPage = 1;

  while (currentPage <= maxPages) {
    List<Character> charactersOnPage = await fetchCaracters(currentPage);
    allCharacters.addAll(charactersOnPage);
    currentPage++;
  }

  return allCharacters;
}

