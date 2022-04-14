
import 'package:firstapp/Database/input_field_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:firstapp/Database/database_helper.dart';
import 'package:firstapp/Database/book_catalog.dart';



class InputInformation extends StatelessWidget {
  final _TAG = "InputInformation";
  final _databaseHelper = DatabaseHelper.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController IdController = TextEditingController();
  TextEditingController AuthorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Catalog Form"),),
      body: Center(
        child: Column(
          children: [
            Text("Book Catalog Form"),
            /*ElevatedButton(onPressed: (){
              developer.log("Database memory location at 1 ${_databaseHelper.hashCode} ", name: _TAG);

            }, child: Text("Test 1")),*/

            InputFieldContainer(textInputType: TextInputType.text,controller: nameController,hint: "Enter Book Name"),
            SizedBox(
              height: 10,
            ),
            InputFieldContainer(textInputType: TextInputType.text,controller: IdController,hint: "Enter Book Id"),
            SizedBox(
              height: 10,
            ),
            InputFieldContainer(textInputType: TextInputType.text,controller: AuthorController,hint: "Enter Author"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () async {
              insertBookData();
            },child: Text("Insert")),

            ElevatedButton(onPressed: () async{
              var book = await _databaseHelper.queryAllRows();
              developer.log("Book details $book", name: _TAG);
            }, child: Text("Get Data")),

            ElevatedButton(onPressed: () async{
              updateData();
            }, child: Text("Update Data")),

            ElevatedButton(onPressed: () async{
              deleteData();
            }, child: Text("Delete Data")),
          ],
        )
      )
    );
  }
  Future<bool> insertData() async{
    developer.log("Line inside insertdata function", name: _TAG);
    bool abc = false;

    Future.delayed(Duration(seconds: 5), (){
      developer.log("Five seconds have elapsed ", name: _TAG);
      abc = true;

      return Future.value(abc);
    });

    return Future.value(abc);
  }

  void insertBookData(){
    String name = nameController.text;
    int id = int.parse(IdController.text);
    String author = AuthorController.text;
    BookCatalog bookCatalog = BookCatalog(bookName: name, bookId: id, author: author);
    List<BookCatalog> bookList = [];
    bookList.add(bookCatalog);
    _databaseHelper.insertBookCatalog(bookList);
  }

  void updateData() async{
    String name = nameController.text;
    String id = IdController.text;
    int idNumber = int.parse(IdController.text) ;
    String author = AuthorController.text;
    Map<String, dynamic> bookDataMap = {
      "Id" : 1,
      "BookName" : name,
      "Author" : author,
      "BookId" : idNumber,
    };
    await _databaseHelper.updateData(bookDataMap);
  }

  void deleteData() async{
    int id = 1;
    await _databaseHelper.deleteData(id);
  }
}