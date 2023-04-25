part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaEvent {}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString; // this is be taken from input value of Text UI
  GetTriviaForConcreteNumber(this.numberString);
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}
