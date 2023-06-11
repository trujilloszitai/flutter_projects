import 'package:flutter/material.dart';

class AuthorsList extends StatefulWidget {
  const AuthorsList({Key? key}) : super(key: key);

  @override
  _AuthorsListState createState() => _AuthorsListState();
}

class _AuthorsListState extends State<AuthorsList> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Lista de autores"));
  }
}
