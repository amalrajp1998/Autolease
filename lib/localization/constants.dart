import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'demo_localization.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValue(key);
}

const String LANGUAGE_CODE = 'languageCode';
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case 'en':
      _temp = Locale(languageCode, 'US');
      break;
    case 'ar':
      _temp = Locale(languageCode, 'SA');
      break;
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences __prefs = await SharedPreferences.getInstance();
  String languageCode = __prefs.getString(LANGUAGE_CODE) ?? 'en';
  return _locale(languageCode);
}
