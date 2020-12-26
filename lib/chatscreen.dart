import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class chatscreen extends StatefulWidget {
  @override
  _chatscreenState createState() => _chatscreenState();

}

class _chatscreenState extends State<chatscreen> {
  String uemail;
  String messageText;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  final _firestore=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
  final myController = TextEditingController();

  void getCurrentUser() {
    try{
      final User user =  _auth.currentUser;
      setState((){
        uemail = user.email;
      });
      if(uemail!=null){
        print("uemail: " + uemail);
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flash Chat'),
        ),
        body: SafeArea(
          child: Column(
            children: [

              StreamBuilder <QuerySnapshot>(
                stream: _firestore.collection('message').orderBy('Timestamp', descending: true).snapshots(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    final List<QueryDocumentSnapshot> messages = snapshot.data.docs;
                  List <Text> messagebuilder =[];
                  for(var message in messages){
                    final messagesender = message.data();


                    final messagewidget=Text('${messagesender['text']} from ${messagesender['senderid']}');
                     messagebuilder.add(messagewidget);
                  }
                    return Expanded(
                      child: ListView(
                        children: messagebuilder,
                      ),
                    );

                  }else{
                    return Container();
                  }


                }


              ),
              TextField(
                controller: myController,
                onChanged: (value){
                  messageText=value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your message',
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

              Flexible(
                child: NiceButton(
                  radius: 50.0,
                  padding: const EdgeInsets.all(5.0),
                  mini: true,
                  icon: Icons.subdirectory_arrow_right_rounded,
                  gradientColors: [secondColor, firstColor],
                  onPressed: () async{
                    _firestore.collection('message').add({'senderid':uemail,'text':messageText,'Timestamp': FieldValue.serverTimestamp(),});
                    myController.clear();
                                  //'Timestamp': FieldValue.serverTimestamp()
                  },
                ),
              )
            ],
          ),
        )
    );
  }

}
