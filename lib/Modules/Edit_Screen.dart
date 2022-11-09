import 'package:flutter/material.dart';
import 'package:notesapp/HOME_SCREEN.dart';
import 'package:notesapp/Modules/HOME2_SCREEN.dart';
import 'package:notesapp/SQFlite.dart';

class Edit extends StatefulWidget {
  final note1;
  final color1;
  final title1;
  final id;

  const Edit({Key? key, this.note1, this.color1, this.title1, this.id})
      : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  List note2 = [];

  Future readdb1() async {
    List<Map> response = await sqFlite.Selectdb("SELECT * FROM NOTES");
    note2.addAll(response);
    if (this.mounted) {
      setState(() {});
    }
  }

  SQFlite sqFlite = SQFlite();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    super.initState();
    note.text = widget.note1;
    color.text = widget.color1;
    title.text = widget.title1;
  }

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
            ElevatedButton(
                onPressed: () async {
                  int res = await sqFlite.update(
                      'UPDATE  "NOTES" SET notes="${note.text}",color="${color.text}",title="${title.text}" WHERE id ="${widget.id}"');
                  if(res>0){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home2()));
                  }
                },
                child: Text('Edit'))
          ],
        ),
      ),
    );
  }
}
