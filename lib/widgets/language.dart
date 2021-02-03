import '../localization/constants.dart';
import '../provider/language_list.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Lng extends StatefulWidget {
  @override
  _LngState createState() => _LngState();
}

class _LngState extends State<Lng> {
  void _changeLanguage(Language language) async {
    // print(language.languageCode);
    Locale _temp = await setLocale(language.languageCode);

    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DropdownButton(
        underline: SizedBox(),
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>((lng) => DropdownMenuItem(
                  value: lng,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text(lng.name), Text(lng.flag)],
                  ),
                ))
            .toList(),
        onChanged: (Language language) {
          _changeLanguage(language);
        },
        icon: Icon(
          Icons.language,
          color: Colors.white,
        ),
      ),
    );
  }
}
