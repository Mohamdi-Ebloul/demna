import 'package:flutter/material.dart';

class HopitauxListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Hopitaux"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ClinicItem(
            name: "Hopitaux $index",
            location: "Ville $index",
            status: index % 2 == 0 ? "Ouverte" : "Fermée",
          );
        },
      ),
    );
  }
}

class ClinicItem extends StatelessWidget {
  final String name;
  final String location;
  final String status;

  ClinicItem({
    required this.name,
    required this.location,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 192, 223, 238),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'Images/heart.png',
                height: 130.0,
                width: 130,
              )
            ],
          ),
          Column(
            children: [Text("info")],
          ),
          Column(
            children: [
              Text(status),
            ],
          ),
          Column(
            children: [
              Text(location),
            ],
          )
        ],
      ),
    );
  }
}
