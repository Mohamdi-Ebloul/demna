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
        appBar: AppBar(
          title: Text('Ma Santé'),
          backgroundColor: Color.fromARGB(255, 199, 13, 0),
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    child: Icon(
                      Icons.bloodtype,
                      color: Color.fromARGB(255, 199, 13, 0),
                      size: 150,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                  title: Text(
                    ' Acceil',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_hospital,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                  title: Text('Hospitals',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HopitauxListPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.medical_services,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                  title: Text('Clinics',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClinicListPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                  title: Text('Pharmacies',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PharmacyListPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.science,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                  title: Text('Laboratories',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LaboListPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                  title: Text('Doneur',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      )),
                  onTap: () {
                    if (con == 0) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    }
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 199, 13, 0),
                    size: 40,
                  ),
                  title: Text('Contact Us',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
        ));
  }
}
