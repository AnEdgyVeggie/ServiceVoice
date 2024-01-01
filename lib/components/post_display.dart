import 'package:flutter/material.dart';
import 'package:service_voice/database/database_handler.dart';
import '/classes/post.dart';
import '/classes/user.dart';

class PostDisplay extends StatefulWidget {

  late Post post;
  late String username;

  PostDisplay({ super.key, required this.post });

  @override
  State<PostDisplay> createState() => _PostDisplayState();

   getPosterUsername() async {
    User? user = await DatabaseHandler.getSingleUser(post.userID);
    if (user == null) { return; }
    username = user.username;
  }
}

class _PostDisplayState extends State<PostDisplay> {
  

  @override
  Widget build(BuildContext context) {
    widget.getPosterUsername();

    return 
     Card(
      child: Column(
        children: <Widget>[
          Text(
            widget.username
          ),
          Text(widget.post.body)
        ],
      )
    );
  }



}