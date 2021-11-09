import 'package:flutter/material.dart';
import 'package:lobozoo/screens/home.dart';

void main() => runApp(Lobozoo());

/// This is the main application widget.
class Lobozoo extends StatelessWidget {
  const Lobozoo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lobozoo',
      home: Home(),
    );
  }
}
