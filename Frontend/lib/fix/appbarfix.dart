import 'package:demna/api/api.dart';
import 'package:demna/pages/raport.dart';
import 'package:flutter/material.dart';
import 'package:demna/main.dart';
import '../applocal.dart';
import '../login.dart';

class appbarfix extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int i;
  final int nb;
  final int idnb;
  final int init;

  const appbarfix({
    Key? key,
    required this.title,
    required this.i,
    required this.nb,
    required this.idnb,
    required this.init,
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
            iconSize: con != 0 ? 50.0 : 100.0,
            icon: con != 0
                ? Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 35,
                      ),
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: i == 0
                              ? Text('')
                              : Text(
                                  "${i}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Text("${getLang(context, "Login")}",
                          style: "${getLang(context, "Login")}" == 'Login'
                              ? TextStyle(fontSize: 25)
                              : TextStyle(fontSize: 10)),
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
                    API.notmod(idnb, nb, init);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => raport()));
                  }),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
