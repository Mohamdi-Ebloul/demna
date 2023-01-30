import 'package:flutter/material.dart';

class Ajoutedonneur extends StatefulWidget {
  @override
  _AjoutedonneurState createState() => _AjoutedonneurState();
}

class _AjoutedonneurState extends State<Ajoutedonneur> {
  final _formKey = GlobalKey<FormState>();
  String Nom = "";
  String mobile = "";
  String age = "";
  String address = "";
  String bloodgroup = "A+";
  String _lastDonation = "";

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
                          onPressed: () async {},
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
