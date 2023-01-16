import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as dart_mongo;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variables pour stocker les informations de l'utilisateur

  String _name = "John Doe";
  String _tel = "22334455";
  String _email = "email@gmail.com";
  String _bloodType = "A+";
  String _wilaye = "nkc";
  String _lastDonation = "01/01/2022";

  // Variables pour stocker les informations modifiables
  String _newName = '';
  String _newTel = "";
  String _newEmail = "";
  String _newWilaye = "";
  String _newLastDonation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations'),
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
                    initialValue: _name,
                    onChanged: (value) => _newName = value,
                    decoration: InputDecoration(labelText: 'Nom'),
                  ),
                  TextFormField(
                    initialValue: _tel,
                    onChanged: (value) => _newTel = value,
                    decoration: InputDecoration(labelText: 'Telephone'),
                  ),
                  TextFormField(
                    onChanged: (value) => _newEmail = value,
                    initialValue: _email,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    initialValue: _bloodType,
                    decoration: InputDecoration(labelText: 'Groupe sanguin'),
                  ),

                  TextFormField(
                    onChanged: (value) => _newWilaye = value,
                    initialValue: _wilaye,
                    decoration: InputDecoration(labelText: 'Wilaya'),
                  ),

                  TextFormField(
                    initialValue: _lastDonation,
                    onChanged: (value) => _newLastDonation = value,
                    decoration: InputDecoration(labelText: 'Dernier don'),
                  ),
                  // Bouton pour mettre à jour les informations
                  ElevatedButton(
                    onPressed: () async {
                      // Code pour mettre à jour les informations dans MongoDB ici...
                      // Exemple :
                      var db = dart_mongo.Db(
                          "mongodb://username:password@host:port/database");
                      await db.open();
                      var collection = db.collection('users');
                      await collection.update(
                          dart_mongo.where.eq("name", _name),
                          dart_mongo.modify
                              .set("name", _newName)
                              .set("lastDonation", _newLastDonation)
                              .set("tel", _newTel)
                              .set("email", _newEmail)
                              .set("lastDonation", _newLastDonation)
                              .set("wilaya", _newWilaye));
                      await db.close();
                      // Mise à jour des informations affichées
                      setState(() {
                        _name = _newName;
                        _tel = _newTel;
                        _email = _newEmail;
                        _wilaye = _newWilaye;
                        _lastDonation = _newLastDonation;
                      });
                    },
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
