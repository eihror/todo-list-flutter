import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/core/extension/context_extension.dart';
import 'package:todo_list/core/mixin/text_localization_mixin.dart';
import 'package:todo_list/feature/home/presentation/home/home_cubit.dart';
import 'package:todo_list/feature/home/presentation/home/home_state.dart';
import 'package:todo_list/feature/home/presentation/home/widgets/todo_dialog_modal_form.dart';

class HomeScreen extends StatelessWidget with TextLocalization {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<HomeCubit>()..onInitScreen(),
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, next) => previous.hashCode != next.hashCode,
        listener: _handleSideEffect,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            return Scaffold(
              appBar: AppBar(
                title: Text(textLocalization.homeScreenTitle),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              body: ListView.separated(
                itemBuilder: (context, position) {
                  final element = state.todoList[position];
                  return ListTile(
                    leading: Checkbox(
                      value: element.isDone,
                      onChanged: (status) {
                        cubit.clickedOnTodoItemCheckbox(position, status!);
                      },
                    ),
                    onTap: () => cubit.clickedOnTodoItem(position),
                    title: Text(element.title),
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    subtitle: Text(element.description),
                    subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
                  );
                },
                itemCount: state.todoList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: cubit.clickedOnCreateTodoFAB,
                elevation: 5,
                child: const Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleSideEffect(
    BuildContext context,
    HomeState state,
  ) {
    final cubit = context.read<HomeCubit>();
    if (state.showCreateTodoDialog) {
      cubit.handleShowNewTodoDialog();
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return TodoDialogModalForm(
            onTodoTitleTextChanged: cubit.onTodoTitleTextChanged,
            onTodoDescriptionTextChanged: cubit.onTodoDescriptionTextChanged,
            clickedOnCreateTodoItemButton: cubit.clickedOnCreateTodoItemBottomSheet,
          );
        },
      ).then((_) {
        // Update show dialog state on Cubit
        cubit.handleShowNewTodoDialog();
      });
    }
  }
}
