part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaState {}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;
  Loaded({required this.trivia});
}

class Error extends NumberTriviaState {
  final String message;
  Error({required this.message});
}
