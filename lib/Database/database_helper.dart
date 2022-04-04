import 'package:firstapp/Database/book_catalog.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as developer;
//import 'package:firstapp/Database/book_catalog.dart';
import 'dart:io';


class DatabaseHelper {
  final _TAG = "DatabaseHelper";
  final _databaseName = "Book.db";
  final _databaseTableName = "BookDetails";
  final _databaseVersion = 1;
  final _columnId = "Id";
  final _columnBookName = "BookName";
  final _columnBookId = "BookId";
  final _columnAuthor = "Author";

  static Database? _database;

  static final DatabaseHelper instance = DatabaseHelper.init();

  DatabaseHelper.init(){
    developer.log("Creating instance of database", name: _TAG);
    startDatabaseCreation();
  }

  Future<Database?> startDatabaseCreation() async{
    if(_database == null){
      _database = await _createDatabase();
      return _database;
    }
    else{
      return _database;
    }
  }

  Future<Database> _createDatabase() async{
    //Gives database folder
    Directory databaseDirectory =  await getApplicationDocumentsDirectory();
    //Here database will be created
    String path = join(databaseDirectory.path, _databaseName);
    //Once database is created we will create our table
    var openDatabaseObj = await openDatabase(path, version: _databaseVersion, onCreate: createBookDetailsTable);

    return Future.value(openDatabaseObj);
  }

  Future<void> createBookDetailsTable(Database database, int version) async{
    String createQuery = '''CREATE TABLE "$_databaseTableName" (
    "$_columnId"	INTEGER NOT NULL,
    "$_columnBookName"	TEXT,
    "$_columnBookId"	INTEGER,
    "$_columnAuthor"	TEXT,
    PRIMARY KEY("$_columnId" AUTOINCREMENT)
    )''';
    developer.log("Creating table for Db ", name: _TAG);
    await database.execute(createQuery);
  }

  Future<List<int>> insertBookCatalog(List<BookCatalog> bookData) async{
    List<int> result = [];

    return result;
  }

}