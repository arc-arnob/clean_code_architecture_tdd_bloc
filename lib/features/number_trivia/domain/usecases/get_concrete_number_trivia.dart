import 'package:clean_code_architecture_tdd/core/error/faliures.dart';
import 'package:clean_code_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

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
