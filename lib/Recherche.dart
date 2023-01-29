import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

String _bloodGroup = '';
String _address = '';

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Blood Group',
              ),
              onChanged: (value) {
                setState(() {
                  _bloodGroup = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address',
              ),
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                if (_bloodGroup != null &&
                    posts[index]['bloodgroup'] != _bloodGroup) {
                  return Container();
                }
                if (_address != null &&
                    !posts[index]['address'].contains(_address)) {
                  return Container();
                }
                return Column(
                  children: [
                    ListTile(
                      leading: Text("${posts[index]['Nom']}"),
                      title: Text("${posts[index]['bloodgroup']}"),
                      subtitle: Text("${posts[index]['address']}"),
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
