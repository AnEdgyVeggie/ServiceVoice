import 'package:flutter/material.dart';

// CLASSES =========================
import '/classes/post.dart';


// CONSTANTS =======================
import '/constants/colors.dart';

class Homepage extends StatefulWidget {
    const Homepage ({  super.key, });


@override
State<Homepage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<Homepage> {

List<Post> posts = <Post>[
  Post(author: 'Ethan', email: 'ethan.ethan@ethan.com', body: 'Today, I made my first post on Service voice. Hopefully one day this application will be worth something'),
  Post(author: 'Avery', email: 'ava.sylvester@hotmail.com', body: 'My husband is the best person in the whole world'),
  Post(author: 'Vivian', email: 'v.seabrook@outlook.com', body: 'my dad is super cool')
];



@override 
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: kappBarColor,
      title: const Text('Service Voice'),
      centerTitle: true,
      titleTextStyle:const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26, 
        color: kLforegroundColor,
      ),
    ),
    body:  SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          posts[0],
          posts[1],
          posts[2]
        ],
        )
      ),
  );
}
}