import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'models/note.dart';

class DatabaseHandler {
  DatabaseHandler._();

  static DatabaseHandler _dbHandler = DatabaseHandler._();
  static late Database _db;

  String _noteTable = 'NOTES';
  String _noteId = 'id';
  String _noteTitle = 'title';
  String _noteDescription = 'description';

  Future<Database> get db async {
    if (db != null) {
      return _db;
    }
    _db = await initializeDB();
    return db;
  }

  initializeDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "Notes_Reminders.db";

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $_noteTable($_noteId INTEGER PRIMARY KEY AUTOINCREMENT, $_noteDescription TEXT)');
    });
  }

  // Get all notes from the database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.db;

    //var result = await db.rawQuery('SELECT * FROM $reminderTable order by $colPriority ASC');
    var result = await db.query(_noteTable, orderBy: '$_noteId ASC');

    return result;
  }

  // Insert a note into the database
  Future<int> insertNote(Note note) async {
    Database db = await this.db;

    var result = await db.insert(_noteTable, note.toMap());

    return result;
  }

  // Update a note in the database
  Future<int> updateNote(Note note) async {
    var db = await this.db;

    var result = await db.update(_noteTable, note.toMap(),
        where: '$_noteId = ?', whereArgs: [note.id]);

    return result;
  }

  // Delete a note from the database
  Future<int> deleteNote(int id) async {
    var db = await this.db;

    int result =
        await db.rawDelete('DELETE FROM $_noteTable WHERE $_noteId = $id');

    return result;
  }

  // Count the number of reminders from the database
  Future<int> getCount() async {
    Database db = await this.db;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $_noteTable');
    int? result = Sqflite.firstIntValue(x);

    return result!;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // Get 'Map List' from db

    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<Note> noteList = [];

    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note(noteMapList[i][_noteId], noteMapList[i][_noteTitle],
          noteMapList[i][_noteDescription]));
    }

    return noteList;
  }
}
