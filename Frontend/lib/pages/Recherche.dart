import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../applocal.dart';
import '../fix/appbarfix.dart';
import '../fix/drawerfix.dart';
import '../fix/navigation.dart';
import '../main.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

String _bloodGroup = 'A+';
String _address = '';

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  List posts = [];
  Future getPost() async {
    var url = 'https://banqsang.pythonanywhere.com/donor-list';
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      posts.addAll(responsebody);
    });
  }

  int nbr = 0;
  int idnb = 0;

  List postsnbr = [];

  Future getnbr() async {
    var url = 'https://banqsang.pythonanywhere.com/rapor/$id/';
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      postsnbr.addAll(responsebody);
      nbr = postsnbr.length;
    });
  }

  int nbrn = 0;
  int init = 0;
  List posts2 = [];

  Future getnbr2() async {
    var url = 'https://banqsang.pythonanywhere.com/nbr/$id/';
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      nbrn = int.parse(responsebody['nb']);
      init = responsebody['id'];
    });
  }

  @override
  void initState() {
    super.initState();
    getcred();
    getnbr();
    getnbr2();
    getPost();
  }

  void getcred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      con = pref.getInt("con")!;
      id = pref.getInt("id")!;
    });
  }

  Future<void>? _launched;
  Future<void> contacter(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfix(
          title: '${getLang(context, "Recherche")} ',
          i: nbr - nbrn,
          idnb: id,
          nb: nbr,
          init: init),
      drawer: drawerfix(),
      bottomNavigationBar: navigation(),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  child: DropdownButton(
                    value: _bloodGroup,
                    items: [
                      DropdownMenuItem(
                        child: Text("A+"),
                        value: "A+",
                      ),
                      DropdownMenuItem(
                        child: Text("A-"),
                        value: "A-",
                      ),
                      DropdownMenuItem(
                        child: Text("B+"),
                        value: "B+",
                      ),
                      DropdownMenuItem(
                        child: Text("B-"),
                        value: "B-",
                      ),
                      DropdownMenuItem(
                        child: Text("O+"),
                        value: "O+",
                      ),
                      DropdownMenuItem(
                        child: Text("O-"),
                        value: "O-",
                      ),
                      DropdownMenuItem(
                        child: Text("AB+"),
                        value: "AB+",
                      ),
                      DropdownMenuItem(
                        child: Text("AB-"),
                        value: "AB-",
                      ),
                      // Ajouter les autres options de groupe sanguin ici
                    ],
                    onChanged: (value) {
                      setState(() {
                        _bloodGroup = value!;
                      });
                    },
                  ),
                ),
                Spacer(),
                Container(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: '${getLang(context, "Address")} ',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.place)),
                    onChanged: (value) {
                      setState(() {
                        _address = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  if (_bloodGroup != null &&
                          posts[index]['bloodgroup'] != _bloodGroup ||
                      "${posts[index]['activite']}" != 'active') {
                    return Container();
                  }
                  if (_address != null &&
                      !posts[index]['address'].contains(_address)) {
                    return Container();
                  }
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
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
                          IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Colors.blue,
                            ),
                            onPressed: () => setState(() {
                              _launched =
                                  contacter('tel:${posts[index]['mobile']}');
                            }),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.sms,
                              color: Colors.blue,
                            ),
                            onPressed: () => setState(() {
                              _launched =
                                  contacter('sms:${posts[index]['mobile']}');
                            }),
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
      ),
    );
  }
}
