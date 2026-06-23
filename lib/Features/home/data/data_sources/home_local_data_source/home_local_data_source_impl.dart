import 'package:bookly/Features/home/data/data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}