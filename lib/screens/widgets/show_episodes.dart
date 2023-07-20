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
            Text(
              'Episodes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: character.episodes.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final episode = character.episodes[index];
                return ListTile(
                  title: Text(
                    episode,
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
