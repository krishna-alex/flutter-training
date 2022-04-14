import 'package:firstapp/Database/book_catalog.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as developer;
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
    //Assign database folder
    Directory databaseDirectory =  await getApplicationDocumentsDirectory();
    //Create database
    String path = join(databaseDirectory.path, _databaseName);
    //Create table after database is created
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
    for(var individualBook in bookData) {
      var bookMap = individualBook.toMap();
      int? rowId = await _database?.insert(_databaseTableName, bookMap);
      developer.log("Individual book data $bookMap inserted with row id $rowId", name: _TAG );
      if( rowId != null){
        result.add(rowId);
      }
    }
    return result;
  }

  //Fetch the data from database
  Future<List<BookCatalog>> queryAllRows() async{
    final List<Map<String, Object?>> queryResult = await _database!.query(_databaseTableName);
    List<BookCatalog> bookListFromDb = [];
    for(var individualBookData in queryResult){
      developer.log("Individual data $individualBookData");
      BookCatalog currentBook = BookCatalog.fromMap(individualBookData);
      bookListFromDb.add(currentBook);
    }
    return bookListFromDb;
  }

  ///Update one row at a time into database
  Future<int?> updateData(Map<String, dynamic> bookData) async{
    Database? db= await _database;
    int updatedId = bookData[_columnId];
    int? updatedRowNum =  await db?.update(_databaseTableName, bookData, where: "$_columnId = ?", whereArgs: [updatedId]);
    return updatedRowNum;
  }

  ///Delete one row at a time from database
  Future<int?> deleteData(int rowId) async{
    Database? db= await _database;
    int? deletedRowNum =  await db?.delete(_databaseTableName, where: "$_columnId = ?", whereArgs: [rowId]);
    return deletedRowNum;
  }
}