import 'package:flutter/material.dart';
import 'package:todo_list/core/extension/context_extension.dart';
import 'package:todo_list/core/model/ui_password_error.dart';

extension UiPasswordErrorMapperExtension on UiPasswordError? {
  String? mapToString(BuildContext context) {
    switch (this) {
      case UiPasswordError.empty:
        return context.i18n.errorEmptyPassword;
      case UiPasswordError.tooShort:
        return context.i18n.errorTooShortPassword;
      case UiPasswordError.tooLong:
        return context.i18n.errorTooLongPassword;
      case UiPasswordError.doesNotMatch:
        return context.i18n.errorNotMatchPassword;
      case null:
        return null;
    }
  }
}
