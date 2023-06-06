import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/providers/appstate.dart';
import 'package:flutter_todo_app/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To Do App',
          theme: ThemeData(
              primarySwatch: Colors.yellow,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              )),
          home: HomePage()),
    );
  }
}
