import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/components/animation/loading.dart';
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

  CharacterService service = CharacterService();

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
      body: FutureBuilder<List>(
        future: service.fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('error_loading_characters'.tr),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
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
                                return DetailsScreen(character: snapshot.data![index]);
                              }),
                            );
                          },
                          leading: CircleAvatar(
                              backgroundColor: AppColors.buttonBackground,
                              backgroundImage: NetworkImage(snapshot.data![index].image),
                              radius: 40,
                            ),
                          title: Text(
                            snapshot.data![index].name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            snapshot.data![index].location.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
