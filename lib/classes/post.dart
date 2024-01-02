import 'package:cloud_firestore/cloud_firestore.dart';

class Post {

  late String id;
  late String userID;
  late String username;
  late String body;
  late int likes;
  late List<dynamic> comments;
  late Timestamp postDate;

  Post ({ 
    required this.id, 
    required this.userID, 
    required this.username,
    required this.body,
    required this.likes, 
    required this.comments,
    required this.postDate
  });


  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userID,
    'username': username,
    'body': body,
    'likes': likes,
    'comments': [],
    'post_date': Timestamp.now()
  };

  @override
  String toString() {
    return 'ID: ${id.toString()} \nUSER: $userID \n BODY: $body \nLIKES: ${likes.toString()}';
  }

  setId(String newId) {
    id = newId;
  }
}