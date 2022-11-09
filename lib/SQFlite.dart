import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQFlite {
  static Database? _db;
  Future<Database?>get db async{
    if(_db==null){
      Database _db=await intialdb();
      return _db;
    }
    return _db;
  }


  intialdb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'omar.db');
    Database data = await openDatabase(path,
        version: 13,
        onCreate: (Database db, int version) async{
          await db.execute('CREATE TABLE "NOTES"(id INTEGER PRIMARY KEY,notes TEXT NOT NULL,color TEXT,title TEXT)');
          print('created');
        },
        onUpgrade: (Database db,oldversion,upversion)async{
          await db.execute("ALTER TABLE NOTES ADD COLUMN 'Age' TEXT ");


          print("onUgprade");
        },

    );
    return data;
  }
  Selectdb(String sql)async{
    Database? mydb= await db as Database?;
    List<Map> read = await mydb!.rawQuery(sql) ;
    return read;
  }
  insertb(String sql)async{
    Database? mydb= await db as Database?;
    int read = (await mydb!.rawInsert(sql))  ;
    return read;
  }
  deletedb(String sql)async{
    Database? mydb= await db as Database?;
    int read = (await mydb!.rawDelete(sql))  ;
    return read;
  }
 update(String sql)async{
    Database? mydb= await db as Database?;
    int read = (await mydb!.rawUpdate(sql))  ;
    return read;
  }
  deletedball()async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'omar.db');
    await deleteDatabase(path);

  }
  Selectdb1(String sql)async{
    Database? mydb= await db as Database?;
    List<Map> read = await mydb!.rawQuery(sql) ;
    return read;
  }
  insertb1(String table ,Map<String,dynamic> values)async{
    Database? mydb= await db as Database?;
    int read = (await mydb!.insert(table, values))  ;
    return read;
  }
  deletedb1(String table,String mywhere)async{
    Database? mydb= await db as Database?;
    int read = (await mydb!.delete(table,where:mywhere ))  ;
    return read;
  }
  update1(String table,Map<String,dynamic> values)async{
    Database? mydb= await db as Database?;
    int read = (await mydb!.update(table, values))  ;
    return read;
  }

}