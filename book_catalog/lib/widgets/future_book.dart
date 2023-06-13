import 'package:flutter/material.dart';

import 'package:book_catalog/services/api.dart';
import 'package:book_catalog/models/book.dart';

class FutureBook extends StatefulWidget {
  final int rowId;
  const FutureBook({Key? key, required this.rowId}) : super(key: key);

  @override
  State<FutureBook> createState() => _FutureBookState();
}

class _FutureBookState extends State<FutureBook> {
  late Future<Book> futureBook;

  @override
  void initState() {
    super.initState();
    futureBook = findBook(widget.rowId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureBook,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Book book = snapshot.data!;
          return Column(
            children: [
              Text("Título: ${book.bookTitle}"),
              Text("Sinopsis: ${book.synopsis}"),
              const Text("Autores:"),
              for (AuthorS author in book.authorS) Text(author.value),
              const Text("Editoriales:"),
              for (AuthorS publisher in book.publisher) Text(publisher.value),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
