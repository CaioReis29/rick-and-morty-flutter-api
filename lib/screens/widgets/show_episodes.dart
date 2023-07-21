import 'package:flutter/material.dart';
import '../../model/character.dart';

class ShowEpisodes extends StatelessWidget {
  final Character character;

  const ShowEpisodes({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'Episodes ',
                    style: Theme.of(context).textTheme.titleSmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: '(Total: ${character.episodes.length})',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17
                          ),
                      )
                    ]
                  )
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: character.episodes.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final episode = character.episodesDetail[index];
                return ListTile(
                  title: Text(
                    episode.name,
                    style: const TextStyle(
                      fontFamily: "Acme",
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    episode.episode,
                    style: const TextStyle(
                      fontFamily: "Acme",
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
