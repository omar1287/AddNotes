
import 'package:flutter/material.dart';
import 'package:notesapp/SQFlite.dart';

class Home extends StatefulWidget {

static const String routename="home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SQFlite sq=SQFlite();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()async{
              var res=await sq.insertb("INSERT INTO NOTES('notes','color','title')VALUES('notes 1','red','asd')");
              print(res);
            }, child: Text('insert')),
            ElevatedButton(onPressed: ()async{
              List<Map> res1=await sq.Selectdb("SELECT * FROM 'NOTES'");
print(res1);
            }, child: Text('read')),
            ElevatedButton(onPressed: ()async{
           int  res1=await sq.deletedb("DELETE FROM 'NOTES' WHERE id=1");
              print(res1);
            }, child: Text('delete')),
            ElevatedButton(onPressed: ()async{
             int res1=await sq.update("UPDATE 'NOTES' SET 'notes'='notes+1' WHERE id=2");
              print(res1);
            }, child: Text('update')),
            ElevatedButton(onPressed: ()async{
              var res=await sq.insertb("INSERT INTO NOTES('notes')VALUES('notes 1') ('color')VALUES('red')");
              print(res);
            }, child: Text('upgrade'))

          ],
        ),
      ),
    );
  }
}
