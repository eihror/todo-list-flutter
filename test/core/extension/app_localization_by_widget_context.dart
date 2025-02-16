import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/core/extension/context_extension.dart';

AppLocalizations appLocalizationsByWidgetContext({
  required WidgetTester tester,
  required Type type,
}) {
  final BuildContext context = tester.element(find.byType(type));
  return context.i18n;
}
