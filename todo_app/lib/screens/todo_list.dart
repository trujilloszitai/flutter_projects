// Packages & utils
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/appstate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/todo.dart';

// Widgets
import 'package:flutter_todo_app/widgets/todo_tile.dart';
import 'package:flutter_todo_app/widgets/empty_list_message.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final List<Todo> tasks =
        appState.tasks.where((e) => (!e.archived)).toList();

    if (tasks.isEmpty) {
      return EmptyListMessage(
        message:
            "¡Aún no tienes tareas! Agrega una apretando el botón '+' en la parte inferior derecha.",
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TodoTile(index: index);
      },
      // TodoTile(todo: task),
    );
  }
}
