import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:flutter_todo_app/providers/appstate.dart';
import 'package:provider/provider.dart';

class AddTodoModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var titleFieldController = TextEditingController();
    var descriptionFieldController = TextEditingController();

    return AlertDialog(
      title: const Text('Nueva tarea'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.all(16),
      actionsPadding: EdgeInsets.all(24.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleFieldController,
            decoration: const InputDecoration(hintText: 'Título'),
          ),
          TextField(
            controller: descriptionFieldController,
            decoration: const InputDecoration(hintText: 'Descripción'),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            onPressed: () {
              Navigator.of(context).pop();
              appState.addTask(Todo(
                  name: titleFieldController.text,
                  description: descriptionFieldController.text,
                  completed: false));
            },
            child: const Text('Agregar'))
      ],
    );
  }
}
