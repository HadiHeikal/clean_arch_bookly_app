import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz_plus/dartz_plus.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo ;

  FetchFeaturedBooksUseCase(this.homeRepo);

  // method to fetch featured books
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks(){
    return homeRepo.fetchFeaturedBooks();
  }
}