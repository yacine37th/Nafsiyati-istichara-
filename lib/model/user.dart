class UserModel {
  late String? uID;
  late String? email;
  late String? name;
  // late String? wilaya;
  // late String? commune;
  late bool? nafsiya;
  late bool? zawajiya;
  late bool? tarbiya;
  late bool? ilaj;
  UserModel({
    required this.uID,
    required this.email,
    required this.name,
    // required this.wilaya,
    // required this.commune,
    this.nafsiya,
    this.tarbiya,
    this.zawajiya,
    this.ilaj,
  });
}
