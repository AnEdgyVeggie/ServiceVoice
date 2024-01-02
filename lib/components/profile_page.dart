import 'package:flutter/material.dart';
import '/classes/user.dart';



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
    Scaffold();
  }


}