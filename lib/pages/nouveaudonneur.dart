import 'package:flutter/material.dart';
import 'package:demna/api/api.dart';
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
  String date_naissance = '';
  String bloodgroup = 'A+';
  String address = 'Nouakchott';
  String password = "";
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
                      hintText: "date_naissance",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre date_naissance";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        date_naissance = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre password";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  Row(
                    children: [
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
                      Spacer(),
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
                    ],
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
                                API.activedonor(posts[index]['id']);
                                API.Ajouter(Nom, mobile, address, bloodgroup,
                                    date_naissance, password);
                                Navigator.pushNamed(context, "/ProfilePage",
                                    arguments: dataf(
                                        "${posts[index]['id']}",
                                        "${posts[index]['Nom']}",
                                        "${posts[index]['mobile']}",
                                        "${posts[index]['date_naissance']}",
                                        "${posts[index]['bloodgroup']}",
                                        "${posts[index]['address']}",
                                        "${posts[index]['status']}",
                                        "${posts[index]['date']}"));
                                a = 'true';

                                break;
                              }
                              index = index + 1;
                            }
                            if (a == 'false') {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Inscription ne pas valid'),
                                    content:
                                        Text('Ces Information ne pas correct'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
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

//profile

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

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as dataf;
    // int index = int.parse(arg as String);

    return Scaffold(
      appBar: AppBar(
        title: Text('Donors'),
      ),
      body: Column(
        children: <Widget>[
          // Affichage des informations de l'utilisateur

          // Formulaire pour mettre à jour les informations
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: arg.Nom,
                  onChanged: (value) => _newName = value,
                  decoration: InputDecoration(labelText: 'Nom'),
                ),
                TextFormField(
                  initialValue: arg.mobile,
                  onChanged: (value) => _newTel = value,
                  decoration: InputDecoration(labelText: 'Telephone'),
                ),
                TextFormField(
                  onChanged: (value) => _age = value,
                  initialValue: arg.date_naissance,
                  decoration: InputDecoration(labelText: 'date_naissance'),
                ),
                TextFormField(
                  showCursor: false,
                  readOnly: true,
                  initialValue: arg.bloodgroup,
                  decoration: InputDecoration(labelText: 'Groupe sanguin'),
                ),
                TextFormField(
                  onChanged: (value) => _newWilaye = value,
                  initialValue: arg.address,
                  decoration: InputDecoration(labelText: 'wilaya'),
                ),
                TextFormField(
                  initialValue: arg.status,
                  decoration: InputDecoration(labelText: 'status'),
                ),
                TextFormField(
                  initialValue: arg.date,
                  onChanged: (value) => _newLastDonation = value,
                  decoration: InputDecoration(labelText: 'Dernier don'),
                ),
                // Bouton pour mettre à jour les informations
                ElevatedButton(
                  onPressed: () async {
                    API.Modifier(arg.id, _newName, _newTel, _newWilaye);
                  },
                  child: Text('Mettre à jour'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
