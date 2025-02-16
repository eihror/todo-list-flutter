import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin TextLocalization {
  static AppLocalizations? _textLocalization;

  AppLocalizations get textLocalization => TextLocalization._textLocalization!;

  static void init({required BuildContext context}) {
    _textLocalization = AppLocalizations.of(context);
  }
}