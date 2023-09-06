import 'dart:convert';
import 'package:http/http.dart' as http;

class Book {
  final String title;
  final String subtitle;
  final String authors;
  final String publisher;
  final String language;
  final String isbn10;
  final String isbn13;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final String price;
  final String image;

  Book({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      subtitle: json['subtitle'],
      authors: json['authors'],
      publisher: json['publisher'],
      language: json['language'],
      isbn10: json['isbn10'],
      isbn13: json['isbn13'],
      pages: json['pages'],
      year: json['year'],
      rating: json['rating'],
      desc: json['desc'],
      price: json['price'],
      image: json['image'],
    );
  }
}

Future<Book> fetchBookDetail(String bookId) async {
  final response =
      await http.get(Uri.parse('https://api.itbook.store/1.0/books/$bookId'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return Book.fromJson(data);
  } else {
    throw Exception('Failed to fetch book detail');
  }
}
