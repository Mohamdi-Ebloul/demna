class Donorflutter {
  var id;
  String Nom;
  String mobile;
  String address;
  String bloodgroup;
  String date_naissance;
  String password;
  String idonor;
  Donorflutter(
      {this.id,
      required this.Nom,
      required this.mobile,
      required this.address,
      required this.bloodgroup,
      required this.date_naissance,
      required this.password,
      required this.idonor});
  factory Donorflutter.fromJson(Map<String, dynamic> author) => Donorflutter(
      id: author['id'],
      Nom: author['Nom'],
      mobile: author['mobile'],
      address: author['address'],
      bloodgroup: author['bloodgroup'],
      date_naissance: author['date_naissance'],
      password: author['password'],
      idonor: author['idonor']);
}

class dataf {
  final String Nom;
  final String mobile;
  final String date_naissance;
  final String bloodgroup;
  late final String address;
  final String status;
  final String date;
  final String id;

  dataf(this.id, this.Nom, this.mobile, this.date_naissance, this.bloodgroup,
      this.address, this.status, this.date);
}
