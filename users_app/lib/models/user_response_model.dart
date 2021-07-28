import 'dart:convert';

import 'models.dart';

class UsersResponse {
  UsersResponse({
    required this.status,
    required this.msg,
    required this.results,
  });

  int status;
  String msg;
  Results results;

  factory UsersResponse.fromJson(String str) =>
      UsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        status: json["status"],
        msg: json["msg"],
        results: Results.fromMap(json["results"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "results": results.toMap(),
      };
}

class Results {
  Results({
    required this.users,
  });

  List<User> users;

  factory Results.fromJson(String str) => Results.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
      };
}
