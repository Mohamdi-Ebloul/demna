import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';
import '../fix/appbarfix.dart';
import '../fix/drawerfix.dart';
import '../fix/navigation.dart';

class PharmacyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfix(
        title: 'Liste des Pharmacies',
      ),
      drawer: drawerfix(),
      bottomNavigationBar: navigation(),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ClinicItem(
            name: "Pharmacy $index",
            phone: "555-555-${index + 100}",
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
  final String phone;
  final String location;
  final String status;

  ClinicItem({
    required this.name,
    required this.phone,
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
            children: [
              Text(phone),
            ],
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
