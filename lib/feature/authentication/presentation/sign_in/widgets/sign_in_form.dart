import 'package:flutter/material.dart';
import 'package:todo_list/core/extension/context_extension.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.onUserEmailValueChanged,
    required this.onUserPasswordValueChanged,
    this.userEmailErrorMessage,
    this.userPasswordErrorMessage,
  });

  final Function(String text) onUserEmailValueChanged;
  final Function(String text) onUserPasswordValueChanged;
  final String? userEmailErrorMessage;
  final String? userPasswordErrorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          onChanged: onUserEmailValueChanged,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: context.i18n.signInScreenUserEmailInputHint,
            labelText: context.i18n.signInScreenUserEmailInputLabel,
            errorText: userEmailErrorMessage,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: onUserPasswordValueChanged,
          obscureText: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: context.i18n.signInScreenUserPasswordInputHint,
            labelText: context.i18n.signInScreenUserPasswordInputLabel,
            errorText: userPasswordErrorMessage,
          ),
          keyboardType: TextInputType.text,
        )
      ],
    );
  }
}
