import 'package:demna/login.dart';
import 'package:flutter/material.dart';
import 'package:demna/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../applocal.dart';
import '../fix/appbarfix.dart';
import '../fix/drawerfix.dart';
import '../fix/navigation.dart';
import '../main.dart';
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

  final _formKey = GlobalKey<FormState>();
  String Nom = '';
  String mobile = '';
  String nni = '';

  String date_naissance = '';
  String bloodgroup = 'A+';
  String address = 'Nouakchott';
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarfix(
            title: '${getLang(context, "Inscripter")}',
            i: nbr - nbrn,
            idnb: id,
            nb: nbr,
            init: init),
        drawer: drawerfix(),
        bottomNavigationBar: navigation(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "${getLang(context, "Nom")} ",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.person)),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "${getLang(context, "Téléphone")} ",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.mobile_friendly)),
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
                        labelText: "${getLang(context, "NNI")} ",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.numbers)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer NNI";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        nni = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "${getLang(context, "Date_naissance")} ",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.date_range)),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "${getLang(context, "Password")} ",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.password)),
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 199, 13, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: Text(
                            '${getLang(context, "Enregistrer")}  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () async {
                            int index = 0;
                            String a = 'false';
                            while (index <= posts.length - 1) {
                              if (posts[index]['date_naissance'] ==
                                      date_naissance &&
                                  posts[index]['bloodgroup'] == bloodgroup &&
                                  posts[index]['nni'] == nni) {
                                API.activedonor(posts[index]['id']);
                                API.Ajouter(
                                    Nom,
                                    mobile,
                                    nni,
                                    address,
                                    bloodgroup,
                                    date_naissance,
                                    password,
                                    "${posts[index]['id']}");

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                    (route) => false);

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
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 199, 13, 0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Ok ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
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
