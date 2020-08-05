import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:FutureChat/rounded_button.dart';
import 'package:FutureChat/constants.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _save=false;
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _save,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email=value;
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kInputContainerDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password=value;
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: kInputContainerDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(t: 'Register',c: Colors.blue,
                  onPressed:() async{
                setState(() {
                  _save=true;
                });
                    try{
                      final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if (newUser!=null){Navigator.pushNamed(context, ChatScreen.id);}
                      setState(() {
                        _save = false;
                      });
                    }
                    catch(e){print(e);}
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
