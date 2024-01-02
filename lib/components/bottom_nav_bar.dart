import 'package:flutter/material.dart';
// import 'package:service_voice/constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  final int usedIndex;


  BottomNavBar({ super.key, required this.usedIndex });

  @override
  State<BottomNavBar>  createState() => _BottomNavBarState();

}

class _BottomNavBarState extends State<BottomNavBar> {

@override
Widget build(BuildContext context) {
  return BottomNavigationBar(

    selectedItemColor: Colors.white,
    selectedLabelStyle: const TextStyle(
      color: Colors.white
    ),
    unselectedItemColor: Colors.grey,
    unselectedLabelStyle: const TextStyle(
      color: Colors.grey
    ),

      currentIndex: widget.usedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
               Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              break;
            case 1:
            // TO DO: ADD PROFILE
              return;
            case 2:
               Navigator.pushNamedAndRemoveUntil(context, '/create-post', (route) => false);
              break;
            case 3:
              Navigator.popAndPushNamed(context, '/login');
          }
        },
        enableFeedback: true,
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
          ),
          
          BottomNavigationBarItem(icon: Icon(
            Icons.message_rounded
            ),
          label: 'Post'
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.arrow_outward
            ),
            label: 'Log out'
          ),
        ]
      );
  }
}