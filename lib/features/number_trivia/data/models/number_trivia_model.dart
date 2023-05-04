import 'package:clean_code_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    required String text,
    required int number,
  }) : super(text: text, number: number);

/**
 * In Dart, we use the factory keyword to identify a default or named constructor.
 *  We use the factory keyword to implement constructors that decides whether to 
 * return a new instance or an existing instance.
 * We must follow some rules when using the factory constructor.
1. The return keyword need to be used.
2.It does not have access to the this keyword.
 */
// Why Map<String, dynamic>
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
