// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

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

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get helloWorld => 'Olá Mundo!';

  @override
  String get signInScreenTitle => 'Login';

  @override
  String get signInScreenSignInButton => 'Entrar';

  @override
  String get signInScreenUserEmailInputHint => 'Informe seu e-mail';

  @override
  String get signInScreenUserEmailInputLabel => 'E-mail';

  @override
  String get signInScreenUserPasswordInputHint => '* * * * * *';

  @override
  String get signInScreenUserPasswordInputLabel => 'Senha';

  @override
  String get signInScreenSignUpTextPartOne => 'Não tem uma conta? ';

  @override
  String get signInScreenSignUpTextPartTwoButton => 'Cadastre-se';

  @override
  String get signInScreenSignUpTextPartThree => ' aqui.';

  @override
  String get homeScreenTitle => 'Bem-vindo(a)';

  @override
  String get homeScreenTodoDialogTitle => 'Criar um item';

  @override
  String get homeScreenTodoDialogTodoTitleInputHint => 'Informe um título';

  @override
  String get homeScreenTodoDialogTodoTitleInputLabel => 'Título';

  @override
  String get homeScreenTodoDialogTodoDescriptionInputHint => 'Informe uma descrição';

  @override
  String get homeScreenTodoDialogTodoDescriptionInputLabel => 'Descrição';

  @override
  String get homeScreenTodoDialogCreateTodoButton => 'Criar';

  @override
  String get errorEmptyEmail => 'E-mail não pode ficar em branco';

  @override
  String get errorInvalidEmailFormat => 'Informe um e-mail válido';

  @override
  String get errorEmptyPassword => 'Senha não pode ficar em branco';

  @override
  String get errorTooShortPassword => 'Senha não pode ser tão pequena';

  @override
  String get errorTooLongPassword => 'Senha não pode ser tão longa';

  @override
  String get errorNotMatchPassword => 'Senhas não estão iguais';

  @override
  String get genericErrorTitle => 'Aconteceu um erro';

  @override
  String get genericErrorMessage => 'Por favor, tente novamente mais tarde';

  @override
  String get genericErrorDismissButton => 'Fechar';

  @override
  String get noConnectionErrorTitle => 'Erro';

  @override
  String get noConnectionErrorMessage => 'Conexão com a internet necessária';

  @override
  String get noConnectionErrorDismissButton => 'Fechar';
}
