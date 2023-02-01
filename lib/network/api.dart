import 'dart:convert';

import 'package:http/http.dart';
import 'package:demna/model/donorflutter.dart';

// class API {
//   static String _BASE_URL =
//       'https://banqsang.pythonanywhere.com/donor-listflutter';
//   static Future<Donorflutter> createAuthor(String Nom, String mobile,
//       String address, String bloodgroup, String age) async {
//     final Response response = await post(Uri.parse(_BASE_URL),
//         headers: <String, String>{
//           'Content-Type': 'application/json;charset=UTF-8'
//         },
//         body: jsonEncode(<String, String>{
//           "Nom": Nom,
//           "mobile": mobile,
//           "address": address,
//           "bloodgroup": bloodgroup,
//           "age": age
//         }));

//     //print(response.body);
//     return Donorflutter.fromJson(json.decode(response.body));
//   }
// }

class API {
  static createAuthor(int idk) async {
    final response = await put(
        Uri.parse('https://banqsang.pythonanywhere.com/update/${idk}/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({'activite': "active"}));
    if (response.statusCode == 200) {
      // Update successful
    } else {
      // Update failed
    }
  }
}
