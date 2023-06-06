import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';

class AppState extends ChangeNotifier {
  List<Todo> tasks = <Todo>[
    Todo(name: 'Comer', description: 'lorem', completed: true),
    Todo(name: 'Dormir', description: 'lorem', completed: true),
    Todo(name: 'Beber', description: 'lorem', completed: false),
    Todo(name: 'Viajar', description: 'lorem', completed: false),
    /* Todo(
        name: 'Comer archivado',
        description: 'lorem',
        archived: true,
        completed: true),
    Todo(
        name: 'Dormir archivado',
        description: 'lorem',
        archived: true,
        completed: true),
    Todo(
        name: 'Beber archivado',
        description: 'lorem',
        archived: true,
        completed: false),
    Todo(
        name: 'Viajar archivado',
        description: 'lorem',
        archived: true,
        completed: false), */
  ];

  final TextEditingController textFieldController = TextEditingController();

  void toggleCompleted(int index) {
    tasks[index].completed = !tasks[index].completed;
    notifyListeners();
  }

  void toggleArchived(int index) {
    tasks[index].archived = !tasks[index].archived;
    notifyListeners();
  }

  void addTask(Todo todo) {
    tasks.add(todo);
    textFieldController.clear();
    notifyListeners();
  }

  void deleteTask(int index) {
    if (tasks.contains(tasks[index])) {
      tasks.remove(tasks[index]);
      notifyListeners();
    }
  }
}
