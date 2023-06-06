import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:book_catalog/models/book.dart';

Future<Book> fetchBook() async {
  final response = await http.get(
      Uri.parse(
          "https://api.baserow.io/api/database/rows/table/170700/1/?user_field_names=true"),
      headers: {
        HttpHeaders.authorizationHeader:
            'Token x6KfKm3kpRDBG8vCvZWLDzKvYsa4TZNh'
      });

  if (response.statusCode == 200) {
    return Book.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al cargar el libro.');
  }
}
