import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../HomePage.dart';

class navigation extends StatelessWidget implements PreferredSizeWidget {
  const navigation({
    Key? key,
  }) : super(key: key);

  @override
  Size get PreferredSize => Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Color.fromARGB(255, 199, 13, 0),
      backgroundColor: Colors.blueAccent,
      items: <Widget>[
        Icon(Icons.home, size: 30),
      ],
      height: 50,
      onTap: (index) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
