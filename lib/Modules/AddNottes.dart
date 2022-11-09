import 'package:flutter/material.dart';
import 'package:notesapp/Modules/HOME2_SCREEN.dart';
import 'package:notesapp/SQFlite.dart';

class AddNotes extends StatefulWidget {
  static const String routename = 'Add';

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  SQFlite sqFlite = SQFlite();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              controller: note,
              onTap: () {},
              decoration: InputDecoration(
                hintText: 'Notes',
              ),
            ),
            TextFormField(
              controller: color,

              decoration: InputDecoration(
                hintText: 'color',
              ),
            ),
            TextFormField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'title',
              ),
            ),
            ElevatedButton(onPressed: () async {
              int response = await sqFlite.insertb(
                  "INSERT INTO NOTES ('notes','color','title')VALUES('${note.text}','${color.text}','${title.text}')");
              if(response>0){
                Navigator.pushNamed(context, Home2.routename);
                setState(() {

                });
              }

            }, child: Text('Sign'))
          ],
        ),
      ),
    );
  }
}
