import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Components/primary_button.dart';
import 'package:flutter_chat_app/Screens/chat_screen.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id='registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;

  String password="";
  String email="";
  bool progress_spinner=false;


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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color:Colors.black54),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color:Colors.black54),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;

                },
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
             PrimaryButton(fun: () async {
               // print(email);
               // print(password);

               //TODO



               try{
                 setState(() {
                   progress_spinner=true;
                 });
                 final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                 if(user!=null)
                   {
                     setState(() {
                       email="";
                       password="";
                     });
                     Navigator.pushNamed(context, ChatScreen.id);
                   }



               }
               catch(e)
               {
                 print(e);
               }

               setState(() {
                 progress_spinner=false;
               });


             }, colour: Colors.blueAccent, text: 'Register'),
            ],
          ),
        ),
      ),
    );
  }
}