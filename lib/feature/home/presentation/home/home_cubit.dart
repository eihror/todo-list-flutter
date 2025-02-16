import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/feature/home/domain/model/todo.dart';
import 'package:todo_list/feature/home/presentation/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void onInitScreen() {}

  void clickedOnCreateTodoFAB() {
    emit(
      state.copyWith(
        showCreateTodoDialog: true,
      ),
    );
  }

  void clickedOnTodoItem(int position) {
    final todoSelected = state.todoList.elementAt(position);

    emit(
      state.copyWith(
        todoSelected: todoSelected,
        showCreateTodoDialog: true,
      ),
    );
  }

  void clickedOnTodoItemCheckbox(int position, bool status) {}

  void clickedOnCreateTodoItemBottomSheet() {
    final todo = Todo(
      title: state.todoTitle,
      description: state.todoDescription,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final actualList = List<Todo>.from(state.todoList);
    actualList.add(todo);

    emit(
      state.copyWith(
        todoList: actualList,
      ),
    );
  }

  void onTodoTitleTextChanged(String value) {
    emit(
      state.copyWith(
        todoTitle: value,
      ),
    );
  }

  void onTodoDescriptionTextChanged(String value) {
    emit(
      state.copyWith(
        todoDescription: value,
      ),
    );
  }

  void handleShowNewTodoDialog() {
    emit(
      state.copyWith(
        showCreateTodoDialog: false,
      ),
    );
  }
}
