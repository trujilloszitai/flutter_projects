// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  int id;
  String order;
  String bookTitle;
  String synopsis;
  List<AuthorS> authorS;
  List<CoverPhoto> coverPhoto;
  bool inPossession;
  Format format;
  Format status;
  List<AuthorS> publisher;
  String? personalNotes;
  Format language;
  String? pages;

  Book({
    required this.id,
    required this.order,
    required this.bookTitle,
    required this.synopsis,
    required this.authorS,
    required this.coverPhoto,
    required this.inPossession,
    required this.format,
    required this.status,
    required this.publisher,
    this.personalNotes,
    required this.language,
    this.pages,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        order: json["order"],
        bookTitle: json["Book title"],
        synopsis: json["Synopsis"],
        authorS: List<AuthorS>.from(
            json["Author(s)"].map((x) => AuthorS.fromJson(x))),
        coverPhoto: List<CoverPhoto>.from(
            json["Cover photo"].map((x) => CoverPhoto.fromJson(x))),
        inPossession: json["In possession?"],
        format: Format.fromJson(json["Format"]),
        status: Format.fromJson(json["Status"]),
        publisher: List<AuthorS>.from(
            json["Publisher"].map((x) => AuthorS.fromJson(x))),
        personalNotes: json["Personal notes"],
        language: Format.fromJson(json["Language"]),
        pages: json["Pages"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "Book title": bookTitle,
        "Synopsis": synopsis,
        "Author(s)": List<dynamic>.from(authorS.map((x) => x.toJson())),
        "Cover photo": List<dynamic>.from(coverPhoto.map((x) => x.toJson())),
        "In possession?": inPossession,
        "Format": format.toJson(),
        "Status": status.toJson(),
        "Publisher": List<dynamic>.from(publisher.map((x) => x.toJson())),
        "Personal notes": personalNotes,
        "Language": language.toJson(),
        "Pages": pages,
      };
}

class AuthorS {
  int id;
  String value;

  AuthorS({
    required this.id,
    required this.value,
  });

  factory AuthorS.fromJson(Map<String, dynamic> json) => AuthorS(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}

class CoverPhoto {
  String url;
  Thumbnails thumbnails;
  String name;
  int size;
  String mimeType;
  bool isImage;
  int imageWidth;
  int imageHeight;
  DateTime uploadedAt;

  CoverPhoto({
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

  factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
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
  int? width;
  int height;

  Small({
    required this.url,
    this.width,
    required this.height,
  });

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        url: json["url"],
        width: 21,
        height: 21,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Format {
  int id;
  String value;
  String color;

  Format({
    required this.id,
    required this.value,
    required this.color,
  });

  factory Format.fromJson(Map<String, dynamic> json) => Format(
        id: json["id"],
        value: json["value"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "color": color,
      };
}
