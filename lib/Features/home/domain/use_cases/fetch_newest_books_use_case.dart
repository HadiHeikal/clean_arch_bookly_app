import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/domain/use_cases/use_cases.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz_plus/dartz_plus.dart';
import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
  final HomeRepo homeRepo ;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.fetchNewestBooks();
  }
}