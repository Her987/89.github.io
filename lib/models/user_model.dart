class UserModel {
  String firstName;
  String lastName;
  String register;
  String address;
  String gender;
  String imagePath;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.register,
    required this.address,
    required this.gender,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "register": register,
        "address": address,
        "gender": gender,
        "imagePath": imagePath,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        register: json["register"],
        address: json["address"],
        gender: json["gender"],
        imagePath: json["imagePath"],
      );
}
