import 'dart:convert';

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    //required this.v,
  });

  String id;
  String firstName;
  String lastName;
  String avatar;
  //int v;

  String get name {
    return '${this.firstName} ${this.lastName}';
  }

  String get initials {
    return '${this.firstName.substring(1, 1)}${this.lastName.substring(1, 1)}';
  }

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatar: json["avatar"],
        //v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
        //"__v": v,
      };
}
