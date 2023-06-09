import 'package:book_catalog/screens/authors_list.dart';
import 'package:flutter/material.dart';

import 'package:book_catalog/screens/books_list.dart';
import 'package:book_catalog/screens/home.dart';
import 'package:book_catalog/screens/publisher.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static const List<Widget> screens = <Widget>[
    HomePage(title: 'Catálogo de libros'),
    BooksList(),
    AuthorsList()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Autores'),
      ],
    );
  }
}
