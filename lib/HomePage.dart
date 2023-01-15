import 'package:flutter/material.dart';
import 'package:demna/contactpage.dart';
import 'package:demna/clinicliste.dart';
import 'package:demna/hopitauxliste.dart';
import 'package:demna/laboliste.dart';
import 'package:demna/pharmacyliste.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ma Santé'),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: Image.asset("Images/sang.png"),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: Text(' Acceil'),
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
                ),
                title: Text('Hospitals'),
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
                  Icons.local_hospital,
                ),
                title: Text('Clinics'),
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
                  Icons.medication,
                ),
                title: Text('Pharmacies'),
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
                  Icons.local_pharmacy,
                ),
                title: Text('Laboratories'),
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
                  Icons.local_hospital,
                ),
                title: Text('Information'),
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
                  Icons.email,
                ),
                title: Text('Contact Us'),
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
              width: 500,
              height: 400,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                  Column(
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
