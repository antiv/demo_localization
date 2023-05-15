import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'l10n/l10.dart';

class Language {
  Locale locale;
  String langName;
  Language({
    required this.locale,
    required this.langName,
  });
}

class LangSelector extends StatelessWidget {
  LangSelector({super.key});

  final List<Language> languageList = L10n.all.map((e) {
    return Language(
        langName:L10n.getLanguageName(e.scriptCode != null ? '${e.languageCode}_${e.scriptCode}' : e.languageCode),
        locale: e.languageCode == 'sr_Latn'
            ? const Locale('sr', 'RS')
            : e
    );
  }).toList();

  // late final Language? selectedLang;

  @override
  Widget build(BuildContext context) {
    Language selectedLang = languageList.firstWhere((element) => element.locale == context.locale);
    return PreferredSize(
      preferredSize: const Size.fromHeight(20.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DropdownButton<Language>(
          iconSize: 18,
          elevation: 16,
          value: selectedLang,
          style: const TextStyle(color: Colors.cyan),
          underline: Container(
            padding: const EdgeInsets.only(left: 4, right: 4),
            color: Colors.transparent,
          ),
          onChanged: (newValue) {
            context.setLocale(newValue!.locale);
            selectedLang = newValue;
          },
          selectedItemBuilder: (BuildContext context) {
            return languageList.map<Widget>((Language item) {
              return Text(
                item.langName,
                style: const TextStyle(color: Colors.white),
              );
            }).toList();
          },
          items: languageList
              .map<DropdownMenuItem<Language>>((Language value) {
            return DropdownMenuItem<Language>(
              value: value,
              child: Text(
                value.langName,
                style: TextStyle(
                  color: value == selectedLang ? Colors.black :Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
