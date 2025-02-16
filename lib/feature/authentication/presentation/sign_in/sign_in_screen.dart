import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/core/extension/context_extension.dart';
import 'package:todo_list/core/extension/ui_email_error_mapper_extension.dart';
import 'package:todo_list/core/extension/ui_password_error_mapper_extension.dart';
import 'package:todo_list/core/model/ui_error.dart';
import 'package:todo_list/feature/authentication/presentation/navigation/sign_up_route.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_cubit.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/sign_in_state.dart';
import 'package:todo_list/feature/authentication/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:todo_list/feature/home/presentation/navigation/home_route.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SignInCubit>(),
      child: BlocListener<SignInCubit, SignInState>(
        listenWhen: (previous, next) => previous.hashCode != next.hashCode,
        listener: _handleSideEffect,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.i18n.signInScreenTitle),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              final cubit = context.read<SignInCubit>();
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SignInForm(
                      onUserEmailValueChanged: cubit.onUserEmailTextChanged,
                      onUserPasswordValueChanged:
                          cubit.onUserPasswordTextChanged,
                      userEmailErrorMessage:
                          state.uiEmailError?.mapToString(context),
                      userPasswordErrorMessage:
                          state.uiPasswordError?.mapToString(context),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: (!state.showLoading)
                          ? cubit.clickedOnSignInButton
                          : null,
                      child: Text(context.i18n.signInScreenSignInButton),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        text: context.i18n.signInScreenSignUpTextPartOne,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                            text: context
                                .i18n.signInScreenSignUpTextPartTwoButton,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = cubit.clickedOnSignUpButton,
                          ),
                          TextSpan(
                            text: context.i18n.signInScreenSignUpTextPartThree,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleSideEffect(
    BuildContext context,
    SignInState state,
  ) {
    if (state.showSignInRequestError && state.signInRequestError != null) {
      context.read<SignInCubit>().handleShowSignInErrorDialog();

      final error = state.signInRequestError! as AlertMessage;

      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            backgroundColor: Colors.white60,
            title: Text(error.title),
            content: Text(error.text),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(error.confirmOrDismissButtonText),
              ),
            ],
          );
        },
      );
    }
    if (state.navigateToHomeScreen) {
      context.read<SignInCubit>().handleNavigateToHomeScreen();
      context.pushReplacement(HomeRoute().path);
    }

    if (state.navigateToSignUpScreen) {
      context.read<SignInCubit>().handleNavigateToSignUpScreen();
      context.push(
        SignUpRoute.withEmail(email: state.userEmail).path,
      );
    }
  }
}
