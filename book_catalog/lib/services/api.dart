import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:book_catalog/models/book.dart';
import 'package:book_catalog/utils/constants.dart';

Future<Book> fetchBook() async {
  final response = await http.get(
      Uri.parse(
          "https://api.baserow.io/api/database/rows/table/170700/1/?user_field_names=true"),
      headers: {
        HttpHeaders.authorizationHeader: 'Token ${AppConstants.apiToken}'
      });

  if (response.statusCode == 200) {
    return Book.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al cargar el libro.');
  }
}

Future<List<Book>> fetchBooks() async {
  try {
    final response = await http.get(
        Uri.parse(
            "https://api.baserow.io/api/database/rows/table/170700/?user_field_names=true"),
        headers: {
          HttpHeaders.authorizationHeader: 'Token ${AppConstants.apiToken}'
        });

    Map<String, dynamic> jsonRes = jsonDecode(response.body);

    List<dynamic> booksMap = jsonRes['results'];

    // Iterable<dynamic> booksMap = json.decode(response.body);

    List<Book> books = List<Book>.from(booksMap.map(
      (e) => Book.fromJson(e),
    ));

    return books;
  } on Exception {
    rethrow;
  }
}
