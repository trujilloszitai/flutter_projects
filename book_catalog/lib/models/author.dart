// To parse this JSON data, do
//
//     final author = authorFromJson(jsonString);

import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));

String authorToJson(Author data) => json.encode(data.toJson());

class Author {
  int id;
  String order;
  String name;
  List<Photo> photos;
  List<Book> books;
  String bio;
  String personalNotes;

  Author({
    required this.id,
    required this.order,
    required this.name,
    required this.photos,
    required this.books,
    required this.bio,
    required this.personalNotes,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        order: json["order"],
        name: json["Name"],
        photos: List<Photo>.from(json["Photos"].map((x) => Photo.fromJson(x))),
        books: List<Book>.from(json["Books"].map((x) => Book.fromJson(x))),
        bio: json["Bio"],
        personalNotes: json["Personal notes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "Name": name,
        "Photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "Books": List<dynamic>.from(books.map((x) => x.toJson())),
        "Bio": bio,
        "Personal notes": personalNotes,
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

class Photo {
  String url;
  Thumbnails thumbnails;
  String name;
  int size;
  String mimeType;
  bool isImage;
  int imageWidth;
  int imageHeight;
  DateTime uploadedAt;

  Photo({
    required this.url,
    required this.thumbnails,
    required this.name,
    required this.size,
    required this.mimeType,
    required this.isImage,
    required this.imageWidth,
    required this.imageHeight,
    required this.uploadedAt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json["url"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        name: json["name"],
        size: json["size"],
        mimeType: json["mime_type"],
        isImage: json["is_image"],
        imageWidth: json["image_width"],
        imageHeight: json["image_height"],
        uploadedAt: DateTime.parse(json["uploaded_at"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "thumbnails": thumbnails.toJson(),
        "name": name,
        "size": size,
        "mime_type": mimeType,
        "is_image": isImage,
        "image_width": imageWidth,
        "image_height": imageHeight,
        "uploaded_at": uploadedAt.toIso8601String(),
      };
}

class Thumbnails {
  Small tiny;
  Small small;

  Thumbnails({
    required this.tiny,
    required this.small,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        tiny: Small.fromJson(json["tiny"]),
        small: Small.fromJson(json["small"]),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny.toJson(),
        "small": small.toJson(),
      };
}

class Small {
  String url;
  int width;
  int height;

  Small({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
