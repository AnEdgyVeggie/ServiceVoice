import 'package:flutter/material.dart';

class User {

  static int globalID = 0;
  late int id = globalID;
  late String username;
  late String firstName;
  late String? lastName;
  late String email;
  late String password;
  Image? profilePicture;


  User({id, required username, required firstName, required lastName, required email, required password}) {
    this.username = username;
    this.firstName = firstName;
    this.lastName = lastName!;
    this.email = email;
    this.password = password;
    globalID++;
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    username: json['username'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'password': password,
  };

  @override
  String toString() {
    return 'id: ${id} \nusername: ${username} \nname: ${firstName} ${lastName} \nemail: ${email}';
  }
}