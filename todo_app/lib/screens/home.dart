// Packages & utils
import 'package:flutter/material.dart';
// import 'package:flutter_todo_app/providers/appstate.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_todo_app/utils/functions.dart';

// Screens & pages
import 'package:flutter_todo_app/screens/todo_list.dart';
import 'package:flutter_todo_app/screens/archived.dart';
// import 'package:flutter_todo_app/screens/todo.dart';

import 'package:flutter_todo_app/widgets/add_todo_modal.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    TodoList(),
    ArchivedList(),
  ];

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text("Todo App"),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        body: Row(children: [Expanded(child: widgetOptions[selectedIndex])]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            displayDialog(context, AddTodoModal());
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: 'Mis tareas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox_outlined),
              label: 'Archivadas',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          onTap: onItemTapped,
        ),
      );
    });
  }
}
