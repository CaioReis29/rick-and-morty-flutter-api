import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/components/animation/loading.dart';
import 'package:rick_and_morty_app/model/character.dart';
import 'package:rick_and_morty_app/screens/details_screen.dart';
import 'package:rick_and_morty_app/screens/widgets/search_character.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';
import 'package:rick_and_morty_app/services/character_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  CharacterService service = CharacterService();
  final ScrollController scrollController = ScrollController();
  int _currentPage = 1;
  final List<Character> _characters = [];
  final int _charactersPerPage = 10;

  Future<void> _loadMoreCharacters() async {
    List<Character> moreCharacters = await service.fetchCharacters(
      page: _currentPage + 1,
      limit: _charactersPerPage,
    );
    setState(() {
      _currentPage++;
      _characters.addAll(moreCharacters);
      _isLoading = false;
    });
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _loadMoreCharacters();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    _loadMoreCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: SearchCharacter(),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _isLoading
          ? const Loading()
          : ListView.builder(
              controller: scrollController,
              itemCount: _characters.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 14.0,
                    ),
                    child: Card(
                      shadowColor: AppColors.shadowColor,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen(
                                    character: _characters[index]);
                              }),
                            );
                          },
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.shadowColor,
                                width:
                                    2,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: AppColors.buttonBackground,
                              backgroundImage:
                                  NetworkImage(_characters[index].image),
                              radius: 40,
                            ),
                          ),
                          title: Text(
                            _characters[index].name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            _characters[index].location.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
