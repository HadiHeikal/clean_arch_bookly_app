import 'package:dartz_plus/dartz_plus.dart';

import '../../../../core/errors/failure.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure,T>> call([Param? param]);
}

class NoParam{}
