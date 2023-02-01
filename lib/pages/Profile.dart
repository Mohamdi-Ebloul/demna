import 'package:demna/network/api.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:demna/model/donorflutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  const ProfilePage({super.key});

  _ProfilePageState createState() => _ProfilePageState();
}

String _bloodGroup = '';
String _address = '';

class _ProfilePageState extends State<ProfilePage> {
  // Variables pour stocker les informations de l'utilisateur

  // Variables pour stocker les informations modifiables
  String _newName = '';
  String _newTel = "";
  String _newEmail = "";
  String _newWilaye = "";
  String _newLastDonation = '';

  final _formKey = GlobalKey<FormState>();
  List posts = [];
  Future getPost(int id) async {
    var url = 'https://banqsang.pythonanywhere.com/donor/2/';
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      posts.add(responsebody);
    });
    print(posts);
  }

  @override
  void initState() {
    final arg = ModalRoute.of(context)!.settings.arguments;

    getPost(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
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
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${posts[index]['mobile']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
                          ],
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
