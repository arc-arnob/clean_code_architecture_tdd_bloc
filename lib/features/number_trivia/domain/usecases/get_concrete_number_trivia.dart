import 'package:clean_code_architecture_tdd/core/error/faliures.dart';
import 'package:clean_code_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  // constructor takes a NumberTriviaRepository object as a parameter and assigns it to a repository
  final NumberTriviaRepository repository;
  // Dependency Injection
  GetConcreteNumberTrivia(this.repository);
  // What is the use of call here?
  @override
  Future<Either<Faliure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

// Equatable, https://pub.dev/packages/equatable#what-does-equatable-do
class Params extends Equatable {
  final int number;
  Params({required this.number});
  @override
  List<Object> get props => [number];
}
