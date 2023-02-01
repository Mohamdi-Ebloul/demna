import 'package:flutter/material.dart';
import 'package:demna/HomePage.dart';
import 'package:demna/test.dart';
import 'package:demna/network/api.dart';
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
                                Navigator.pushNamed(context, "/ProfilePage",
                                    arguments: "${posts[index]['id']}");
                                a = 'true';

                                break;
                              }
                              index = index + 1;
                            }
                            if (a == 'false') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ajoutedonneur()));
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
  String _age = '';
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            // Affichage des informations de l'utilisateur

            // Formulaire pour mettre à jour les informations
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: "${posts[index]['Nom']}",
                    onChanged: (value) => _newName = value,
                    decoration: InputDecoration(labelText: 'Nom'),
                  ),
                  TextFormField(
                    initialValue: "${posts[index]['mobile']}",
                    onChanged: (value) => _newTel = value,
                    decoration: InputDecoration(labelText: 'Telephone'),
                  ),
                  TextFormField(
                    onChanged: (value) => _age = value,
                    initialValue: "${posts[index]['age']}",
                    decoration: InputDecoration(labelText: 'wilaya'),
                  ),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    initialValue: "${posts[index]['bloodgroup']}",
                    decoration: InputDecoration(labelText: 'Groupe sanguin'),
                  ),
                  TextFormField(
                    onChanged: (value) => _newWilaye = value,
                    initialValue: "${posts[index]['address']}",
                    decoration: InputDecoration(labelText: 'wilaya'),
                  ),
                  TextFormField(
                    initialValue: "${posts[index]['status']}",
                    decoration: InputDecoration(labelText: 'status'),
                  ),
                  TextFormField(
                    initialValue: "${posts[index]['date']}",
                    onChanged: (value) => _newLastDonation = value,
                    decoration: InputDecoration(labelText: 'Dernier don'),
                  ),
                  // Bouton pour mettre à jour les informations
                  ElevatedButton(
                    onPressed: () async {},
                    child: Text('Mettre à jour'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
