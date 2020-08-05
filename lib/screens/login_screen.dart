import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FutureChat/rounded_button.dart';
import 'package:FutureChat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
  static const String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _saving = false;
  String email;
  String password;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag:'logo',
                  child: Container(
                    height: 300.0,
                    child: Image.asset('images/logo.png'),
                  ),
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
              RoundedButton(t: 'Login',c: Colors.lightBlueAccent,
                onPressed:() async{
                  setState(() {
                    _saving = true;
                  });
                try{
                 final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                 if(user!=null){Navigator.pushNamed(context,ChatScreen.id );}
                 setState(() {
                   _saving = false;
                 });
                }catch(e){print(e);}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


