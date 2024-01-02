import 'package:flutter/material.dart';

class User {

  String? userid;
  late String email;
  late String firstName;
  late List<dynamic> friends;
  late String? lastName;
  late String password;
  late String? phoneNumber;
  late List<dynamic>? posts;
  Image? profilePicture;
  late String username;


  User({ required userid, required this.username, required this.firstName, 
  required this.lastName, required this.email, 
  required this.phoneNumber, required this.password, required this.friends, required this.posts});

  // factory User.fromJson(Map<String, dynamic> json) => User(
    
  //   username: json['username'],
  //   firstName: json['first_name'],
  //   lastName: json['last_name'],
  //   email: json['email'],
  //   password: json['password'],
  // );

  Map<String, dynamic> toJson() => {
    'username': username,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'password': password,
    'phone': phoneNumber,
    'friends': [],
    'posts': []
  };

  @override
  String toString() {
    return  "USER ID: $userid \n"
            "username: $username \n"
            "name: $firstName $lastName \n"
            "email: $email\n"
            "password: $password\n"
            "friends: ${friends.length}\n"
            "posts: ${posts!.length}\n";
  }

  void setID(newId) {
    userid = newId;
  }

}