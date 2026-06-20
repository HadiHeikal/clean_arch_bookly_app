import 'package:dartz_plus/dartz_plus.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';

// ---------- determine home features ----------
abstract class HomeRepo {
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks();
}

