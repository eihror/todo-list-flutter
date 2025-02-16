import 'package:network/exception/network_exception.dart';
import 'package:todo_list/core/mapper/ui_error_mapper.dart';
import 'package:todo_list/core/mixin/text_localization_mixin.dart';
import 'package:todo_list/core/model/api_error.dart';
import 'package:todo_list/core/model/field_type.dart';
import 'package:todo_list/core/model/ui_error.dart';
import 'package:todo_list/core/util/error_codes.dart';
import 'package:todo_list/feature/authentication/presentation/model/sign_in_field_type.dart';

class SignInUiNetworkErrorMapper extends UiErrorMapper with TextLocalization {
  @override
  UiError mapNetworkApiException(NetworkApiException exception) {
    final Map<int, String> errorMessages = {
      ErrorCodes.invalidAccessData: textLocalization.errorInvalidEmailFormat
    };

    final ApiErrors apiErrors = ApiErrors.fromMap(exception.error);

    final Map<FieldType, String> mappedErrorMessage = {};

    for (ApiError apiError in apiErrors.errors) {
      final errorCode = apiError.code;
      final fieldType = getFieldType(errorCode);
      final errorMessage = errorMessages[errorCode];

      if (fieldType != null && errorMessage != null) {
        mappedErrorMessage.putIfAbsent(fieldType, () => errorMessage);
      }
    }

    if (mappedErrorMessage.isEmpty) {
      return AlertMessage(
        title: textLocalization.genericErrorTitle,
        text: textLocalization.genericErrorMessage,
        confirmOrDismissButtonText: textLocalization.genericErrorDismissButton,
      );
    } else if (mappedErrorMessage.containsKey(SignInFieldType.signIn)) {
      return AlertMessage(
        title: textLocalization.genericErrorTitle,
        text: mappedErrorMessage[SignInFieldType.signIn]!,
        confirmOrDismissButtonText: textLocalization.genericErrorDismissButton,
      );
    }else {
      return FieldMessage(errorMessages: mappedErrorMessage);
    }
  }

  SignInFieldType? getFieldType(int errorCode) {
    switch (errorCode) {
      case ErrorCodes.invalidAccessData:
        return SignInFieldType.signIn;
      default:
        return null;
    }
  }
}
