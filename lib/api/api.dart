import 'dart:convert';

import 'package:http/http.dart';
import 'package:demna/model/donorflutter.dart';

class API {
  static activedonor(int idk) async {
    final response = await put(
        Uri.parse("https://banqsang.pythonanywhere.com/update/$idk/"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({'activite': "active"}));
    if (response.statusCode == 200) {
      // Update successful
    } else {
      // Update failed
    }
  }

  static Modifier(String idk, String Nom, String mobile, String wilaya) async {
    final response = await put(
        Uri.parse('https://banqsang.pythonanywhere.com/modifier/$idk/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({'Nom': Nom, 'mobile': mobile, 'address': wilaya}));
    if (response.statusCode == 200) {
      // Update successful
    } else {
      // Update failed
    }
  }

  static Future<Donorflutter> Ajouter(
      String Nom,
      String mobile,
      String address,
      String bloodgroup,
      String date_naissance,
      String password,
      String id) async {
    final response =
        await post(Uri.parse('https://banqsang.pythonanywhere.com/ajouter/'),
            headers: {'Content-Type': 'application/json;charset=UTF-8'},
            body: jsonEncode({
              "Nom": Nom,
              "mobile": mobile,
              "address": address,
              "bloodgroup": bloodgroup,
              "date_naissance": date_naissance,
              "password": password,
              "idonor": id,
            }));

    //print(response.body);
    return Donorflutter.fromJson(json.decode(response.body));
  }
}
