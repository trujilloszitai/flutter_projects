import 'package:flutter/material.dart';

import 'package:book_catalog/services/api.dart';
import 'package:book_catalog/models/book.dart';
import 'package:book_catalog/screens/book.dart';
import 'package:book_catalog/widgets/book_card.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    books = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: books,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Book> books = snapshot.data!;

              return GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(24.0),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                children: [
                  for (Book book in books) BookCard(book: book),
                ],
              );
              /* ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(books[index].bookTitle),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowBook(book: books[index])));
                    },
                  );
                },
              ); */
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          }),
    );
  }
}
