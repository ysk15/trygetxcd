import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
import 'ml_IN.dart';

class LocaleService extends Translations {
  static Locale get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en_US,
    'ml_IN': ml_IN,
  };

  static final locales = [
    Locale('en', 'US'),
    Locale('ml', 'IN'),
  ];

  static final langs = [
    'English',
    'മലയാളം',
  ];

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}