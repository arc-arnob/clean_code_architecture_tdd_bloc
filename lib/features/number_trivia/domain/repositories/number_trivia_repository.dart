import 'package:clean_code_architecture_tdd/core/error/faliures.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

// Repositories are just contracts
abstract class NumberTriviaRepository {
  Future<Either<Faliure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Faliure, NumberTrivia>> getRandomNumberTrivia();
}
