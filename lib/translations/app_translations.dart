import 'package:get/get.dart';
import 'package:rick_and_morty_app/model/character.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': {
          'welcome_page_app_bar': 'Tradução de idiomas',
          'welcome_page_title': 'Este é um título de boas-vindas traduzido',
          'enter_message': 'Entrar',
          'error_loading_characters': 'Erro ao carregar os personagens',
          'detail_character': 'Detalhes',
          'name_details': 'Nome',
          'status_details': 'Status',
          'specie_details': 'Espécie',
          'gender_details': 'Gênero',
          'origin_details': 'Origem',
          'localization_details': 'Localização',
          'episodes_buttom': 'Episódios',
        },
        'en_US': {
          'welcome_page_app_bar': 'Language Translations',
          'welcome_page_title': 'This is a translated welcom title',
          'enter_message': 'Enter',
          'error_loading_characters': 'Error to loading characters',
          'detail_character': 'Details',
          'name_details': 'Name',
          'status_details': 'Status',
          'specie_details': 'Specie',
          'gender_details': 'Gender',
          'origin_details': 'Origin',
          'localization_details': 'Localization',
          'episodes_buttom': 'Episodes',
        },
        'es_AR': {
          'welcome_page_app_bar': 'Traducciones de idiomas',
          'welcome_page_title': 'Este es un título de bienavenida traducido',
        },
      };

  String statusTranslated(Character character) {
    if (Get.deviceLocale?.languageCode == 'pt' &&
        character.status.contains('Alive')) {
      character.status = "Vivo";
    } else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.status.contains('Dead')) {
      character.status = "Morto";
    } else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.status.contains('unknown')) {
      character.status = "Desconhecido";
    }

    return character.status;
  }

  String specieTranslated(Character character) {
    if (Get.deviceLocale?.languageCode == 'pt' &&
        character.species.contains('Human')) {
      character.species = "Humano";
    } else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.status.contains('Dead')) {
      character.status = "Morto";
    } else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.status.contains('unknown')) {
      character.status = "Desconhecido";
    }

    return character.species;
  }

  String genderTranslated(Character character) {
    if (Get.deviceLocale?.languageCode == 'pt' &&
        character.gender.contains('Male')) {
      character.gender = "Masculino";
    } else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.gender.contains('Female')) {
      character.gender = "Feminino";
    } else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.gender.contains('Genderless')) {
      character.gender = "Sem gênero";
    } else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.gender.contains('unknown')) {
      character.gender = "Desconhecido";
    }

    return character.gender;
  }

  String originNameTranslation(Character character) {
    if (Get.deviceLocale?.languageCode == 'pt' &&
        character.origin.name.contains("Earth (C-137)")) {
      character.origin.name = "Terra (C-137)";
    } 
    
    else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.origin.name.contains("unknown")) {
      character.origin.name = "Desconhecido";
    } 
    
    else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.origin.name.contains("Earth (Replacement Dimension)")) {
      character.origin.name = "Terra (Dimensão de substituição)";
    } 
    
    else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.origin.name.contains("Signus 5 Expanse")) {
      character.origin.name = "Expansão signo 5";
    } 
    
    else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.origin.name.contains("Post-Apocalyptic Earth")) {
      character.origin.name = "Terra pós-apocalíptica";
    }

    else if (Get.deviceLocale?.languageCode == 'pt' &&
        character.origin.name.contains("Purge Planet")) {
      character.origin.name = "Planeta expurgo";
    }

    return character.origin.name;
  }
}
