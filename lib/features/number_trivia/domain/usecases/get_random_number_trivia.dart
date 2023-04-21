import 'package:clean_code_architecture_tdd/core/error/faliures.dart';
import 'package:clean_code_architecture_tdd/core/usecases/usecase.dart';
import 'package:clean_code_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);
  @override
  Future<Either<Faliure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
