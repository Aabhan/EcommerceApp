// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final String? userId;
  final String? email;
  final String? fullName;
  final String? role;
  final String? phoneNumber;
  final String? userLocation;

  User({
    this.userId,
    this.email,
    this.fullName,
    this.role,
    this.phoneNumber,
    this.userLocation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        email: json["email"],
        fullName: json["full_name"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        userLocation: json["user_location"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "full_name": fullName,
        "role": role,
        "phone_number": phoneNumber,
        "user_location": userLocation,
      };
}
