import 'package:flutter/material.dart';

// DATABASE
// import '/database/database_handler.dart';

// CLASSES =========================
import '/classes/post.dart';

// // CONSTANTS =======================
// import '/constants/colors.dart';


class Homepage extends StatefulWidget {
    const Homepage ({  super.key, });



@override
State<Homepage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<Homepage> {

List<Post> posts = <Post>[
  Post(author: 'Ethan', email: 'ethan.ethan@ethan.com', body: 'Today, I made my first post on Service voice. Hopefully one day this application will be worth something'),

];

@override 
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      // backgroundColor: kappBarColor,
      title: const Text('Service Voice'),
      centerTitle: true,
      titleTextStyle:const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26, 
        // color: kLforegroundColor,
      ),
    ),
    body:  SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          posts[0],
        ],
        )
      ),


      // BOTTOM NAV ============================
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home
              ),
            label: 'Home' 
            ),
          BottomNavigationBarItem(icon: Icon(
            Icons.person,
            
          ),
          label: 'Profile'
          )
        ]
      ),
  );
}
}