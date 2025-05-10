import 'package:dartz/dartz.dart';
import 'package:konkan_bite_food/core1/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;
