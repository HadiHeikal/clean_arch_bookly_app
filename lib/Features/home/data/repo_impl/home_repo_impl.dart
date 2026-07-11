import 'package:bookly/Features/home/data/data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz_plus/dartz_plus.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/functions/books_box_cache_data.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeLocalDataSource homeLocalDataSource ;
  final HomeRemoteDataSource homeRemoteDataSource ;

  HomeRepoImpl(this.homeLocalDataSource, {required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try{
      // retrieve cached books
      final localBooks = await homeLocalDataSource.fetchFeaturedBooks();
      if(localBooks.isNotEmpty) {
        return Either.right(localBooks);
      }

      // if there are no local books --> fetch box, then cache it
      final remoteBooks = await homeRemoteDataSource.fetchFeaturedBooks();
      saveDataAtBooksBox(booksList: remoteBooks, boxName: kFeaturedBooksBox);

      return Either.right(remoteBooks);
    }catch(e){
      if(e is DioException){
        return Either.left(ServerFailure(e.toString()));
      }
      return Either.left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{
    try{
      // retrieve cached books
      final localBooks = await homeLocalDataSource.fetchNewestBooks();
      if(localBooks.isNotEmpty) {
        return Either.right(localBooks);
      }

      // if there are no local books --> fetch box, then cache it
      final remoteBooks = await homeRemoteDataSource.fetchNewestBooks();
      saveDataAtBooksBox(booksList: remoteBooks, boxName: kNewestBooksBox);

      return Either.right(remoteBooks);
    }catch(e){
      if(e is DioException){
        return Either.left(ServerFailure(e.toString()));
      }
      return Either.left(Failure(e.toString()));
    }
  }

}