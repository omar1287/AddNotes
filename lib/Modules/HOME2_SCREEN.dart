import 'package:flutter/material.dart';
import 'package:notesapp/Modules/AddNottes.dart';
import 'package:notesapp/Modules/Edit_Screen.dart';
import 'package:notesapp/SQFlite.dart';

class Home2 extends StatefulWidget {
  static const String routename = 'Home2';

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List note = [];

  SQFlite sqFlite = SQFlite();

  Future readdb1() async {
    List<Map> response = await sqFlite.Selectdb("SELECT * FROM NOTES");
    note.addAll(response);
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    readdb1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNotes.routename);
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(' My Note is : ${note[index]['notes']}'),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('My Color is : ${note[index]['color']}'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('My title is : ${note[index]['title']}')
                    ],
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            int response = await sqFlite.deletedb(
                                "DELETE FROM NOTES WHERE id=${note[index]['id']}");
                            if (response > 0) {
                              note.removeWhere((element) =>
                                  element['id'] == note[index]['id']);
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.deepOrange,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Edit(
                                  note1:note[index]['notes'] ,
                                  color1:note[index]['color'] ,
                                  title1: note[index]['title'],
                                  id: note[index]['id'],


                                )));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
              );
            },
            itemCount: note.length,
          )
        ],
      ),
    );
  }
}
