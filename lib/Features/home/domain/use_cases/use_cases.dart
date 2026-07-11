import 'package:dartz_plus/dartz_plus.dart';

import '../../../../core/errors/failure.dart';

// Generic class
abstract class FetchBooksUseCase<T, Param> {
  Future<Either<Failure,T>> call([Param? param]);
}

class NoParam{}
