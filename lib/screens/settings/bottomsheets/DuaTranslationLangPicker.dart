import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/localizations/locales.dart';
import 'package:adhanly/models/app_local.dart';
import 'package:adhanly/prviders/dependencies/DuaDependencyProvider.dart';
import 'package:adhanly/screens/settings/bottomsheets/Chooser.dart';
import 'package:provider/provider.dart';


class DuaTranslationLangPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appLocale = context.appLocale;
    final duaDependency = context.watch<DuaDependencyProvider>();
    final langs = [
      appLocale.primary_language,
      ...supportedLocales
          .where((element) => element.duaElementsAvailable)
          .map((e) => e.languageName)
          .toList()
    ];
    return choosingContainer(
        context: context,
        title: appLocale.translation_lang,
        titles: langs,
        subtitles: [],
        selected: (i) => i > 0
            ? (duaDependency.sameAsPrimaryLang
                ? !duaDependency.sameAsPrimaryLang
                : duaDependency.translationLang ==
                    supportedLocales[i].languageCode)
            : duaDependency.sameAsPrimaryLang,
        onChoosen: (i) => i == 0
            ? duaDependency.setDuaLangToPrimary()
            : duaDependency.changeTranslationLang(
                AppLocale.byName(langs[i]).languageCode,
              ),
        percentageUpto: 0.6);
  }
}
