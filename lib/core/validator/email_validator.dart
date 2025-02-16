import 'package:todo_list/core/model/ui_email_error.dart';

class EmailValidator {
  UiEmailError? validate({
    required String email,
  }) {
    if (email.isEmpty) {
      return UiEmailError.empty;
    }

    const validEmailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final hasInvalidFormat = !RegExp(validEmailRegex).hasMatch(email);

    if (hasInvalidFormat) {
      return UiEmailError.invalidFormat;
    }

    return null;
  }
}
