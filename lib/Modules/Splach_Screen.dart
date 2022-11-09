import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notesapp/Modules/AddNottes.dart';

class Splach extends StatefulWidget {
  static const String routename="splach";

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),Nav);
  }
  void Nav(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AddNotes()), (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/note.png')),
            SizedBox(
              height: 10,
            ),
            Text(
              'My Notes',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.blue
                  ,fontSize: 40
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
