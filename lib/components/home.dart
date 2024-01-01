import 'package:flutter/material.dart';
import 'package:service_voice/constants/fonts.dart';
import 'package:service_voice/database/database_handler.dart';


// DATABASE
// import '/database/database_handler.dart';

// CLASSES =========================
import '/classes/user.dart';
import '/classes/post.dart';

// COMPONENTS
import '/components/bottom-nav-bar.dart';
import '/components/post_display.dart';

// // CONSTANTS =======================
// import '/constants/colors.dart';


class Homepage extends StatefulWidget {

final User loggedInAs;
late List<Post> posts;


Homepage ({  super.key, required this.loggedInAs, });

@override
State<Homepage> createState() => _MyHomePageState();

setPosts() async {
  posts = await DatabaseHandler.getPostsForDisplay(loggedInAs.userid!);
}

}



class _MyHomePageState extends State<Homepage> {

@override 
Widget build(BuildContext context)  {

widget.setPosts();

int postLimit = 10;
List<Post> posts = [];

  return Scaffold(
    appBar: AppBar(
      // backgroundColor: kappBarColor,

      title: const Text('Service Voice'),

      titleTextStyle: appBartitle
    ),
    body:   SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(widget.loggedInAs.username,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.zero,
            child:  Text("This is what's going on around you.",
            textAlign: TextAlign.center,),
            ),
          PostDisplay(post: widget.posts[0])
        ],
        )
      ),

      // BOTTOM NAV ============================
     bottomNavigationBar: BottomNavBar(
        
      ),
  );
  }



}