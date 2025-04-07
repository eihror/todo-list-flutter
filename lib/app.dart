import 'package:flutter/material.dart';
import 'package:todo_list/core/l10n/app_localizations.dart';
import 'package:todo_list/core/mixin/text_localization_mixin.dart';
import 'package:todo_list/core/navigation/navigation_router.dart';

class App extends StatelessWidget with TextLocalization {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale isn't supported, use the first one from the list (default)
        return supportedLocales.first;
      },
      builder: (context, child) {
        TextLocalization.init(context: context);

        return child ?? const SizedBox.shrink();
      },
      routerConfig: navigationRouter,
    );
  }
}
