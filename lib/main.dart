import 'package:flutter/material.dart';
import 'constants/colors.dart';

// pages 
import 'components/home.dart';
import 'components/login.dart';
import 'components/register.dart';

void main() {
  runApp(const ServiceVoice());
}

class ServiceVoice extends StatelessWidget {
  const ServiceVoice({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kLbackgroundColor
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/':(context) => Homepage()
      }
    );
  }
}
  

