import 'package:flutter/material.dart';

import 'package:book_catalog/services/api.dart';
import 'package:book_catalog/models/book.dart';

class FutureBook extends StatefulWidget {
  const FutureBook({Key? key}) : super(key: key);

  @override
  State<FutureBook> createState() => _FutureBookState();
}

class _FutureBookState extends State<FutureBook> {
  late Future<Book> futureBook;

  @override
  void initState() {
    super.initState();
    futureBook = fetchBook();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureBook,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.bookTitle);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
