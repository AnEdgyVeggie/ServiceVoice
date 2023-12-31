import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// classes
import 'package:service_voice/classes/user.dart';

// pages 
import 'components/home.dart';
import 'components/login.dart';
import 'components/register.dart';
import 'components/create-post.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ServiceVoice());

}


class ServiceVoice extends StatelessWidget {

static User user = User(userid: '', username: '', firstName: '',
                       lastName: '', email: '', password: '', 
                       phoneNumber: ""
                       );

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
        '/':(context) =>  Homepage(loggedInAs: user,),
        '/create-post':(context) =>  CreatePost(loggedInAs: user,)
      }
    );
  }

static void setUser(User newUser) {
  user = newUser;
}

}
  

