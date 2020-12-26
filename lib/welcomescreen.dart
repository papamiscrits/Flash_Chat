import 'package:flash_chat2/chatscreen.dart';
import 'package:flash_chat2/registerscreen.dart';
import 'package:flash_chat2/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class welcomescreen extends StatelessWidget {
  @override
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Flash Chat'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Image.asset('images/logo.png',
              height: 250.0),
            ),
            Row(
              children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[

                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text('Welcome to Flash Chat',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0,
                        )),
                      ),
                       SizedBox(
                         height: 10.0,
                       ),
                          NiceButton(
                            radius: 40,
                            padding: const EdgeInsets.all(15),
                            text: "Signin",
                            icon: Icons.account_box,
                            gradientColors: [secondColor, firstColor],
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => signin()));
                            },
                          ),
                      SizedBox(
                        height: 30.0,
                      ),
                          NiceButton(
                            radius: 40,
                            padding: const EdgeInsets.all(15),
                            text: "Register",
                            icon: Icons.account_box,
                            gradientColors: [secondColor, firstColor],
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                            },
                          ),
                          SizedBox(height: 10.0),
                          NiceButton(
                            radius: 40,
                            padding: const EdgeInsets.all(15),
                            text: "Chatscreen",
                            icon: Icons.account_box,
                            gradientColors: [secondColor, firstColor],
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => chatscreen()));
                            },
                          )
                        ],
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
