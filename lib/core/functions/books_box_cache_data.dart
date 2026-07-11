
import 'package:hive/hive.dart';

import '../../Features/home/domain/entities/book_entity.dart';

// cache the List of books entity at booksBox [Hive]
void saveDataAtBooksBox({required List<BookEntity> booksList,required String boxName }){
  var booksBox = Hive.box(boxName);
  booksBox.addAll(booksList);
}

// retrieve the List of books entity from booksBox by box name [Hive]
List<BookEntity> getDataFromBooksBox({required String boxName }){
  var booksBox = Hive.box<BookEntity>(boxName);
  List<BookEntity> listOfFeaturedBooks = booksBox.values.toList();
  return listOfFeaturedBooks;
}

