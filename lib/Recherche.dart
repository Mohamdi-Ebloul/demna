import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _bloodType = "A+";
  String _location = "";
  List _donors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rechercher un donneur"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            DropdownButton(
              value: _bloodType,
              items: [
                DropdownMenuItem(
                  child: Text("A+"),
                  value: "A+",
                ),
                DropdownMenuItem(
                  child: Text("B+"),
                  value: "B+",
                ),
                // Ajouter les autres options de groupe sanguin ici
              ],
              onChanged: (value) {
                setState(() {
                  _bloodType = value!;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Localisation",
              ),
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
            ),
            ElevatedButton(
              child: Text("Rechercher"),
              onPressed: () async {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _donors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_donors[index]["name"]),
                    subtitle: Text(_donors[index]["bloodType"]),
                    onTap: () {
                      // Naviguer vers la page de détails du donneur
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
