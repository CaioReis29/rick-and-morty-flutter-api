import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/components/animation/loading.dart';
import 'package:rick_and_morty_app/screens/details_screen.dart';
import 'package:rick_and_morty_app/services/all_page_character.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Rick and Morty characters',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder<List>(
        future: fetchAllCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error to loading characters'),
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
                      shadowColor: Colors.green,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
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
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(snapshot.data![index].image),
                            radius: 40,
                          ),
                        title: Text(
                          snapshot.data![index].name,
                          style: const TextStyle(
                            fontFamily: "Acme",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data![index].origin.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Acme",
                            fontWeight: FontWeight.w500
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
