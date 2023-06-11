import 'package:flutter/material.dart';

import 'package:book_catalog/screens/home.dart';
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
  static const List<Widget> screens = <Widget>[
    HomePage(title: 'Catálogo de libros'),
    BooksList(),
    AuthorsList(),
    PublishersList(),
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
            title: const Text("Catálogo de libros"),
          ),
          bottomNavigationBar:
              Navbar(currentIndex: _selectedIndex, onTap: _onItemTapped),
          body: Container(
            color: Colors.grey[50],
            child: IndexedStack(
              index: _selectedIndex,
              children: const <Widget>[
                HomePage(title: 'Catálogo de libros'),
                BooksList(),
                AuthorsList(),
                PublishersList(),
              ],
            ),
          )
          /* const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ), */
          /* floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), */
          ),
    );
  }
}
