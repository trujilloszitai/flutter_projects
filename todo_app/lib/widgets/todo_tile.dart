import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/providers/appstate.dart';

class TodoTile extends StatelessWidget {
  int index;
  TodoTile({required this.index});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    Todo todo = appState.tasks[index];

    void checkboxHandler(bool? value, int index) {
      appState.toggleCompleted(index);
    }

    void handleDelete(BuildContext context) {
      appState.deleteTask(index);
    }

    void handleEdit(BuildContext context) {}

    return Padding(
      padding: const EdgeInsets.only(
          left: 24.0, right: 24.0, top: 10.0, bottom: 10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: handleEdit,
            icon: Icons.edit_outlined,
            backgroundColor: Colors.blueAccent,
            borderRadius: BorderRadius.circular(16.0),
          ),
          SlidableAction(
            onPressed: handleDelete,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ]),
        child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                borderRadius: BorderRadius.circular(16.0)),
            child: CheckboxListTile(
              title: Text(
                todo.name,
                style: TextStyle(
                    decoration: todo.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              subtitle: Text(
                todo.description,
                style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              value: todo.completed,
              onChanged: (value) => checkboxHandler(value, index),
              activeColor: Colors.black54,
            )),
      ),
    );
  }
}
