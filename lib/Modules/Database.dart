import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Students.dart';

class DataBase {
  static DataBase instance = DataBase._();
  DataBase._();

  //Creation of DataBase
  Future<Database> CreadDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbpath = '${directory.path}Studentt.db';
    Database database = await openDatabase(
      dbpath,
      onCreate: (db, version) async {
        await db.execute(
            'Create TABLE Studentss(name TEXT,email TEXT,phone TEXT,course TEXT,fee INTEGER,id INTEGER PRIMARY KEY AUTOINCREMENT)');
      },
      version: 1,
    );
    return database;
  }

  //Funtion for Insertion Data in Database
  
  Future<int> Insert_Students(Students s) async {
    Database database = await instance.CreadDB();
    int insert = await database.insert('Studentss', s.tomap());
    return insert;
  }

  //Funtion to Get Data from Database

  Future<List<Students>> Get_Students() async {
    Database database = await instance.CreadDB();
    List<Students> StudentsList = [];
    List<Map<String, dynamic>> StudentsMap = await database.query('Studentss');
    for (var StudentsObject in StudentsMap) {
      Students s = Students.FromMap(StudentsObject);
      StudentsList.add(s);
    }
    await Future.delayed(const Duration(seconds: 1));
    return StudentsList;
  }

  //Funtion to Delete Data from Database

  Future<int> Delete_Students(int id) async {
    Database database = await instance.CreadDB();
    int delete =
        await database.delete('Studentss', where: 'id=?', whereArgs: [id]);
    return delete;
  }

  //Funtion to Update Data in Database

  Future<int> Update_Student(Students students) async {
    Database database = await instance.CreadDB();
    int update = await database.update('Studentss', students.tomap(),
        where: 'id=?', whereArgs: [students.id]);
    return update;
  }
}
