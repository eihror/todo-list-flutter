import 'package:flutter/material.dart';
import 'package:todo_list/core/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get i18n => AppLocalizations.of(this);
}
