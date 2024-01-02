import 'package:flutter/material.dart';
import 'package:service_voice/constants/fonts.dart';
import 'package:service_voice/database/database_handler.dart';


// DATABASE
// import '/database/database_handler.dart';

// CLASSES =========================
import '/classes/user.dart';
import '/classes/post.dart';

// COMPONENTS
import 'bottom_nav_bar.dart';
import '/components/post_display.dart';

// // CONSTANTS =======================
// import '/constants/colors.dart';


class Homepage extends StatefulWidget {

  final User loggedInAs;

  const Homepage ({  super.key, required this.loggedInAs, });

  @override
  State<Homepage> createState() => _MyHomePageState();

}



class _MyHomePageState extends State<Homepage> {

@override 
Widget build(BuildContext context)  {

final Future<List<Post>>posts = DatabaseHandler.getPostsForDisplay(widget.loggedInAs.userid);

// int postLimit = 10;
// List<Post> posts = [];
  return Scaffold(
    appBar: AppBar(
      // backgroundColor: kappBarColor,

      title: const Text('Service Voice'),

      titleTextStyle: appBartitle
    ),
    body:   SafeArea(
      child: ListView(
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









          FutureBuilder(future: posts, 
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            List<Widget> children;

            if (snapshot.hasData && widget.loggedInAs.userid != null) {
              int dataLength = snapshot.data!.length;
                  children = <Widget> [
                    
                    for (int i = 0; i < dataLength; i++)
                    PostDisplay(post: snapshot.data![i], username: widget.loggedInAs.username,)
                  ];

            } else if (snapshot.hasError) {
              print('ERROR: ${snapshot.error}');
              children = <Widget>[
               const Text("An Error has occurred",
                style:  TextStyle(color: Colors.red),
                ),
              ];
            } else {
              children = const <Widget> [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator()
                )
              ];
            }
            return  Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: children,
                )
              )
            );

          }
          )









        ],
        )
      ),

      // BOTTOM NAV ============================
     bottomNavigationBar:  BottomNavBar(
        usedIndex: 0,
      ),
  );
  }



}