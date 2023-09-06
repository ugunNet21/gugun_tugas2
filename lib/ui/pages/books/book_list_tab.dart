import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'book_detail_screen.dart';

class BookListTab extends StatefulWidget {
  @override
  _BookListTabState createState() => _BookListTabState();
}

class _BookListTabState extends State<BookListTab> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final response = await http.get(
        Uri.parse('https://api.itbook.store/1.0/search/Flutter%20Developer'));//daftar buku
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        books =
            List<Book>.from(data['books'].map((book) => Book.fromJson(book)));
      });
    } else {
      print('Failed to fetch books');
    }
  }

  void _navigateToBookDetail(String bookId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailScreen(bookId: bookId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () => _navigateToBookDetail(book.bookId),
            child: ListTile(
              title: Text(book.title),
              subtitle: Text(book.subtitle),
              leading: Image.network(book.image),
            ),
          );
        },
      ),
    );
  }
}

class Book {
  final String bookId;
  final String title;
  final String subtitle;
  final String image;

  Book({
    required this.bookId,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookId: json['isbn13'],
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
    );
  }
}

