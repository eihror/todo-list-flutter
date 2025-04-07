import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
    Locale('pt', 'BR')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @signInScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInScreenTitle;

  /// No description provided for @signInScreenSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInScreenSignInButton;

  /// No description provided for @signInScreenUserEmailInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type your email'**
  String get signInScreenUserEmailInputHint;

  /// No description provided for @signInScreenUserEmailInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signInScreenUserEmailInputLabel;

  /// No description provided for @signInScreenUserPasswordInputHint.
  ///
  /// In en, this message translates to:
  /// **'* * * * * *'**
  String get signInScreenUserPasswordInputHint;

  /// No description provided for @signInScreenUserPasswordInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInScreenUserPasswordInputLabel;

  /// No description provided for @signInScreenSignUpTextPartOne.
  ///
  /// In en, this message translates to:
  /// **'Do not have an account? '**
  String get signInScreenSignUpTextPartOne;

  /// No description provided for @signInScreenSignUpTextPartTwoButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signInScreenSignUpTextPartTwoButton;

  /// No description provided for @signInScreenSignUpTextPartThree.
  ///
  /// In en, this message translates to:
  /// **' here.'**
  String get signInScreenSignUpTextPartThree;

  /// No description provided for @homeScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get homeScreenTitle;

  /// No description provided for @homeScreenTodoDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Create an item'**
  String get homeScreenTodoDialogTitle;

  /// No description provided for @homeScreenTodoDialogTodoTitleInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type todo title'**
  String get homeScreenTodoDialogTodoTitleInputHint;

  /// No description provided for @homeScreenTodoDialogTodoTitleInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get homeScreenTodoDialogTodoTitleInputLabel;

  /// No description provided for @homeScreenTodoDialogTodoDescriptionInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type todo description'**
  String get homeScreenTodoDialogTodoDescriptionInputHint;

  /// No description provided for @homeScreenTodoDialogTodoDescriptionInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get homeScreenTodoDialogTodoDescriptionInputLabel;

  /// No description provided for @homeScreenTodoDialogCreateTodoButton.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get homeScreenTodoDialogCreateTodoButton;

  /// No description provided for @errorEmptyEmail.
  ///
  /// In en, this message translates to:
  /// **'E-mail can not be empty'**
  String get errorEmptyEmail;

  /// No description provided for @errorInvalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Inform a valid e-mail'**
  String get errorInvalidEmailFormat;

  /// No description provided for @errorEmptyPassword.
  ///
  /// In en, this message translates to:
  /// **'Password can not be empty'**
  String get errorEmptyPassword;

  /// No description provided for @errorTooShortPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too short'**
  String get errorTooShortPassword;

  /// No description provided for @errorTooLongPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too long'**
  String get errorTooLongPassword;

  /// No description provided for @errorNotMatchPassword.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get errorNotMatchPassword;

  /// No description provided for @genericErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get genericErrorTitle;

  /// No description provided for @genericErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please try again later'**
  String get genericErrorMessage;

  /// No description provided for @genericErrorDismissButton.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get genericErrorDismissButton;

  /// No description provided for @noConnectionErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get noConnectionErrorTitle;

  /// No description provided for @noConnectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Internet connection is required'**
  String get noConnectionErrorMessage;

  /// No description provided for @noConnectionErrorDismissButton.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get noConnectionErrorDismissButton;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return AppLocalizationsPtBr();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
