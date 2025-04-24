import 'package:college/contact.dart';
import 'package:college/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(First());
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ContactFormScreen());
  }
}

