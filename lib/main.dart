import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/screens/initial_screen.dart';
import 'package:rick_and_morty_app/themes/my_theme.dart';
import 'package:rick_and_morty_app/translations/app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty APP',
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      translations: AppTranslations(),
      home: const InitialScreen(),
      theme: myTheme,
    );
  }
}


