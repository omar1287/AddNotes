
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/HOME_SCREEN.dart';
import 'package:notesapp/Modules/AddNottes.dart';
import 'package:notesapp/Modules/HOME2_SCREEN.dart';
import 'package:notesapp/Modules/Splach_Screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
     routes: {
       Home2.routename:(context)=>Home2(),
AddNotes.routename:(context)=>AddNotes(),
       Home.routename:(context)=>Home(),
       Splach.routename:(context)=>Splach()
     },
    initialRoute:Splach.routename,
    debugShowCheckedModeBanner: false,

   );
  }


}