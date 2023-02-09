import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demna/fix/navigation.dart';
import 'package:flutter/material.dart';
import 'package:demna/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage.dart';
import '../fix/appbarfix.dart';
import '../fix/drawerfix.dart';

class ProfilePage extends StatefulWidget {
  @override
  const ProfilePage({super.key});

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _newName = '';
  String _newTel = "";
  String _newEmail = "";
  String _newWilaye = "";
  String _age = '';
  String _newLastDonation = '';

  final _formKey = GlobalKey<FormState>();
  String token = '';
  String mobile = '';
  String date_naissance = '';
  String bloodgroup = '';
  String address = '';
  String status = '';
  String lastdonat = '';
  @override
  void initState() {
    super.initState();
    getcred();
  }

  void getcred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("login")!;
      mobile = pref.getString("mobile")!;
      date_naissance = pref.getString("date_naissance")!;
      bloodgroup = pref.getString("bloodgroup")!;
      address = pref.getString("address")!;
      status = pref.getString("status")!;
      lastdonat = pref.getString("lastdonat")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final arg = ModalRoute.of(context)!.settings.arguments as dataf;
    // int index = int.parse(arg as String);

    return Scaffold(
      appBar: appbarfix(
        title: 'Donors',
      ),
      drawer: drawerfix(),
      bottomNavigationBar: navigation(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: '${token}',
                    onChanged: (value) => _newName = value,
                    decoration: InputDecoration(labelText: '${token}'),
                  ),
                  TextFormField(
                    initialValue: '${mobile}',
                    onChanged: (value) => _newTel = value,
                    decoration: InputDecoration(labelText: '${mobile}'),
                  ),
                  TextFormField(
                    onChanged: (value) => _age = value,
                    initialValue: '${date_naissance}',
                    decoration: InputDecoration(labelText: '${date_naissance}'),
                  ),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    initialValue: '${bloodgroup}',
                    decoration: InputDecoration(labelText: '${bloodgroup}'),
                  ),
                  TextFormField(
                    onChanged: (value) => _newWilaye = value,
                    initialValue: '${address}',
                    decoration: InputDecoration(labelText: '${address}'),
                  ),
                  TextFormField(
                    initialValue: '${status}',
                    decoration: InputDecoration(labelText: '${status}'),
                  ),
                  TextFormField(
                    initialValue: '${lastdonat}',
                    onChanged: (value) => _newLastDonation = value,
                    decoration: InputDecoration(labelText: '${lastdonat}'),
                  ),
                  // Bouton pour mettre à jour les informations
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     API.Modifier(token, _newName, _newTel, _newWilaye);
                  //   },
                  //   child: Text('Mettre à jour'),
                  // ),

                  OutlinedButton.icon(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      await pref.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false);
                    },
                    icon: Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 199, 13, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    label: Text(
                      'Logout ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
