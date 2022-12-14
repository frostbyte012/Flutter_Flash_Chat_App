import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Screens/login_screen.dart';
import 'package:flutter_chat_app/Screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_chat_app/Components/primary_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  void navigationLogin()
  {
    Navigator.pushNamed(context, LoginScreen.id);
  }

  void navigationRegistration()
  {
    Navigator.pushNamed(context, RegistrationScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),

                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                    totalRepeatCount: 100,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 48.0,
            ),

            PrimaryButton(fun: navigationLogin, colour: Colors.lightBlueAccent, text: 'Log in'),

            PrimaryButton(fun: navigationRegistration, colour: Colors.blueAccent, text: 'Register'),

          ],
        ),
      ),
    );
  }
}