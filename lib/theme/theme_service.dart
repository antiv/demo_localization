import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:http/http.dart' as http;

class ThemeService extends ChangeNotifier {
  /// set singleton
  static final ThemeService _instance = ThemeService._internal();
  factory ThemeService() => _instance;
  ThemeService._internal();


  void notify() {
    notifyListeners();
  }

  ThemeData theme = ThemeData();

  setTheme(String? themeId) async {
    final themeJson = await load(themeId);
    theme = ThemeDecoder.decodeThemeData(
      themeJson,
      validate: true,
      ) ?? ThemeData();
    notifyListeners();
  }

  Future<Map<String, dynamic>> load(String? themeId) async {
    log('Theme loader: load http: $themeId');
    try {
      final url = _getThemeUrl(themeId);
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final theme = json.decode(utf8.decode(res.bodyBytes));
        return theme;
      } else {
        return _loadFromAsset(themeId);
      }
    } catch (e) {
      //Catch network exceptions
      return _loadFromAsset(themeId);
    }
  }

  Future<Map<String, dynamic>> _loadFromAsset(String? themeId) async {
    final string =  await rootBundle
        .loadString('assets/themes/$themeId.json');
    final res = json.decode(string);
    return res;
  }

  _getThemeUrl(String? themeId) {
    switch (themeId) {
      case 'green':
        return Uri.parse('https://api.jsonserve.com/GJ7dYl');
      case 'red':
        return Uri.parse('https://api.jsonserve.com/guGepf');
      default:
        return Uri.parse('https://api.jsonserve.com/Rwdmlv');
    }
  }
}