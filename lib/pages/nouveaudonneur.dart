import 'package:flutter/material.dart';
import 'package:demna/network/api.dart';
import 'package:demna/model/donorflutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demna/main.dart';

import 'Profile.dart';

class Ajoutedonneur extends StatefulWidget {
  const Ajoutedonneur({super.key});

  @override
  _AjoutedonneurState createState() => _AjoutedonneurState();
}

String _bloodGroup = '';
String _address = '';

class _AjoutedonneurState extends State<Ajoutedonneur> {
  List posts = [];
  Future getPost() async {
    var url = 'https://banqsang.pythonanywhere.com/donor-list';
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

  final _formKey = GlobalKey<FormState>();
  String Nom = '';
  String mobile = '';
  String age = '';
  String bloodgroup = 'A+';
  String address = 'Nouakchott';
  String _lastDonation = "";
  late int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inscripter"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nom",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer un nom";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        Nom = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Téléphone",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer un numéro de téléphone";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        mobile = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "age",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre age";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        age = value;
                      });
                    },
                  ),
                  DropdownButton(
                    value: bloodgroup,
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
                        bloodgroup = value!;
                      });
                    },
                  ),
                  DropdownButton(
                    value: address,
                    items: [
                      DropdownMenuItem(
                        child: Text("Nouakchott"),
                        value: "Nouakchott",
                      ),
                      DropdownMenuItem(
                        child: Text("Hodh Ech Chargui"),
                        value: "Hodh Ech Chargui",
                      ),
                      DropdownMenuItem(
                        child: Text("Gorgol"),
                        value: "Gorgol",
                      ),
                      DropdownMenuItem(
                        child: Text("Assaba"),
                        value: "Assaba",
                      ),
                      DropdownMenuItem(
                        child: Text("Brakna"),
                        value: "Brakna",
                      ),
                      DropdownMenuItem(
                        child: Text("Hodh El Gharbi "),
                        value: "Hodh El Gharbi ",
                      ),
                      DropdownMenuItem(
                        child: Text("Trarza"),
                        value: "Trarza",
                      ),
                      DropdownMenuItem(
                        child: Text("Guidimaka"),
                        value: "Guidimaka",
                      ),
                      DropdownMenuItem(
                        child: Text("Nouadhibou"),
                        value: "Nouadhibou",
                      ),
                      DropdownMenuItem(
                        child: Text("Tagant"),
                        value: "Tagant",
                      ),
                      DropdownMenuItem(
                        child: Text("Adrar"),
                        value: "Adrar",
                      ),
                      DropdownMenuItem(
                        child: Text("Tiris Zemmour "),
                        value: "Tiris Zemmour ",
                      ),
                      DropdownMenuItem(
                        child: Text("Inchiri"),
                        value: "Inchiri",
                      ),

                      // Ajouter les autres options de groupe sanguin ici
                    ],
                    onChanged: (value) {
                      setState(() {
                        address = value!;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text("Enregistrer"),
                          onPressed: () async {
                            int index = 0;
                            String a = 'false';
                            while (index <= posts.length - 1) {
                              if (posts[index]['mobile'] == mobile) {
                                API.createAuthor(posts[index]['id']);
                                id = posts[index]['id'];
                                a = 'true';

                                break;
                              }
                              index = index + 1;
                            }
                            if (a == 'true') {
                              Navigator.pushNamed(context, "/ProfilePage",
                                  arguments: "1");
                            } else if (a == 'false') {
                              Text("kkk");
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class ProfilePage extends StatefulWidget {
  @override
  const ProfilePage({super.key});

  _ProfilePageState createState() => _ProfilePageState();
}

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
  Future getPost() async {
    var url = 'https://banqsang.pythonanywhere.com/donor-list';
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
    final arg = ModalRoute.of(context)!.settings.arguments;
    int index = int.parse(arg as String);
    return Scaffold(
        appBar: AppBar(
          title: Text('Donors'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(posts[index]['Nom']),
            ],
          ),
        ));
  }
}
