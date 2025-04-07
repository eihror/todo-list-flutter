import 'package:todo_list/core/model/ui_password_error.dart';

class PasswordValidator {
  static const validPasswordShortSizeLength = 8;
  static const validPasswordLongSizeLength = 16;
  static const validateIfHasAtLeastOneDigitRegex = r'\d';
  static const validateIfHasAtLeastOneUppercaseLetterRegex = r'[A-Z]';
  static const validateIfHasAtLeastOneLowercaseLetterRegex = r'[a-z]';
  static const validateIfHasAtLeastOneSpecialCharacterRegex = r'[^A-Za-z0-9\s]';

  static UiPasswordError? validate({required String password}) {
    if (password.isEmpty) {
      return UiPasswordError.empty;
    }

    if (password.length < validPasswordShortSizeLength) {
      return UiPasswordError.tooShort;
    }

    if (password.length > validPasswordLongSizeLength) {
      return UiPasswordError.tooLong;
    }

    return null;
  }

  UiPasswordError? validateConfirmPassword({
    required String password,
    required String confirmPassword,
  }) {
    if (confirmPassword != password) {
      return UiPasswordError.doesNotMatch;
    }

    return null;
  }
}
