import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/core/converter/datetime_converter.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    @Default("") String id,
    @Default("") String title,
    @Default("") String description,
    @Default(false) bool isDone,
    @TimestampSerializer() required DateTime createdAt,
    @TimestampSerializer() required DateTime updatedAt,
  }) = _Todo;
}
