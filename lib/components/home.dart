import 'package:flutter/material.dart';
import '/constants/colors.dart';

class Homepage extends StatefulWidget {
    const Homepage ({  super.key, });


@override
State<Homepage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<Homepage> {

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
    body: const SafeArea(
      child: Column(
        children: <Widget>[

        ],
        )
      ),
  );
}
}