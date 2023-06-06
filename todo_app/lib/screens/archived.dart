// Packages & utils
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/providers/appstate.dart';
import 'package:flutter_todo_app/models/todo.dart';

// Widgets
import 'package:flutter_todo_app/widgets/todo_tile.dart';
import 'package:flutter_todo_app/widgets/empty_list_message.dart';

class ArchivedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final tasks = appState.tasks.where((e) => (e.archived));

    if (tasks.isEmpty) {
      return EmptyListMessage(
        message: "No has archivado ninguna tarea.",
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
