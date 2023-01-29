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
        title: Text("Liste des donneurs"),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${posts[index]['Nom']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${posts[index]['address']}",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${posts[index]['mobile']}",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15.0),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // Appeler directement le donneur
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sms,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // Envoyer un SMS au donneur
                    },
                  ),
                  Container(
                    width: 60.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: posts[index]['status'] == 'ready'
                          ? Colors.blue
                          : posts[index]['status'] == 'notready'
                              ? Color.fromARGB(255, 255, 193, 59)
                              : Colors.red,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        "${posts[index]['status']}" == 'ready'
                            ? "${posts[index]['bloodgroup']}"
                            : "${posts[index]['status']}" == 'notready'
                                ? "${posts[index]['bloodgroup']}"
                                : "${posts[index]['bloodgroup']}",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
