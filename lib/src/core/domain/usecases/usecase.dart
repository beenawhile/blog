import 'package:dartz/dartz.dart';

import '../entities/failure.dart';

abstract class Usecase<Type, Params> {
  const Usecase();
  Future<Either<Failure, Type>> call(Params params);
}
