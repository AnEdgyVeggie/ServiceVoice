import 'package:flutter/material.dart';
import '/classes/user.dart';
import '/components/bottom_nav_bar.dart';



class ProfilePage extends StatefulWidget {

  late final User loggedInAs;

  ProfilePage({ super.key, required this.loggedInAs });

  @override
  State<ProfilePage> createState() => _StateProfilePage();  
}

class _StateProfilePage extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page'
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // Image(image: )    PROFILE PICTURE
              ElevatedButton(onPressed: null, child: null),
              Text('${widget.loggedInAs.firstName} ${widget.loggedInAs.lastName}',
              style: const TextStyle(
                fontSize: 30
              ))
            ],)
        ],
        ),
        bottomNavigationBar: BottomNavBar(usedIndex: 1,),
    );
  }


}