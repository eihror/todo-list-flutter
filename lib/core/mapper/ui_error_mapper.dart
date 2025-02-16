import 'package:network/exception/network_exception.dart';
import 'package:todo_list/core/mixin/text_localization_mixin.dart';
import 'package:todo_list/core/model/ui_error.dart';

class UiErrorMapper with TextLocalization {
  UiError map(Exception exception) {
    if (exception is NetworkException) {
      return mapNetworkException(exception);
    } else {
      return AlertMessage(
        title: textLocalization.genericErrorTitle,
        text: textLocalization.genericErrorMessage,
        confirmOrDismissButtonText: textLocalization.genericErrorDismissButton,
      );
    }
  }

  UiError mapNetworkException(NetworkException exception) {
    if (exception is NetworkApiException) {
      return mapNetworkApiException(exception);
    } else if (exception is NetworkNoConnectionException) {
      return AlertMessage(
        title: textLocalization.noConnectionErrorTitle,
        text: textLocalization.noConnectionErrorMessage,
        confirmOrDismissButtonText:
            textLocalization.noConnectionErrorDismissButton,
      );
    } else if (exception is NetworkUnknownException) {
      return AlertMessage(
        title: textLocalization.genericErrorTitle,
        text: textLocalization.genericErrorMessage,
        confirmOrDismissButtonText: textLocalization.genericErrorDismissButton,
      );
    } else {
      return AlertMessage(
        title: textLocalization.genericErrorTitle,
        text: textLocalization.genericErrorMessage,
        confirmOrDismissButtonText: textLocalization.genericErrorDismissButton,
      );
    }
  }

  UiError mapNetworkApiException(NetworkApiException exception) {
    return AlertMessage(
      title: textLocalization.genericErrorTitle,
      text: textLocalization.genericErrorMessage,
      confirmOrDismissButtonText: textLocalization.genericErrorDismissButton,
    );
  }
}
