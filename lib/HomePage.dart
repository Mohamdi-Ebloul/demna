import 'package:flutter/material.dart';
import 'package:demna/contactpage.dart';
import 'package:demna/clinicliste.dart';
import 'package:demna/hopitauxliste.dart';
import 'package:demna/laboliste.dart';
import 'package:demna/pharmacyliste.dart';
import 'package:demna/Profile.dart';
import 'package:demna/Recherche.dart';
import 'package:demna/nouveaudonneur.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ma Santé'),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    child: Icon(
                      Icons.bloodtype,
                      color: Color.fromARGB(255, 6, 105, 185),
                      size: 150,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 44, 154, 243),
                  ),
                  title: Text(
                    ' Acceil',
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 154, 243),
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
                    color: Color.fromARGB(255, 44, 154, 243),
                  ),
                  title: Text('Hospitals',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 154, 243),
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
                    color: Color.fromARGB(255, 44, 154, 243),
                  ),
                  title: Text('Clinics',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 154, 243),
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
                    color: Color.fromARGB(255, 44, 154, 243),
                  ),
                  title: Text('Pharmacies',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 154, 243),
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
                    color: Color.fromARGB(255, 44, 154, 243),
                  ),
                  title: Text('Laboratories',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 154, 243),
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
                    color: Color.fromARGB(255, 44, 154, 243),
                  ),
                  title: Text('Mes informations',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 154, 243),
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 44, 154, 243),
                  ),
                  title: Text('Contact Us',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 154, 243),
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
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("Images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddUserPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 350,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                                child: ListTile(
                              title: Text(
                                "Inscripter comme donneur",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              leading: Icon(
                                Icons.bloodtype_outlined,
                                color: Color.fromARGB(255, 44, 154, 243),
                              ),
                            )),
                          ),
                        ),
                      ]),
                      Column(children: <Widget>[
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage()));
                            },
                            child: Container(
                              width: 350,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    "Recherch donneur",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  leading: Icon(
                                    Icons.search,
                                    color: Color.fromARGB(255, 44, 154, 243),
                                  ),
                                ),
                              ),
                            )),
                      ]),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClinicListPage()));
                          },
                          child: Image.asset(
                            'Images/clc.png',
                            height: 130.0,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Cliniques",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ]),
                      Column(children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PharmacyListPage()));
                          },
                          child: Image.asset(
                            'Images/heart.png',
                            height: 130.0,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Pharmacies",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )
                      ]),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HopitauxListPage()));
                          },
                          child: Image.asset(
                            'Images/medicament.png',
                            height: 130.0,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Hopitaux",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )
                      ]),
                      Column(children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LaboListPage()));
                          },
                          child: Image.asset(
                            'Images/biosample.png',
                            height: 130.0,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Laboratoires",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )
                      ])
                    ],
                  )
                ],
              ),
              alignment: Alignment.center,
            )
          ],
        ));
  }
}
