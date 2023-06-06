// ignore: file_names
import 'package:flutter/material.dart';

class Todo {
  Todo(
      {required this.name,
      this.description = 'f',
      required this.completed,
      this.archived = false,
      this.icon = Icons.feed_outlined});
  String name;
  String description;
  bool completed;
  bool archived;
  IconData icon;
}
