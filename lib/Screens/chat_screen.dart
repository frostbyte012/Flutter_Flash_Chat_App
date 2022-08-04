import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChatScreen extends StatefulWidget {

  static const String id='chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _auth=FirebaseAuth.instance;

  final _firestore = FirebaseFirestore.instance;

  String message ="";

  void getUser() async{

    User? user = await _auth.currentUser;
    if(user!=null)
      {
        print(user.uid);
      }
  }

  @override
  void initState()
  {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async{
                //Implement logout functionality

                await _auth.signOut().whenComplete(() => Navigator.pop(context));


              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        setState((){
                          message=value;
                        });

                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: (){
                      //Implement send functionality.

                      _firestore.collection('message').add({
                        "text": message,
                        "sender": _auth.currentUser?.email
                      }).whenComplete(() => print("Sent Message!"));

                    },
                    child: Icon(Icons.send),
                    // child: Text(
                    //   'Send',
                    //   style: kSendButtonTextStyle,
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}