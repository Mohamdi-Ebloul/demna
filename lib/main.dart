import 'package:demna/pages/nouveaudonneur.dart';
import 'package:flutter/material.dart';
import 'package:demna/HomePage.dart';
import 'package:demna/test.dart';
import 'package:demna/api/api.dart';
import 'package:demna/model/donorflutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/ProfilePage': (context) => ProfilePage()},
      home: HomePage(),
    );
  }
}
