import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

import '../HomePage.dart';
import '../login.dart';

class drawerfix extends StatelessWidget implements PreferredSizeWidget {
  const drawerfix({
    Key? key,
  }) : super(key: key);

  @override
  Size get PreferredSize => Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
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
            ListTile(
                leading: con != 0
                    ? Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 199, 13, 0),
                        size: 40,
                      )
                    : Text(''),
                title: con != 0
                    ? Text('Logout',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                        ))
                    : Text(""),
                onTap: con != 0
                    ? () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.clear();
                        await pref.setInt("con", 0);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      }
                    : () {}),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
