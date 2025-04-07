// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get signInScreenTitle => 'Sign In';

  @override
  String get signInScreenSignInButton => 'Sign In';

  @override
  String get signInScreenUserEmailInputHint => 'Type your email';

  @override
  String get signInScreenUserEmailInputLabel => 'Email';

  @override
  String get signInScreenUserPasswordInputHint => '* * * * * *';

  @override
  String get signInScreenUserPasswordInputLabel => 'Password';

  @override
  String get signInScreenSignUpTextPartOne => 'Do not have an account? ';

  @override
  String get signInScreenSignUpTextPartTwoButton => 'Sign Up';

  @override
  String get signInScreenSignUpTextPartThree => ' here.';

  @override
  String get homeScreenTitle => 'Welcome';

  @override
  String get homeScreenTodoDialogTitle => 'Create an item';

  @override
  String get homeScreenTodoDialogTodoTitleInputHint => 'Type todo title';

  @override
  String get homeScreenTodoDialogTodoTitleInputLabel => 'Title';

  @override
  String get homeScreenTodoDialogTodoDescriptionInputHint => 'Type todo description';

  @override
  String get homeScreenTodoDialogTodoDescriptionInputLabel => 'Description';

  @override
  String get homeScreenTodoDialogCreateTodoButton => 'Create';

  @override
  String get errorEmptyEmail => 'E-mail can not be empty';

  @override
  String get errorInvalidEmailFormat => 'Inform a valid e-mail';

  @override
  String get errorEmptyPassword => 'Password can not be empty';

  @override
  String get errorTooShortPassword => 'Password is too short';

  @override
  String get errorTooLongPassword => 'Password is too long';

  @override
  String get errorNotMatchPassword => 'Passwords do not match';

  @override
  String get genericErrorTitle => 'An error occurred';

  @override
  String get genericErrorMessage => 'Please try again later';

  @override
  String get genericErrorDismissButton => 'Dismiss';

  @override
  String get noConnectionErrorTitle => 'Error';

  @override
  String get noConnectionErrorMessage => 'Internet connection is required';

  @override
  String get noConnectionErrorDismissButton => 'Dismiss';
}
