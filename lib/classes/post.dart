import 'package:flutter/material.dart';


class Post extends StatefulWidget{
  final String author, email, body;
  final List<String> comments = <String>[];
  final int likes = 0;

  Post({  required this.author, required this.email, required this.body, super.key, }) ;

  @override
  State<Post> createState() => _PostState();

  void addComment(String comment) {
    comments.add(comment);
  }

}

class _PostState extends State<Post> {


@override
Widget build(BuildContext context) {
  return 
  Card(
    margin: const EdgeInsets.all(20),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(widget.author,
            style: const TextStyle(
              color: Colors.red
            ),
          ),
          ),
          Text(widget.body,   
          ),
        ]
      )
    )
  );
}

}

