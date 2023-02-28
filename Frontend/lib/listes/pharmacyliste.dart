import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../applocal.dart';
import '../fix/appbarfix.dart';
import '../fix/drawerfix.dart';
import '../fix/navigation.dart';
import '../main.dart';

class PharmacyListPage extends StatefulWidget {
  @override
  _PharmacyListPageState createState() => _PharmacyListPageState();
}

class _PharmacyListPageState extends State<PharmacyListPage> {
  int nbr = 0;
  int idnb = 0;

  List postsnbr = [];

  Future getnbr() async {
    var url = 'https://banqsang.pythonanywhere.com/rapor/$id/';
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    setState(() {
      postsnbr.addAll(responsebody);
      nbr = postsnbr.length;
    });
  }

  int nbrn = 0;
  int init = 0;
  List posts2 = [];

  Future getnbr2() async {
    var url = 'https://banqsang.pythonanywhere.com/nbr/$id/';
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);

    setState(() {
      nbrn = int.parse(responsebody['nb']);
      init = responsebody['id'];
    });
  }

  void getcred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      con = pref.getInt("con")!;
      id = pref.getInt("id")!;
    });
  }

  late GoogleMapController _mapController;
  Set<Marker> _markers = {};

  final LatLng _initialPosition = const LatLng(18.127799, -15.859919);

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _filterMarkersByCity(String city) {
    setState(() {
      _markers = _markers.where((marker) {
        final address = marker.infoWindow.snippet;
        final cityStartIndex = address!.indexOf(city);
        return cityStartIndex != -1 && cityStartIndex < 10;
      }).toSet();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _filterMarkersByCity('Nouakchott');
    getnbr();
    getnbr2();
    getcred();
  }

  var mymarker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfix(
          title: '${getLang(context, "Pharmacies")}',
          i: nbr - nbrn,
          idnb: id,
          nb: nbr,
          init: init),
      drawer: drawerfix(),
      bottomNavigationBar: navigation(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController googleMapController) {
          setState(() {
            _filterMarkersByCity('Nouakchott');
            mymarker.add(
              Marker(
                markerId: MarkerId('1'),
                position: LatLng(30.0444, 31.2357),
              ),
            );
          });
        },
        markers: mymarker,
      ),
    );
  }
}
