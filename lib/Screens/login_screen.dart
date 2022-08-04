import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Components/primary_button.dart';
import 'package:flutter_chat_app/Screens/chat_screen.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {

  static const String id='login_screen';



  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email="";
  String password="";
  bool progress_spinner=false;

  final _auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: progress_spinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
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
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  setState(() {
                    email=value;
                  });
                },
                decoration:kInputDecoration.copyWith(
                    hintText:"Enter Your Email",
                    hintStyle: TextStyle(color: Colors.black54),
                ),

              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  setState(() {
                    password=value;
                  });
                },
                decoration: kInputDecoration.copyWith(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.black54),

                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              PrimaryButton(fun: () async{

                setState(() {
                  progress_spinner=true;
                });

                try{
                  final logIn = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(logIn!=null)
                    {
                      setState(() {
                        email="";
                        password="";
                      });
                      Navigator.pushNamed(context, ChatScreen.id).whenComplete(() => (){

                      });
                    }
                }
                catch(e)
                {
                  print(e);
                }

                setState(() {
                  progress_spinner=false;
                });

              }, colour: Colors.lightBlueAccent, text: 'Log in'),
            ],
          ),
        ),
      ),
    );
  }
}