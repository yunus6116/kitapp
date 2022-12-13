import 'package:cloud_firestore/cloud_firestore.dart';

import '../date_model.dart';

class BookModel {
  String? aboutBook;
  String? author;
  String? bookUrl;
  String? category;
  String? coverImageUrl;
  String? language;
  String? nameOfBook;
  int? pages;
  Timestamp? releaseDate;
  int? star;
  BookModel({
    this.aboutBook,
    this.author,
    this.bookUrl,
    this.category,
    this.coverImageUrl,
    this.language,
    this.nameOfBook,
    this.pages,
    this.releaseDate,
    this.star,
  });

  BookModel copyWith({
    String? aboutBook,
    String? author,
    String? bookUrl,
    String? category,
    String? coverImageUrl,
    String? language,
    String? nameOfBook,
    int? pages,
    Timestamp? releaseDate,
    int? star,
  }) {
    return BookModel(
      aboutBook: aboutBook ?? this.aboutBook,
      author: author ?? this.author,
      bookUrl: bookUrl ?? this.bookUrl,
      category: category ?? this.category,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      language: language ?? this.language,
      nameOfBook: nameOfBook ?? this.nameOfBook,
      pages: pages ?? this.pages,
      releaseDate: releaseDate ?? this.releaseDate,
      star: star ?? this.star,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aboutBook': aboutBook,
      'author': author,
      'bookUrl': bookUrl,
      'category': category,
      'coverImageUrl': coverImageUrl,
      'language': language,
      'nameOfBook': nameOfBook,
      'pages': pages,
      'releaseDate': Date.fromDocumentSnapshot(releaseDate),
      'star': star,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      aboutBook: map['aboutBook'] != null ? map['aboutBook'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      bookUrl: map['bookUrl'] != null ? map['bookUrl'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      coverImageUrl:
          map['coverImageUrl'] != null ? map['coverImageUrl'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      nameOfBook:
          map['nameOfBook'] != null ? map['nameOfBook'] as String : null,
      pages: map['pages'] != null ? map['pages'] as int : null,
      releaseDate: map['releaseDate'],
      star: map['star'] != null ? map['star'] as int : null,
    );
  }
}
