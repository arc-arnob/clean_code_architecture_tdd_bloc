import 'package:clean_code_architecture_tdd/core/error/faliures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Faliure, Type>> call(Params params);
}
