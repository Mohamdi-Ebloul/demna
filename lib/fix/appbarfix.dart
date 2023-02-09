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

class appbarfix extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const appbarfix({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get PreferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Color.fromARGB(255, 199, 13, 0),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
            iconSize: 100.0,
            icon: con != 0
                ? Icon(
                    Icons.person,
                    size: 35,
                  )
                : Row(
                    children: [
                      Text("login", style: TextStyle(fontSize: 25)),
                      Icon(
                        Icons.login,
                        size: 35,
                      )
                    ],
                  ),
            onPressed: con == 0
                ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                : () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  })
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
