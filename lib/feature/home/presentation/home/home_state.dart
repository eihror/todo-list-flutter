import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/feature/home/domain/model/todo.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Todo> todoList,
    @Default(null) Todo? todoSelected,
    @Default("") String todoTitle,
    @Default("") String todoDescription,
    @Default(false) bool showLoading,
    @Default(false) bool showCreateTodoDialog,
  }) = _HomeState;
}
