import 'package:flutter/material.dart';

import '../../../models/book_model.dart';

class BookDetailScreen extends StatelessWidget {
  final String bookId;

  const BookDetailScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
      ),
      body: FutureBuilder<Book>(
        future: fetchBookDetail(bookId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Failed to fetch book detail');
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
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
