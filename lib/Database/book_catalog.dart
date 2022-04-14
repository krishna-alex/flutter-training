class BookCatalog{
  String bookName;
  int bookId;
  String author;

  BookCatalog({required this.bookName, required this.bookId, required this.author});

  @override
  String toString() {
    return "Book name $bookName, id $bookId and author $author";
  }


  BookCatalog.fromMap(Map<String, dynamic> res)
    :   bookId = res["BookId"],
        bookName = res["BookName"],
        author = res["Author"];

  Map<String, dynamic> toMap(){
    return {
      'BookName' : bookName,
      'BookId' : bookId,
      'Author' : author,
    };
  }
}