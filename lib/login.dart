import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:demna/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demna/pages/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailcontroller = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void checklogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = await pref.getString("login");
    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ProfilePage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 199, 13, 0),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 199, 13, 0),
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
        ],
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.password)),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  login(emailcontroller.text, passwordController.text);
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
                  'login ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  login(String Nom, String password) async {
    if (passwordController.text.isNotEmpty && emailcontroller.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse('https://banqsang.pythonanywhere.com/login/'),
        body: {'Nom': Nom, 'password': password},
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Token: ${body['token']} ")));
        pageRoue(
            body['token'],
            body['mobile'],
            body['date_naissance'],
            body['bloodgroup'],
            body['address'],
            body['status'],
            body['lastdonat']);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blanck Value found")));
    }
  }

  void pageRoue(
      String token,
      String mobile,
      String date_naissance,
      String bloodgroup,
      String address,
      String status,
      String lastdonat) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    await pref.setString("mobile", mobile);
    await pref.setString("date_naissance", date_naissance);
    await pref.setString("bloodgroup", bloodgroup);
    await pref.setString("address", address);
    await pref.setString("status", status);
    await pref.setString("lastdonat", lastdonat);
    await pref.setInt("con", 1);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ProfilePage()),
        (route) => false);
  }
}
