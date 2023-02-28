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
      String nni,
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
              "nni": nni,
              "address": address,
              "bloodgroup": bloodgroup,
              "date_naissance": date_naissance,
              "password": password,
              "idonor": id,
            }));

    //print(response.body);
    return Donorflutter.fromJson(json.decode(response.body));
  }

  static ModifierTel(String idk, String mobile) async {
    final response = await put(
        Uri.parse('https://banqsang.pythonanywhere.com/modifier/$idk/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({'mobile': mobile}));
    if (response.statusCode == 200) {
      // Update successful
    } else {
      // Update failed
    }
  }

  static Modifieraddresse(String idk, String wilaya) async {
    final response = await put(
        Uri.parse('https://banqsang.pythonanywhere.com/modifier/$idk/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({'address': wilaya}));
    if (response.statusCode == 200) {
      // Update successful
    } else {
      // Update failed
    }
  }

  static Modifierpassword(String idk, String password) async {
    final response = await put(
        Uri.parse('https://banqsang.pythonanywhere.com/modifier/$idk/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({'password': password}));
    if (response.statusCode == 200) {
      // Update successful
    } else {
      // Update failed
    }
  }

  static Future<Notf> notmod(int id, int nb, int init) async {
    if (init == 0) {
      final response =
          await post(Uri.parse('https://banqsang.pythonanywhere.com/nbrajout/'),
              headers: {'Content-Type': 'application/json;charset=UTF-8'},
              body: jsonEncode({
                "nb": nb,
                "donor_id": id,
              }));
      return Notf.fromJson(json.decode(response.body));
    } else {
      final response = await put(
          Uri.parse('https://banqsang.pythonanywhere.com/nbrmod/$init/'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"nb": nb, "donor_id": id}));

      return Notf.fromJson(json.decode(response.body));
    }

    //print(response.body);
  }
}
