class Donorflutter {
  var id;
  String Nom;
  int mobile;
  String address;
  String bloodgroup;
  int age;
  Donorflutter(
      {this.id,
      required this.Nom,
      required this.mobile,
      required this.address,
      required this.bloodgroup,
      required this.age});
  factory Donorflutter.fromJson(Map<String, dynamic> author) => Donorflutter(
      id: author['id'],
      Nom: author['Nom'],
      mobile: author['mobile'],
      address: author['address'],
      bloodgroup: author['bloodgroup'],
      age: author['age']);
}
