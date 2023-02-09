import 'package:demna/pages/Profile.dart';
import 'package:demna/pages/nouveaudonneur.dart';
import 'package:flutter/material.dart';
import 'package:demna/pages/contactpage.dart';
import 'package:demna/listes/clinicliste.dart';
import 'package:demna/listes/hopitauxliste.dart';
import 'package:demna/listes/laboliste.dart';
import 'package:demna/listes/pharmacyliste.dart';
import 'package:demna/pages/Recherche.dart';
import 'package:demna/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fix/appbarfix.dart';
import 'fix/drawerfix.dart';
import 'fix/navigation.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  const HomePage({super.key});

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getcred();
  }

  void getcred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      con = pref.getInt("con")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: appbarfix(
        title: 'Ma Santé',
      ),
      drawer: drawerfix(),
      body: new Container(
        margin: EdgeInsets.all(70),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ajoutedonneur()));
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  title: Text(
                    "Inscription",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  leading: Icon(
                    Icons.bloodtype_outlined,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "Recherche ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    leading: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 199, 13, 0),
                      size: 40,
                    ),
                  ),
                )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClinicListPage()));
                  },
                  child: Icon(
                    Icons.medical_services,
                    color: Colors.red,
                    size: 80,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyListPage()));
                  },
                  child: Icon(
                    Icons.local_pharmacy,
                    color: Colors.red,
                    size: 80,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HopitauxListPage()));
                  },
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 80,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LaboListPage()));
                  },
                  child: Icon(
                    Icons.biotech,
                    color: Colors.red,
                    size: 80,
                  ),
                )
              ],
            )
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
