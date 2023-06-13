import 'package:flutter/material.dart';

import 'package:book_catalog/layouts/app.dart';
import 'package:book_catalog/models/book.dart';
import 'package:book_catalog/widgets/future_book.dart';

class ShowBook extends StatelessWidget {
  const ShowBook({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appTitle: book.bookTitle,
      body: FutureBook(rowId: book.id),
    );
  }
}
