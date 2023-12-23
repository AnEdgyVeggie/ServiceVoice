import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register ({ super.key });

  @override 
  State<Register> createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
final _formKey = GlobalKey<FormState>();

// Set the text editing controllers for the register flow
TextEditingController
emailControl = TextEditingController(),
fNameControl = TextEditingController(),
lNameControl = TextEditingController(),
passControl = TextEditingController(),
confirmPassControl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register'
          )
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child:  Column(
           children: <Widget>[
            Padding(
              padding: EdgeInsets.zero,
              child: Column(
                children: <Widget> [
                  const Text('First Name'),
                  TextFormField(
                    controller: fNameControl,
                  )
                ],
              ),
              )
           ]
          ),
        )
      ),
    );
  }
}