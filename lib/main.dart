import 'package:flutter/material.dart';
import 'package:demna/HomePage.dart';
import 'package:demna/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
