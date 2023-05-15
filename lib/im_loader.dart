import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ImAssetLoader extends AssetLoader {
  String assetPath = 'assets/l10n';
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    log('easy localization loader: load http $path loading locale: ${locale.toString()}');
    try {
      var url = _getLangUrl(locale); //Uri.parse('$path${locale.toString()}.json');
      // await Future.delayed(const Duration(milliseconds: 1000));
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final lang = json.decode(utf8.decode(res.bodyBytes));
        if (locale.toString() == 'sr_Latn_RS') {
          /// convert cyrillic to latin
          lang.forEach((key, value) {
            /// use cyrToLatMap to convert values
            lang[key] = value.toString().replaceAllMapped(
                RegExp(cyrToLatMap.keys.map((e) => e.toString()).join('|')),
                (m) => cyrToLatMap[m.group(0)]!);
          });
        }
        return lang;
      } else {
        return _loadFromAsset(locale);
      }
    } catch (e) {
      //Catch network exceptions
      return _loadFromAsset(locale);
    }
  }

  Future<Map<String, dynamic>> _loadFromAsset(Locale locale) async {
    final string =  await rootBundle
            .loadString('$assetPath/${locale.languageCode}.json');
    final res = json.decode(string);
    if (locale.toString() == 'sr_Latn_RS') {
      /// convert cyrillic to latin
      res.forEach((key, value) {
        /// use cyrToLatMap to convert values
        res[key] = value.toString().replaceAllMapped(
            RegExp(cyrToLatMap.keys.map((e) => e.toString()).join('|')),
            (m) => cyrToLatMap[m.group(0)]!);
      });
    }
    return res;
  }

  _getLangUrl(Locale locale) {
    switch (locale.toString()) {
      case 'en_US':
        return Uri.parse('https://api.jsonserve.com/Wl8nCq');
      case 'fr_FR':
        return Uri.parse('https://api.jsonserve.com/PjQuXC');
      case 'sr_Cyrl_RS':
        return Uri.parse('https://api.jsonserve.com/sDgtZS');
      case 'sr_Latn_RS':
        return Uri.parse('https://api.jsonserve.com/sDgtZS');
      case 'de_DE':
        return Uri.parse('https://api.jsonserve.com/_OdZBy');
      default:
        return Uri.parse('https://api.jsonserve.com/Wl8nCq');
    }
  }

  static get cyrToLatMap => {
    "а": "a",
    "А": "A",
    "б": "b",
    "Б": "B",
    "в": "v",
    "В": "V",
    "г": "g",
    "Г": "G",
    "д": "d",
    "Д": "D",
    "ђ": "đ",
    "Ђ": "Đ",
    "е": "e",
    "Е": "E",
    "ж": "ž",
    "Ж": "Ž",
    "з": "z",
    "З": "Z",
    "и": "i",
    "И": "I",
    "ј": "j",
    "Ј": "J",
    "к": "k",
    "К": "K",
    "л": "l",
    "Л": "L",
    "љ": "lj",
    "Љ": "LJ",
    "м": "m",
    "М": "M",
    "н": "n",
    "Н": "N",
    "њ": "nj",
    "Њ": "NJ",
    "о": "o",
    "О": "O",
    "п": "p",
    "П": "P",
    "р": "r",
    "Р": "R",
    "с": "s",
    "С": "S",
    "т": "t",
    "Т": "T",
    "ћ": "ć",
    "Ћ": "Ć",
    "у": "u",
    "У": "U",
    "ф": "f",
    "Ф": "F",
    "х": "h",
    "Х": "H",
    "ц": "c",
    "Ц": "C",
    "ч": "č",
    "Ч": "Č",
    "Џ": "DŽ",
    "џ": "dž",
    "ш": "š",
    "Ш": "Š",
  };
}
