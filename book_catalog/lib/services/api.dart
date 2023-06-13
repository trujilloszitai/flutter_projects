import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:book_catalog/utils/constants.dart';
import 'package:book_catalog/models/book.dart';
import 'package:book_catalog/models/author.dart';

Future<Book> findBook(int row) async {
  try {
    final response = await http.get(
        Uri.parse(
            "https://api.baserow.io/api/database/rows/table/170700/$row/?user_field_names=true"),
        headers: {HttpHeaders.authorizationHeader: AppConstants.apiToken});

    return Book.fromJson(jsonDecode(response.body));
  } catch (err) {
    return Future.error(err);
  }
}

Future<List<Book>> fetchBooks() async {
  try {
    final response = await http.get(
        Uri.parse(
            "https://api.baserow.io/api/database/rows/table/170700/?user_field_names=true"),
        headers: {HttpHeaders.authorizationHeader: AppConstants.apiToken});

    Map<String, dynamic> jsonRes = jsonDecode(response.body);

    List<dynamic> booksMap = jsonRes['results'];

    // Iterable<dynamic> booksMap = json.decode(response.body);

    List<Book> books = List<Book>.from(booksMap.map(
      (e) => Book.fromJson(e),
    ));

    return books;
  } catch (err) {
    return Future.error(err);
  }
}

Future<Author> findAuthor(int row) async {
  try {
    final response = await http.get(
        Uri.parse(
            "https://api.baserow.io/api/database/rows/table/170701/$row/?user_field_names=true"),
        headers: {HttpHeaders.authorizationHeader: AppConstants.apiToken});

    return Author.fromJson(jsonDecode(response.body));
  } catch (err) {
    return Future.error(err);
  }
}

Future<List<Author>> fetchAuthors() async {
  try {
    final response = await http.get(
        Uri.parse(
            "https://api.baserow.io/api/database/rows/table/170701/?user_field_names=true"),
        headers: {HttpHeaders.authorizationHeader: AppConstants.apiToken});

    Map<String, dynamic> jsonRes = jsonDecode(response.body);

    List<dynamic> authorsMap = jsonRes['results'];

    // Iterable<dynamic> booksMap = json.decode(response.body);

    List<Author> books = List<Author>.from(authorsMap.map(
      (e) => Author.fromJson(e),
    ));

    return books;
  } catch (err) {
    return Future.error(err);
  }
}
