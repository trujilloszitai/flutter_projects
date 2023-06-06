import 'package:flutter/material.dart';

import 'package:book_catalog/screens/home.dart';

void main() {
  runApp(const BookCatalogApp());
}

class BookCatalogApp extends StatefulWidget {
  const BookCatalogApp({Key? key}) : super(key: key);

  @override
  State<BookCatalogApp> createState() => _AppState();
}

class _AppState extends State<BookCatalogApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Book catalog app'),
    );
  }
}
