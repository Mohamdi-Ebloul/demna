// import 'package:flutter/material.dart';
// import 'package:demna/network/api.dart';
// import 'package:demna/model/donorflutter.dart';

// class AddAuthor extends StatefulWidget {
//   @override
//   _AddAuthorState createState() => _AddAuthorState();
// }

// class _AddAuthorState extends State<AddAuthor> {
//   late String Nom;
//   late String mobile;
//   late String age;
//   late String bloodgroup;
//   late String address;
//   final key = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: key,
//       appBar: AppBar(
//         title: Text('New Author'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Enter Author name', labelText: 'Author Name'),
//                 onChanged: (value) {
//                   setState(() {
//                     Nom = value;
//                   });
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Enter Author name', labelText: 'Author Name'),
//                 onChanged: (value) {
//                   setState(() {
//                     mobile = value;
//                   });
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Enter Author name', labelText: 'Author Name'),
//                 onChanged: (value) {
//                   setState(() {
//                     address = value;
//                   });
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Enter Author name', labelText: 'Author Name'),
//                 onChanged: (value) {
//                   setState(() {
//                     bloodgroup = value;
//                   });
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Enter Author name', labelText: 'Author Name'),
//                 onChanged: (value) {
//                   setState(() {
//                     age = value;
//                   });
//                 },
//               ),
//               ElevatedButton(
//                 child: Text('Save'),
//                 onPressed: () {
//                   API.createAuthor(Nom, mobile, address, bloodgroup, age);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
