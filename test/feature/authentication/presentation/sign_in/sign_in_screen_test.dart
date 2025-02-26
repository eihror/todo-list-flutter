import 'package:common/model/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/di/di.dart';
import 'package:todo_list/feature/authentication/data/data_source/local/local_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/data/data_source/model/sign_in_response.dart';
import 'package:todo_list/feature/authentication/data/data_source/remote/remote_authentication_data_source.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_screen.dart';

import '../../../../core/extension/app_localization_by_widget_context.dart';
import '../../../../core/widget_test_method.dart';
import '../../../../mock/mock_local_authentication_data_source_impl.dart';
import '../../../../mock/mock_remote_authentication_data_source_impl.dart';

void main() {
  late AppLocalizations i18n;
  final mockRemote = MockRemoteAuthenticationDataSourceImpl();
  final mockLocal = MockLocalAuthenticationDataSourceImpl();

  setUp(() {
    DI.registerDependencies();
    GetIt.I.allowReassignment = true;

    GetIt.I.registerFactory<LocalAuthenticationDataSource>(
      () => mockLocal,
    );

    GetIt.I.registerFactory<RemoteAuthenticationDataSource>(
      () => mockRemote,
    );
  });

  tearDown(() {
    GetIt.I.reset(dispose: true);
  });

  testWidgets(
    'When user tries to Sign In with an valid account, should work properly',
    (WidgetTester tester) async {
      // given
      await tester.pumpWidget(
        createWidgetUnderTest(
          screenToTest: const SignInScreen(),
        ),
      );

      i18n =
          appLocalizationsByWidgetContext(tester: tester, type: SignInScreen);

      when(
        () => mockLocal.saveUserAccessTokenOnSharedPreferences(
          value: any(named: "value"),
        ),
      ).thenAnswer((_) async {
        return Successful(data: null);
      });

      when(
        () => mockRemote.signIn(
          email: any(named: "email"),
          password: any(named: "password"),
        ),
      ).thenAnswer((_) async {
        return Successful(data: const SignInResponse(accessToken: '123token'));
      });

      // when
      final signInButton =
          find.widgetWithText(FilledButton, i18n.signInScreenSignInButton);
      expect(signInButton, findsOneWidget);

      final emailField =
          find.widgetWithText(TextField, i18n.signInScreenUserEmailInputLabel);
      expect(emailField, findsOneWidget);

      final passwordField = find.widgetWithText(
          TextField, i18n.signInScreenUserPasswordInputLabel);
      expect(passwordField, findsOneWidget);

      await tester.enterText(emailField, "email@company.com");
      await tester.enterText(passwordField, "password");

      await tester.tap(signInButton);

      // then
      expect(find.text(i18n.errorEmptyEmail), findsNothing);
      expect(find.text(i18n.errorInvalidEmailFormat), findsNothing);
      expect(find.text(i18n.errorTooShortPassword), findsNothing);
      expect(find.text(i18n.errorTooLongPassword), findsNothing);
    },
  );

  testWidgets(
    "When user tries to Sign In with an invalid email, should show error message",
    (WidgetTester tester) async {
      // given
      await tester.pumpWidget(
        createWidgetUnderTest(
          screenToTest: const SignInScreen(),
        ),
      );

      i18n =
          appLocalizationsByWidgetContext(tester: tester, type: SignInScreen);

      // when
      final signInButton =
          find.widgetWithText(FilledButton, i18n.signInScreenSignInButton);
      expect(signInButton, findsOneWidget);

      final emailField =
          find.widgetWithText(TextField, i18n.signInScreenUserEmailInputLabel);
      expect(emailField, findsOneWidget);
      final passwordField = find.widgetWithText(
          TextField, i18n.signInScreenUserPasswordInputLabel);
      expect(passwordField, findsOneWidget);

      await tester.enterText(emailField, "email");
      await tester.enterText(passwordField, "password");

      await tester.tap(signInButton);

      /**
       * pump() vs. pumpAndSettle():
       *   pump(): Triggers a rebuild of the widget tree.
       *   pumpAndSettle(): Continuously pumps frames until there are no more frames scheduled, useful for handling animations or asynchronous operations.
       */
      await tester.pumpAndSettle();

      // then
      expect(find.text(i18n.errorInvalidEmailFormat), findsOneWidget);
      expect(find.text(i18n.errorTooShortPassword), findsNothing);
      expect(find.text(i18n.errorTooLongPassword), findsNothing);
    },
  );

  testWidgets(
    "When user tries to Sign In with an shorten password, should show error message",
    (WidgetTester tester) async {
      // given
      await tester.pumpWidget(
        createWidgetUnderTest(
          screenToTest: const SignInScreen(),
        ),
      );

      i18n =
          appLocalizationsByWidgetContext(tester: tester, type: SignInScreen);

      // when
      final signInButton =
          find.widgetWithText(FilledButton, i18n.signInScreenSignInButton);
      expect(signInButton, findsOneWidget);

      final emailField =
          find.widgetWithText(TextField, i18n.signInScreenUserEmailInputLabel);
      expect(emailField, findsOneWidget);
      final passwordField = find.widgetWithText(
          TextField, i18n.signInScreenUserPasswordInputLabel);
      expect(passwordField, findsOneWidget);

      await tester.enterText(emailField, "email@company.com.br");
      await tester.enterText(passwordField, "pa");

      await tester.tap(signInButton);

      await tester.pumpAndSettle();

      // then
      expect(find.text(i18n.errorEmptyEmail), findsNothing);
      expect(find.text(i18n.errorInvalidEmailFormat), findsNothing);
      expect(find.text(i18n.errorTooShortPassword), findsOneWidget);
    },
  );

  testWidgets(
    "When user tries to Sign In with an larger password, should show error message",
    (WidgetTester tester) async {
      // given
      await tester.pumpWidget(
        createWidgetUnderTest(
          screenToTest: const SignInScreen(),
        ),
      );

      i18n =
          appLocalizationsByWidgetContext(tester: tester, type: SignInScreen);

      // when
      final signInButton =
          find.widgetWithText(FilledButton, i18n.signInScreenSignInButton);
      expect(signInButton, findsOneWidget);

      final emailField =
          find.widgetWithText(TextField, i18n.signInScreenUserEmailInputLabel);
      expect(emailField, findsOneWidget);
      final passwordField = find.widgetWithText(
          TextField, i18n.signInScreenUserPasswordInputLabel);
      expect(passwordField, findsOneWidget);

      await tester.enterText(emailField, "email@company.com.br");
      await tester.enterText(passwordField,
          "passwordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpassword");

      await tester.tap(signInButton);

      await tester.pumpAndSettle();

      // then
      expect(find.text(i18n.errorEmptyEmail), findsNothing);
      expect(find.text(i18n.errorInvalidEmailFormat), findsNothing);
      expect(find.text(i18n.errorTooLongPassword), findsOneWidget);
    },
  );

  testWidgets(
    "When user tries to Sign In without any data, should show error message",
    (WidgetTester tester) async {
      // given
      await tester.pumpWidget(
        createWidgetUnderTest(
          screenToTest: const SignInScreen(),
        ),
      );

      i18n =
          appLocalizationsByWidgetContext(tester: tester, type: SignInScreen);

      // when
      final signInButton =
          find.widgetWithText(FilledButton, i18n.signInScreenSignInButton);
      expect(signInButton, findsOneWidget);

      await tester.tap(signInButton);

      await tester.pumpAndSettle();

      // then
      expect(find.text(i18n.errorEmptyEmail), findsOneWidget);
      expect(find.text(i18n.errorEmptyPassword), findsOneWidget);
    },
  );
}
