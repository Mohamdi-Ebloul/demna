import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = "John Doe";
  String _tel = "22334455";
  String _email = "email@gmail.com";
  String _bloodType = "A+";
  String _wilaye = "nkc";
  String _lastDonation = "01/01/2022";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text("Nom : $_name"),
              Text("Telphone: $_tel"),
              Text("Email :$_email"),
              Text("Groupe sanguin : $_bloodType"),
              Text("wilaya: $_wilaye"),
              Text("Dernier don : $_lastDonation"),
            ],
          ),
        ),
      ),
    );
  }
}
