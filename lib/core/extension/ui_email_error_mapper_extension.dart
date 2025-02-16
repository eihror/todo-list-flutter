import 'package:flutter/material.dart';
import 'package:todo_list/core/extension/context_extension.dart';
import 'package:todo_list/core/model/ui_email_error.dart';

extension UiEmailErrorMapperExtension on UiEmailError? {
  String? mapToString(BuildContext context) {
    switch (this) {
      case UiEmailError.empty:
        return context.i18n.errorEmptyEmail;
      case UiEmailError.invalidFormat:
        return context.i18n.errorInvalidEmailFormat;
      case null:
        return null;
    }
  }
}
