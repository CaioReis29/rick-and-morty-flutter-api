import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  
  
    final List<Map> locales = [
  
      {'name': 'English', 'locale': const Locale('en', 'US')},
  
      {'name': 'Español', 'locale': const Locale('es', 'AR')},
  
      {'name': 'Português', 'locale': const Locale('pt', 'BR')}
  
    ];
  
  
  
    Future<void> updateLocale(Locale locale) async {
  
      Future.delayed(const Duration(milliseconds: 200), () {
  
        // Atualiza locale do app
  
        Get.updateLocale(locale);
  
      });
  
    }
  
  }  