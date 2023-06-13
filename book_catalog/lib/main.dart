import 'package:flutter/material.dart';

import 'package:book_catalog/layouts/app.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
        useMaterial3: true,
      ),
      home: const AppLayout(appTitles: _screenTitle),
    );
  }
}
