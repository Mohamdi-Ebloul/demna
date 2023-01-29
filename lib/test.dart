import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class test extends StatefulWidget {
  test({Key? key}) : super(key: key);
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  List posts = [];
  Future getPost() async {
    var url = "https://banqsang.pythonanywhere.com/donor-list";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      posts.addAll(responsebody);
    });
    print(posts);
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
        ),
        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i) {
              return Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("${posts[i]['address']}"));
            }));
  }
}
