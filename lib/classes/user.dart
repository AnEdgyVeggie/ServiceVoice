import 'package:flutter/material.dart';

class User {

  String? userid;
  late String email;
  late String firstName;
  List<int> friends = [];
  late String? lastName;
  late String password;
  late String? phoneNumber;
  List<int> posts = [];
  Image? profilePicture;
  late String username;


  User({ required userid, required this.username, required this.firstName, 
  required this.lastName, required this.email, 
  required this.phoneNumber, required this.password, });

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
    'friends': friends,
    'posts': posts
  };

  @override
  String toString() {
    return  "USER ID: $userid \n"
            "username: $username \n"
            "name: $firstName $lastName \n"
            "email: $email\n"
            "password: $password\n"
            "friends: ${friends.length}\n"
            "posts: ${posts.length}\n";
  }

  void setID(newId) {
    userid = newId;
  }

}