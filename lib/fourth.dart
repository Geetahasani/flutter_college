import 'package:college/flutcalc.dart';
import 'package:flutter/material.dart';

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Details',
      home: Scaffold(
        appBar: AppBar(title: Text('Book details'), centerTitle: true),
        body: BookList(),
      ),
    );
  }
}

class Book {
  final String imageUrl;
  final String name;
  final String author;
  final String price;

  Book({
    required this.imageUrl,
    required this.name,
    required this.author,
    required this.price,
  });
}

class BookList extends StatelessWidget {
  final List<Book> books = [
    Book(
      imageUrl: 'https://via.placeholder.com/100',
      name: 'Flutter for Beginners',
      author: 'John Smith',
      price: '\$20',
    ),
    Book(
      imageUrl: 'https://via.placeholder.com/100',
      name: 'Dart Deep Dive',
      author: 'Emily Johnson',
      price: '\$25',
    ),
    Book(
      imageUrl: 'https://via.placeholder.com/100',
      name: 'Mobile UI Mastery',
      author: 'Michael Brown',
      price: '\$18',
    ),
    Book(
      imageUrl: 'https://via.placeholder.com/100',
      name: 'Coding Logic 101',
      author: 'Olivia Davis',
      price: '\$15',
    ),
    Book(
      imageUrl: 'https://via.placeholder.com/100',
      name: 'State Management Guide',
      author: 'James Wilson',
      price: '\$30',
    ),
    Book(
      imageUrl: 'https://via.placeholder.com/100',
      name: 'Clean Code Principles',
      author: 'Sophia Martinez',
      price: '\$22',
    ),
    Book(
      imageUrl: 'https://via.placeholder.com/100',
      name: 'Cross-Platform Dev',
      author: 'Daniel Lee',
      price: '\$28',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...books.map((book) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.network(book.imageUrl, width: 100, height: 100),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Author: ${book.author}'),
                      Text('Price: ${book.price}'),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CalculatorApp()),
              );
            },
            child: Text('Calculator Page'),
          ),
        ],
      ),
    );
  }
}
