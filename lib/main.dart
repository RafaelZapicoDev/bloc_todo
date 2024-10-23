import 'package:bloc_todo/data/models/isar_todo.dart';
import 'package:bloc_todo/data/repository/isar_todo_repo.dart';
import 'package:bloc_todo/domain/repository/todo_repo.dart';
import 'package:bloc_todo/presentation/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);
  final isarTodoRepo = IsarTodoRepo(isar);
  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  final TodoRepo todoRepo;
  const MyApp({super.key, required this.todoRepo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}