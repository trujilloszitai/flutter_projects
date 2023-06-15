import 'package:flutter/material.dart';

import 'package:book_catalog/models/book.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(3, 3),
            spreadRadius: -7,
            blurRadius: 12,
            color: Color.fromRGBO(98, 98, 98, 1),
          ),
        ],
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.network(
          book.coverPhoto[0].url,
          width: 75.0,
          height: 100.0,
          semanticLabel: "Portada de ${book.bookTitle}",
        ),
        Column(
          children: [
            Text(
              book.bookTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'By ${book.authorS[0].value}',
              style: const TextStyle(color: Colors.black54),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ]),
    );
  }
}
