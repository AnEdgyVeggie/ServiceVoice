import 'package:flutter/material.dart';
import '../constants/forms.dart';
import '../constants/regex.dart';


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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Register'
          )
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child:  ListView(
           children: <Widget>[

            // FIRST NAME =============================
            Padding(
              padding:const EdgeInsets.only(top: 40, bottom: 40),
              child: Column(
                children: <Widget> [
                  const Text('First Name',
                  style: formLabel
                  ),
                  TextFormField(
                    controller: fNameControl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your first name";
                      }
                      if (namesRegExp.hasMatch(value)) {
                        return "first name works!";
                      }
                      return 'Please enter a valid name (no numbers or special \ncharacters)';
                    },
                  )
                ],
              ),
            ),

            // LAST NAME ==============================
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: <Widget>[
                  const Text('Last Name',
                  style: formLabel,
                  ),
                  TextFormField(
                    controller: lNameControl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your last name";
                      }
                      if (namesRegExp.hasMatch(value)) {
                        return "Last name works!";
                      }
                      return 'Please enter a valid name (no numbers or special \ncharacters)';
                    },
                  )
                ],)
              ),

            // EMAIL ====================================
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: <Widget>[
                    const Text('Email', 
                    style: formLabel,
                    ),
                    TextFormField(
                      controller: emailControl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email address";
                        } else if (emailRegExp.hasMatch(value)) {
                          return 'Email works!';
                        }
                        return 'Please enter a valid email address';
                      },
                    )
                  ],
                )
              ),

            // PASSWORD ================================
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: <Widget>[
                  const Text('Password',
                  style: formLabel,
                  ),
                  TextFormField(
                    controller: passControl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      }

                      bool lowercase = false, uppercase = false, number = false, symbol = false;

                      for (int i = 0; i < value.length; i++ ) {
                        if (numRegExp.hasMatch(value)) {
                          number = true;
                        }
                        if (lowerExp.hasMatch(value)) {
                          lowercase = true;
                        }
                        if (upperExp.hasMatch(value)) {
                          uppercase = true;
                        }
                        if (specialChar.hasMatch(value)) {
                          symbol = true;
                        }
                        if (lowercase == true && uppercase == true && number == true && symbol == true && value.length > 5) {
                          return 'Password works';
                        }
                      }
                      return 'Invalid password. Passwords must longer than 5 \ncharacters contain a lowercase, uppercase, \nnumber and special character';
                    },
                  )
                ],
              ),
            ),


              Center(
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      return;
                    }
                    return;
                  },)
              ),
           ]
          ),
        )
      ),
    );
  }
}
