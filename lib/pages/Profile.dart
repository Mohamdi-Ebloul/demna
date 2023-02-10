import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demna/fix/navigation.dart';
import 'package:demna/pages/raport.dart';
import 'package:flutter/material.dart';
import 'package:demna/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage.dart';
import '../fix/appbarfix.dart';
import '../fix/drawerfix.dart';
import '../main.dart';

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
  int id = 0;
  String Nom = '';
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
      id = pref.getInt("id")!;

      Nom = pref.getString("Nom")!;
      mobile = pref.getString("mobile")!;
      date_naissance = pref.getString("date_naissance")!;
      bloodgroup = pref.getString("bloodgroup")!;
      address = pref.getString("address")!;
      status = pref.getString("status")!;
      lastdonat = pref.getString("lastdonat")!;
      con = pref.getInt("con")!;
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
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(Icons.person, size: 30.0),
                          Text('    ${Nom}', style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(Icons.mobile_friendly, size: 30.0),
                          Text('    ${mobile}',
                              style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.edit),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(Icons.bloodtype, size: 30.0),
                          SizedBox(width: 10.0),
                          Text('    ${bloodgroup}',
                              style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(Icons.date_range, size: 30.0),
                          Text('    ${date_naissance}',
                              style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(Icons.place, size: 30.0),
                          Text('    ${address}',
                              style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.edit),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(Icons.autorenew, size: 30.0),
                          Text('    ${status}',
                              style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(Icons.date_range, size: 30.0),
                          Text('    ${lastdonat}',
                              style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                InkWell(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(Icons.article, size: 30.0),
                            Text('   Raports Médicaux',
                                style: TextStyle(fontSize: 18.0))
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setInt("id", id);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => raport()),
                        (route) => false);
                  },
                )
              ],
            ),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.clear();
              await pref.setInt("con", 0);
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
    );
  }
}
