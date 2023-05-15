import 'package:flutter/material.dart';

class L10n{
  static final all = [
    const Locale('en', 'US'),
    const Locale('fr', 'FR'),
    const Locale.fromSubtags( languageCode: 'sr', scriptCode: 'Cyrl', countryCode: 'RS'),
    const Locale.fromSubtags( languageCode: 'sr', scriptCode: 'Latn', countryCode: 'RS'),//Locale('sr', 'RS'),
    const Locale('de', 'DE'),
  ];

  /// converter sr cir to sr latin
  static String convertSr(String lang) {
    if (lang == 'sr_RS') {
      return 'sr_RSL';
    }
    return lang;
  }

  static getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'sr_Cyrl':
        return 'Српски';
      case 'sr_Latn':
        return 'Srpski';
      case 'de':
        return 'Deutsch';
      default:
        return 'English';
    }
  }
}