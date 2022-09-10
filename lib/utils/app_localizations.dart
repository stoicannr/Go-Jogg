import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_flutter/resources.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  Map<String, String>? _localizedStrings;

  static LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  static AppLocalizations? of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  Future<bool> load() async {
    final jsonString = await rootBundle.loadString('assets/locale/${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String? translate(String key) => _localizedStrings?[key];
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final List<String> _localeLanguages = Locales.appLocales.keys.toList();

  @override
  bool isSupported(Locale locale) => _localeLanguages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}