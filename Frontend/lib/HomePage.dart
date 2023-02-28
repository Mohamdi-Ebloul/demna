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

import 'applocal.dart';
import 'fix/appbarfix.dart';
import 'fix/drawerfix.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  const HomePage({super.key});

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final responsebody = jsonDecode(response.body);

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
    refreshPage();
  }

  void refreshPage() {
    Future.delayed(Duration(seconds: 30), () {
      setState(() {});

      refreshPage();
    });
  }

  void getcred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      con = pref.getInt("con")!;
      id = pref.getInt("id")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: appbarfix(
          title: '${getLang(context, "homepage")}',
          i: nbr - nbrn,
          idnb: id,
          nb: nbr,
          init: init),
      drawer: drawerfix(),
      body: Container(
        margin: EdgeInsets.all(70),
        child: Column(
          children: [
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
                      "${getLang(context, "Recherche")} ",
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
