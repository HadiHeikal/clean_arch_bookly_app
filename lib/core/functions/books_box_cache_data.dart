
import 'package:hive/hive.dart';

import '../../Features/home/domain/entities/book_entity.dart';

// cache the List of books entity at booksBox [Hive]
void saveDataAtBooksBox({required List<BookEntity> booksList,required String kFeaturedBox }){
  var booksBox = Hive.box(kFeaturedBox);
  booksBox.addAll(booksList);
}