import 'package:todo_list/core/model/field_type.dart';

abstract class UiError {}

final class AlertMessage extends UiError {
  AlertMessage({
    required this.title,
    required this.text,
    required this.confirmOrDismissButtonText,
  });

  final String title;
  final String text;
  final String confirmOrDismissButtonText;
}

final class FieldMessage extends UiError {
  FieldMessage({
    required this.errorMessages,
  });

  final Map<FieldType, String> errorMessages;

  @override
  String toString() {
    return 'FieldMessageUiError{errorMessages: $errorMessages}';
  }
}
