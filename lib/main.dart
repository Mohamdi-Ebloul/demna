import 'package:demna/Introduction.dart';
import 'package:flutter/material.dart';
import 'package:demna/pages/Profile.dart';

var con = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/ProfilePage': (context) => ProfilePage()},
      home: welcomescreen(),
    );
  }
}
