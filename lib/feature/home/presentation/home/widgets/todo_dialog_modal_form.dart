import 'package:flutter/material.dart';
import 'package:todo_list/core/mixin/text_localization_mixin.dart';

class TodoDialogModalForm extends StatelessWidget with TextLocalization {
  const TodoDialogModalForm({
    super.key,
    required this.onTodoTitleTextChanged,
    required this.onTodoDescriptionTextChanged,
    required this.clickedOnCreateTodoItemButton,
  });

  final void Function(String) onTodoTitleTextChanged;
  final void Function(String) onTodoDescriptionTextChanged;
  final void Function() clickedOnCreateTodoItemButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textLocalization.homeScreenTodoDialogTitle,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: onTodoTitleTextChanged,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: textLocalization.homeScreenTodoDialogTodoTitleInputHint,
              labelText:
                  textLocalization.homeScreenTodoDialogTodoTitleInputLabel,
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: onTodoDescriptionTextChanged,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText:
                  textLocalization.homeScreenTodoDialogTodoDescriptionInputHint,
              labelText: textLocalization
                  .homeScreenTodoDialogTodoDescriptionInputLabel,
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: clickedOnCreateTodoItemButton,
            child: Text(
              textLocalization.homeScreenTodoDialogCreateTodoButton,
            ),
          ),
        ],
      ),
    );
  }
}
