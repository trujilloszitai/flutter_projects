import 'package:flutter/material.dart';

import 'package:book_catalog/screens/books_list.dart';
import 'package:book_catalog/screens/authors_list.dart';
import 'package:book_catalog/screens/publishers_list.dart';

import 'package:book_catalog/widgets/navbar.dart';

void main() {
  runApp(const BookCatalogApp());
}

class BookCatalogApp extends StatefulWidget {
  const BookCatalogApp({Key? key}) : super(key: key);

  @override
  State<BookCatalogApp> createState() => _AppState();
}

class _AppState extends State<BookCatalogApp> {
  static const _screenTitle = <String>[
    "Catálogo de libros",
    "Autores",
    "Editoriales",
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[400],
            titleTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            title: Text(_screenTitle[_selectedIndex]),
          ),
          bottomNavigationBar:
              Navbar(currentIndex: _selectedIndex, onTap: _onItemTapped),
          body: Container(
            color: Colors.grey[50],
            child: IndexedStack(
              index: _selectedIndex,
              children: const <Widget>[
                BooksList(),
                AuthorsList(),
                PublishersList(),
              ],
            ),
          )
          /* floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), */
          ),
    );
  }
}
