import 'package:bookly/Features/home/data/data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/constants/strings.dart';
import '../../../../../core/utils/functions/books_box_cache_data.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    List<BookEntity> listOfFeaturedBooks = getDataFromBooksBox(boxName: kFeaturedBooksBox);
    return listOfFeaturedBooks;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    List<BookEntity> listOfNewestBooks = getDataFromBooksBox(boxName: kFeaturedBooksBox);
    return listOfNewestBooks;
  }
}