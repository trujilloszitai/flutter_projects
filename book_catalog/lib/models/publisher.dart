// To parse this JSON data, do
//
//     final publisher = publisherFromJson(jsonString);

import 'dart:convert';

Publisher publisherFromJson(String str) => Publisher.fromJson(json.decode(str));

String publisherToJson(Publisher data) => json.encode(data.toJson());

class Publisher {
  int id;
  String order;
  String name;
  List<Book> books;
  String website;

  Publisher({
    required this.id,
    required this.order,
    required this.name,
    required this.books,
    required this.website,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        id: json["id"],
        order: json["order"],
        name: json["Name"],
        books: List<Book>.from(json["Books"].map((x) => Book.fromJson(x))),
        website: json["Website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "Name": name,
        "Books": List<dynamic>.from(books.map((x) => x.toJson())),
        "Website": website,
      };
}

class Book {
  int id;
  String value;

  Book({
    required this.id,
    required this.value,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
