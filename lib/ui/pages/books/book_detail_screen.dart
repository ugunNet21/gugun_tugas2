import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class BookDetailScreen extends StatelessWidget {
  final String bookId;

  BookDetailScreen({required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
      ),
      body: FutureBuilder<Book>(
        future: fetchBookDetail(bookId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Failed to fetch book detail');
          } else if (snapshot.hasData) {
            final book = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Title: ${book.title}'),
                Text('Subtitle: ${book.subtitle}'),
                Text('Authors: ${book.authors}'),
                Text('Publisher: ${book.publisher}'),
                Text('Language: ${book.language}'),
                Text('ISBN10: ${book.isbn10}'),
                Text('ISBN13: ${book.isbn13}'),
                Text('Pages: ${book.pages}'),
                Text('Year: ${book.year}'),
                Text('Rating: ${book.rating}'),
                Text('Description: ${book.desc}'),
                Text('Price: ${book.price}'),
                Image.network(book.image),
              ],
            );
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }

  Future<Book> fetchBookDetail(String bookId) async {
    final response = await http.get(Uri.parse('https://api.itbook.store/1.0/books/$bookId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Book.fromJson(data);
    } else {
      throw Exception('Failed to fetch book detail');
    }
  }
}

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
