import 'package:flash_chat2/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final _auth=FirebaseAuth.instance;
  String email;
  String password;


  @override

  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Chat'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset('images/logo.png',
                height: 150.0),
          ),
          TextField(
            onChanged: (value){
              email=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your email',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextField(
            onChanged: (value){
              password=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your password',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          NiceButton(
            radius: 40,
            padding: const EdgeInsets.all(15),
            text: "Register",
            icon: Icons.account_box,
            gradientColors: [secondColor, firstColor],
            onPressed: () async {
              try{
                final newuser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                if(newuser!=null){
                  Text('User Already Exists. Please login');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => chatscreen()));
                }
              }
              catch(e){
                print(e);
              }
            },
          )
        ],
      ),
    );
  }
}
