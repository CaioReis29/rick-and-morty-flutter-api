import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/components/sections/header.dart';
import 'package:rick_and_morty_app/screens/widgets/floating_list.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';
import 'package:rick_and_morty_app/translations/app_translations.dart';
import '../model/character.dart';

class DetailsScreen extends StatelessWidget {

  final Character character;


  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppTranslations translations = AppTranslations();

    final Map<String, IconData> titleToIcon = {
      'name_details'.tr: CupertinoIcons.person_crop_circle,
      'status_details'.tr: CupertinoIcons.heart_circle,
      'specie_details'.tr: Icons.psychology_alt,
      'gender_details'.tr: Icons.transgender,
      'origin_details'.tr: Icons.house,
      'localization_details'.tr: Icons.place,
    };
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingList(character: character),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.return_icon)),
        title: Text(
          'detail_character'.tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: <Widget>[
          Header(character: character),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                String title, description;
                switch (index) {
                  case 0:
                    title = 'name_details'.tr;
                    description = character.name;
                    break;
                  case 1:
                    title = 'status_details'.tr;
                    description = translations.statusTranslated(character);
                    break;
                  case 2:
                    title = 'specie_details'.tr;
                    description = translations.specieTranslated(character);
                    break;
                  case 3:
                    title = 'gender_details'.tr;
                    description = translations.genderTranslated(character);
                    break;
                  case 4:
                    title = 'origin_details'.tr;
                    description = translations.originNameTranslation(character);
                    break;
                  case 5:
                    title = 'localization_details'.tr;
                    description = character.location.name;
                    break;
                  default:
                    title = "";
                    description = "";
                }
                return Column(
            children: [
              ListTile(
                leading: Icon(
                  titleToIcon[title],
                  size: 40,
                  color: AppColors.shadowColor,
                ),
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge
                ),
                subtitle: Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(),
            ],
          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
