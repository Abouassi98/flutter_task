import 'package:flutter/material.dart';

import '../../../../presentation/helpers/localization_helper.dart';

enum AppLocale {
  english(
    'en',
  ),
  arabic(
    'ar',
  );

  const AppLocale(
    this.code,
  );

  final String code;
  String getLanguageName(BuildContext context) {
    return switch (this) {
      AppLocale.arabic => tr(context).arabic,
      AppLocale.english => tr(context).english,
    };
  }
}
