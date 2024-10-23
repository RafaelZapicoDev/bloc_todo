import 'package:bloc_todo/domain/repository/todo_repo.dart';
import 'package:bloc_todo/presentation/todo_cubit.dart';
import 'package:bloc_todo/presentation/todo_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TodoCubit(todoRepo), child: const TodoView());
  }
}
