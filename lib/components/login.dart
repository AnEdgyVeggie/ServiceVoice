import 'package:flutter/material.dart';
import 'package:service_voice/constants/colors.dart';
import 'package:service_voice/database/database_handler.dart';
import 'package:service_voice/classes/user.dart';

import '../constants/fonts.dart';

class Login extends StatefulWidget {
  const Login ({ super.key });

  @override
  State <Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  
  // set Text Editing controllers for the log-in flow
  TextEditingController 
  userControl = TextEditingController(),
  passControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 50), 
        
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[

              // EMAIL --------------------------
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text('Username',
                    style: formLabel
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.zero,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: userControl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your email.';
                        } return null;
                      },
                    ),
                  ),
                ],
              ),

              // PASSWORD -----------------------
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text('Password',
                        style: formLabel 
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: passControl,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } return null;
                      },
                    ),
                  ),
                ],
              ),


            // SUBMIT ---------------------------------
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {

                      List<User>? users = await DatabaseHandler.getAllUsers();
                      if (users == null) return;

                      for (int i = 0; i < users.length; i++) {
                        if (userControl.text == users[i].username && passControl.text == users[i].password) {
                          moveToHome();
                          return;
                        } 
                        invalidInfoError();
                      
                      }
                      // Navigator.pushReplacementNamed(context, '/');
                    } else {
                      enterInfoError();
                    }
                  },
                  child: const Text('Submit'),
                  )
                )
              ),
               Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: FilledButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(kLbackgroundColor),
                      ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Not Registered? Click Here!'),
                  ),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void moveToHome() {
    Navigator.pushReplacementNamed(context, '/');
  }

  void invalidInfoError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('invalid username or password')));
  }

  void enterInfoError() {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter your username and password'))
    );
  }
}