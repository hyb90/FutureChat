import 'package:flutter/material.dart';
import 'package:FutureChat/screens/login_screen.dart';
import 'package:FutureChat/screens/chat_screen.dart';
import 'package:FutureChat/screens/registration_screen.dart';
import 'package:FutureChat/screens/welcome_screen.dart';
void main() {
  runApp(FutureChat());
}

class FutureChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:WelcomeScreen.id,
      routes:{
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
      } ,
    );
  }
}
